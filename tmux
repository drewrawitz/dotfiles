# remap prefix to Control + a
set -g prefix C-a
unbind C-b

# send CTRL-a to an application running within tmux simply by pressing CTRL-a twice.
bind C-a send-prefix

# Start numbering at 1
set -g base-index 1
setw -g pane-base-index 1

# Allows for faster key repetition
set -s escape-time 1

# bind prefix r to reload the tmux.conf file
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Splitting Panes
bind | split-window -h
bind - split-window -v

# Moving from pane to pane
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resizing Panes
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Disable mouse mode
setw -g mode-mouse off

# 256 color mode
set -g default-terminal "screen-256color"

# Change status bar colors
set -g status-fg white
set -g status-bg black

# Change window list colors
setw -g window-status-fg cyan
setw -g window-status-bg default
setw -g window-status-attr dim
setw -g window-status-current-fg white
setw -g window-status-current-bg red
setw -g window-status-current-attr bright

# Change pane divider colors
set -g pane-border-fg green
set -g pane-border-bg black
set -g pane-active-border-fg white
set -g pane-active-border-bg yellow

# Customizing the command line
set -g message-fg white
set -g message-bg black
set -g message-attr bright

# Customizing the Status Bar
set -g status-left-length 40 
set -g status-left "#[fg=green]Session: #S #[fg=yellow]#I #[fg=cyan]#P"
set -g status-right "#[fg=cyan]%d %b %R"
set -g status-utf8 on
set -g status-interval 60
set -g status-justify centre

# Identifying Activity in Other Windows
setw -g monitor-activity on
set -g visual-activity on

# Set window clock to 12 hours
set-window-option -g clock-mode-style 12