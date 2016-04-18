/**
 * Phoenix
 * doc: https://github.com/jasonm23/phoenix/wiki/JavaScript-API-documentation
 *
 * Global Settings
 */

var keys = [];
var oldWindowFrames = {};
var mash = ["alt", "cmd", "ctrl"];
var mousePositions = {};
var HIDE_INACTIVE_WINDOW_TIME = 10;  // minitus
var ACTIVE_WINDOWS_TIMES = {};
var DEFAULT_WIDTH = 1280;


/**
 * Utils Functions
 */

function alert(message) {
  var modal = new Modal();
  modal.message = message;
  modal.duration = 2;
  modal.show();
}

function assert(condition, message) {
  if (!condition) {
    throw message || "Assertion failed";
}
}

if (!String.format) {
  String.format = function(format) {
  var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function(match, number) {
      return typeof args[number] != 'undefined'
      ? args[number]
      : match
      ;
    });
  };
}

var alert_title = function(window) { Modal.show(window.title()); };

/**
 * Window Functions
 */

function heartbeat_window(window) {
  ACTIVE_WINDOWS_TIMES[window.app().pid] = new Date().getTime() / 1000;
  //hide_inactiveWindow(window.otherWindowsOnSameScreen());
}

function getAnotherWindowsOnSameScreen(window, offset) {
  var start = new Date().getTime();
  var windows = window.otherWindowsOnSameScreen(); // slow, makes `Saved spin report for Phoenix version 1.2 (1.2) to /Library/Logs/DiagnosticReports/Phoenix_2015-05-30-170354_majin.spin`
  windows.push(window);
  windows = _.chain(windows).sortBy(function(window) {
    return [window.frame().x, window.frame().y, window.app().pid, window.title()].join('_');
  }).value().reverse();
  return windows[(_.indexOf(windows, window) + offset + windows.length) % windows.length];
}

function getNextWindowsOnSameScreen(window) {
  return getAnotherWindowsOnSameScreen(window, -1)
};

function getPreviousWindowsOnSameScreen(window) {
  return getAnotherWindowsOnSameScreen(window, 1)
};

function setWindowCentral(window) {
  if (!checkWindowPosition(window, frameForWindowRight(window)) && !checkWindowPosition(window, frameForWindowLeft(window)) && !checkWindowPosition(window, frameForWindowFull(window))) {
    oldWindowFrames[window.title()] = {
      x: window.frame().x - window.screen().visibleFrameInRectangle().x,
      y: window.frame().y - window.screen().visibleFrameInRectangle().y,
      width: window.frame().width,
      height: window.frame().height
    };
  }
  window.setTopLeft({
    x: (window.screen().frameInRectangle().width - window.size().width) / 2 + window.screen().frameInRectangle().x,
    y: (window.screen().frameInRectangle().height - window.size().height) / 2 + window.screen().frameInRectangle().y
  });
  heartbeat_window(window);
};

function setWindowRestore(window) {
  var oldWindow = oldWindowFrames[window.title()];
  if (oldWindow) {
    oldScreen = window.screen().visibleFrameInRectangle();
    if (oldWindow.x == 0) {
      oldWindow.x = 1;
    } else if (oldWindow.x == oldScreen.width / 2) {
      oldWindow.x = oldWindow.x - 1;
    }
    window.setFrame({
      x:      oldScreen.x + oldWindow.x,
      y:      oldScreen.y + oldWindow.y,
      width:  oldWindow.width,
      height: oldWindow.height
    });
    return true;
  } else {
    return false;
  }
};

function checkWindowPosition(window, frame) {
  if (!window) return false;
  return (window.frame().x == frame.x && (window.frame().y - frame.y) < 50 &&
    window.frame().width == frame.width && (frame.height - window.frame().height) < 50);
}

