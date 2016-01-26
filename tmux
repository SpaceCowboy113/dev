
#### COLOR (Solarized 256)

#Mouse mode
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

#### END COLOR

set -g default-terminal "screen-256color"
set -g prefix c-a
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

#Fixes vim lag
set -sg escape-time 0

# map Vi movement keys as pane movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# and use C-h and C-l to cycle thru panes
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# resize panes using PREFIX H, J, K, L
bind H resize-pane -L 5
bind J resize-pane -D 5
bind K resize-pane -U 5
bind L resize-pane -R 5

# explicitly disable mouse control
#setw -g mode-mouse off
#set -g mouse-select-pane off
#set -g mouse-resize-pane off
#set -g mouse-select-window off

# ----------------------
# set some pretty colors
# ----------------------
# set pane colors - hilight the active pane
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# colorize messages in the command line
set-option -g message-bg black #base02
set-option -g message-fg brightred #orange

# ----------------------
# Status Bar
# -----------------------
set-option -g status on                # turn the status bar on
set -g status-utf8 on                  # set utf-8 for the status bar
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
# set-option -g status-position top    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim

# set window list colors - red for active and cyan for inactive
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236
set-window-option -g window-status-attr dim

set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour236
set-window-option -g window-status-current-attr bright

# show host name and IP address on left side of status bar
set -g status-left-length 70
set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(curl icanhazip.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

# show session name, window & pane number, date and time on right side of
# status bar
#set -g status-right-length 60
#set -g status-right "#[fg=blue]#S #I:#P #[fg=yellow]:: %d %b %Y #[fg=green]:: %l:%M %p :: #(date -u | awk '{print $4}')::"
# in .tmux.conf
set -g status-right 'Batt: #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h-%d %H:%M '

set-window-option -g mode-keys vi
set -g status-keys vi
bind-key -t vi-edit Up history-up
bind-key -t vi-edit Down history-down

# Smart pane switching with awareness of vim splits
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?x?)(diff)?$"'
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# Highlight searches with tmux
#set -g terminal-overrides 'rxvt-unicode*:sitm@,ritm@'

# Plugins
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-battery'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
