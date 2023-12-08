#!/usr/bin/env bash
set -euxo pipefail

export LC_ALL=en_US.UTF-8

# Options
left_separator              = ""
right_separator             = ""

tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

# message styling
tmux set-option -g message-style "bg=${PALETTE[red]},fg=${PALETTE[bg_dark]}"

# status bar
tmux set-option -g status-style "bg=${PALETTE[bg_highlight]},fg=${PALETTE[white]}"

# border color
tmux set-option -g pane-active-border-style "fg=${PALETTE['dark5']}"
tmux set-option -g pane-border-style "fg=${PALETTE[bg_highlight]}"

# Left side
tmux set-option -g status-left ""

# Windows list
tmux set-window-option -g window-status-format "" 
tmux set-window-option -g window-status-current-format ""

# Right side
tmux set-option -g status-right ""


tmux set-window-option -g window-status-separator ""