function setWindowPosition(window, frame) {
  if (!window) return;
  if (checkWindowPosition(window, frame)) {
    return false;
  } else {
    // alert(frame.width + " " + frame.height + " " + window.frame().width + " " + window.frame().height);
    // alert(frame.x + " " + frame.y + " " + window.frame().x + " " + window.frame().y);
    if (!checkWindowPosition(window, frameForWindowRight(window)) && !checkWindowPosition(window, frameForWindowLeft(window)) && !checkWindowPosition(window, frameForWindowFull(window))) {
      oldWindowFrames[window.title()] = {
        x: window.frame().x - window.screen().visibleFrameInRectangle().x,
        y: window.frame().y - window.screen().visibleFrameInRectangle().y,
        width: window.frame().width,
        height: window.frame().height
      };
    }
    window.setFrame(frame);
    heartbeat_window(window);
    return true;
  }
}

function moveWindowLeft(window) {
  var oldWindow = window.frame(),
  oldScreen = window.screen().visibleFrameInRectangle(),
  screen    = window.screen().next().visibleFrameInRectangle();

  window.setFrame({
    x:      screen.x + ((oldWindow.x - oldScreen.x) / oldScreen.width) * screen.width + oldScreen.width / 2,
    y:      screen.y + ((oldWindow.y - oldScreen.y) / oldScreen.height) * screen.height,
    width:  screen.width * (oldWindow.width / oldScreen.width),
    height: window.height * (oldWindow.height / oldScreen.height),
  });
}

function moveWindowRight(window) {
  var oldWindow = window.frame(),
  oldScreen = window.screen().visibleFrameInRectangle(),
  screen    = window.screen().previous().visibleFrameInRectangle();

  window.setFrame({
    x:      screen.x + ((oldWindow.x - oldScreen.x) / oldScreen.width) * screen.width - oldScreen.width / 2,
    y:      screen.y + ((oldWindow.y - oldScreen.y) / oldScreen.height) * screen.height,
    width:  screen.width * (oldWindow.width / oldScreen.width),
    height: window.height * (oldWindow.height / oldScreen.height),
  });
}

function frameForWindowLeft(window) {
  return {
    x: window.screen().visibleFrameInRectangle().x,
    y: window.screen().visibleFrameInRectangle().y,
    width: window.screen().frameInRectangle().width / 2,
    height: window.screen().frameInRectangle().height
  };
}

function setWindowLeft(window) {
  var frame = frameForWindowLeft(window);
  if (checkWindowPosition(window, frameForWindowRight(window)) && setWindowRestore(window)) {
  } else if (!setWindowPosition(window, frame)) {
    if (window.screen() === window.screen().next()) return;
    moveWindowLeft(window);
  }
};

function frameForWindowRight(window) {
  return {
    x: window.screen().visibleFrameInRectangle().x + window.screen().frameInRectangle().width / 2,
    y: window.screen().visibleFrameInRectangle().y,
    width: window.screen().frameInRectangle().width / 2,
    height: window.screen().frameInRectangle().height
  };
}

function setWindowRight(window) {
  var frame = frameForWindowRight(window);
  if (checkWindowPosition(window, frameForWindowLeft(window)) && setWindowRestore(window)){
  } else if (!setWindowPosition(window, frame)) {
    if (window.screen() === window.screen().next()) return;
    moveWindowRight(window);
  }
};

function frameForWindowFull(window) {
  return {
    x: window.screen().visibleFrameInRectangle().x,
    y: window.screen().visibleFrameInRectangle().y,
    width: window.screen().frameInRectangle().width,
    height: window.screen().frameInRectangle().height
  };
}

/**
 * My Configuration Window
 */

// Window Maximize
keys.push(Phoenix.bind('space', mash, function() {
  var window = Window.focusedWindow();
  if (!window) return;
  window.maximize();
  heartbeat_window(window);
}));

// Window <
keys.push(Phoenix.bind('left', mash, function() {
  var window = Window.focusedWindow();
  if (!window) return;
  setWindowLeft(window);
}));

// Window >
keys.push(Phoenix.bind('right', mash, function() {
  var window = Window.focusedWindow();
  if (!window) return;
  setWindowRight(window);
}));
