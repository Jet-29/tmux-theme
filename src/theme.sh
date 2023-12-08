#!/usr/bin/env bash
set -euxo pipefail

# Palette
text_dark="#3b4261"
text_light="#ffffff"

message_bg="#ff6c4d"
message_fg="#16161e"

status_bg="#292E42"
status_fg="#ffffff"

pane_border_bg="#16161e"
pane_border_active_bg="#16161e"

session_bg="#55ff55"
session_prefix_bg="#ffa800"

active_window_id_bg="#5555ff"
active_window_bg="#3333ff"

inactive_window_id_bg="#737aa2"
inactive_window_bg="#545C7e"

# Options
left_separator=""
right_separator=""

tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

# message styling
tmux set-option -g message-style "bg=${message_bg},fg=${message_fg}"

# status bar
tmux set-option -g status-style "bg=${status_bg},fg=${status_fg}"

# border color
tmux set-option -g pane-active-border-style "bg=${pane_border_active_bg},fg=${status_bg}"
tmux set-option -g pane-border-style "bg=${pane_border_bg},fg=${status_bg}"

# Left side
left_side="#[fg=${text_dark},bold]#{?client_prefix,#[bg=${session_prefix_bg}],#[bg=${session_bg}]}"
left_side+=" #S "
left_side+="#[bg=${status_bg}]#{?client_prefix,#[fg=${session_prefix_bg}],#[fg=${session_bg}]}"
left_side+="${left_separator}"
left_side+="#[none]"
tmux set-option -g status-left "${left_side}"

# Windows list
# Inactive
separator_start="#[bg=${inactive_window_id_bg},fg=${status_bg}]${left_separator}#[none]"
separator_internal="#[bg=${inactive_window_bg},fg=${inactive_window_id_bg}]${left_separator}#[none]"
separator_end="#[bg=${status_bg},fg=${inactive_window_bg}]${left_separator}#[none]"

inactive_window="${separator_start}#[fg=${text_light}]#I${separator_internal}#[fg=${text_light}] #W ${separator_end}"

# # Active
separator_start="#[bg=${active_window_id_bg},fg=${status_bg}]${left_separator}#[none]"
separator_internal="#[bg=${active_window_bg},fg=${active_window_id_bg}]${left_separator}#[none]"
separator_end="#[bg=${status_bg},fg=${active_window_bg}]${left_separator}#[none]"

active_window="${separator_start}#[fg=${text_light}]#I${separator_internal}#[fg=${text_light}] #W ${separator_end}"

tmux set-window-option -g window-status-format "${inactive_window}" 
tmux set-window-option -g window-status-current-format "${active_window}"

# TODO: add plugin stuff to the right side like time and cpu usage maybe.
# Right side
# tmux set-option -g status-right ""


# tmux set-window-option -g window-status-separator ""
