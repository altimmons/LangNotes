#!/bin/bash

cat<<EOF
###############################################################################
#    Byobu f-key keybindings
#      This configuration profile is intended to provide a useful
#      keybindings using the keyboard's f-keys
#
#    Copyright (C) 2008  Nick Barcet <nick.barcet@canonical.com>
#                        Dustin Kirkland <kirkland@canonical.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

# F-keys seem to work well in both gnome-terminal and tty consoles
							# F1  | 'help' in gnome-terminal
bindkey -k k2 screen					# F2  | Create new window
bindkey -k k3 prev					# F3  | Previous Window
bindkey -k k4 next					# F4  | Next Window
register r "^a:source $HOME/.byobu/profile^M"		#     | Goes with F5 definition
bindkey -k k5 process r					# F5  | Reload profile
bindkey -k k6 detach					# F6  | Detach from this session
bindkey -k k7 copy					# F7  | Enter copy/scrollback mode
register t "^aA^aa^k^h"					#     | Goes with the F8 definition
bindkey -k k8 process t 				# F8  | Re-title a window
bindkey -k k9 screen -t config 0 byobu-config		# F9  | Configuration
							# F10 | 'toolbar' in gnome-terminal
							# F11 | 'fullscreen' in gnome-terminal
bindkey -k F2 lockscreen				# F12 | Lock this terminal
bind $ screen -t status 0 byobu-status-detail 		# ctrl-a $ | show detailed status
bind @ screen -t config 0 byobu-config			# ctrl-a @ | Configuration
bind R process r					# ctrl-a R | Reload profile
register s "^a[g G$>^h"					# Goes with ^a~ definition
bind ~ eval 'process s' 'exec sed -i "/./,/^$/!d" /var/run/screen/S-$USER/byobu-exchange' 'echo "See: /var/run/screen/S-$USER/byobu-exchange"' # ctrl-a ~ | write the buffer to file

# toggle f-key keybindings off
register d "^a:source /usr/share/byobu/keybindings/screen-escape-keys^M"
bind ! eval 'process d' 'backtick 111 9999999 9999999 byobu-status menu --disable-f-keys'


Byobu  keybindings  can  be  user  defined  in  /usr/share/byobu/keybindings/  (or  within
       .screenrc if byobu-export was used). The common key bindings are:

       F2 - Create a new window
       shift-F2 - Split the screen horizontally
       ctrl-F2 - Split the screen vertically


       F3 - Move to previous window
       shift-F3 - Shift the focus to the previous split region

       F4 - Move to next window
       shift-F4 - Shift the focus to the next split region

       F5 - Reload profile
       shift-F5 - Join all splits
       ctrl-F5 - Reconnect GPG and SSH sockets

       F6 - Detach from this session
       shift-F6 - Detach, but do not logout
       ctrl-F6 - Remove this split

       F7 - Enter copy/scrollback mode

       F8 - Re-title a window

       F9 - Configuration Menu


       F12 -  Lock this terminal


       alt-pgup - Enter scrollback mode
       alt-pgdn - Enter scrollback mode

       Ctrl-a $ - show detailed status
       Ctrl-a R - Reload profile
       Ctrl-a ~ - Save the current window's scrollback buffer
       Ctrl-a ! - Toggle key bindings on and off
       Ctrl-a k - Kill the current window



F1                  * Used by X11 *
    Shift-F1            Display this help
F2                  Create a new window
    Shift-F2            Create a horizontal split
    Ctrl-F2             Create a vertical split
    Ctrl-Shift-F2       Create a new session
F3/F4              Move focus among windows
    Ctrl-Shift-F3/F4    Move a window

Shift-Alt-Left/Right/Up/Down    Resize a split
Alt-PageUp/PageDown          Enter and move through scrollback

F5                  Reload profile, refresh status
    Alt-F5              Toggle UTF-8 support, refresh
    Shift-F5            Toggle through status lines
    Ctrl-F5             Reconnect ssh/gpg/dbus sockets
    Ctrl-Shift-F5       Change status bar's color randomly
F6                  Detach session and then logout
    Shift-F6            Detach session and do not logout
    Alt-F6              Detach all clients but yourself
    Ctrl-F6             Kill split in focus
F7                  Enter scrollback history
    Shift-F7            Save history to $BYOBU_RUN_DIR/printscreen
F8                  Rename the current window
    Ctrl-F8             Rename the current session
    Shift-F8            Toggle through split arrangements
    Alt-Shift-F8        Restore a split-pane layout
    Ctrl-Shift-F8       Save the current split-pane layout
F9                  Launch byobu-config window
    Ctrl-F9             Enter command and run in all windows
    Shift-F9            Enter command and run in all splits
    Alt-F9              Toggle sending keyboard input to all splits
F10                 * Used by X11 *
F11                 * Used by X11 *
    Alt-F11             Expand split to a full window
    Shift-F11           Zoom into a split, zoom out of a split
    Ctrl-F11            Join window into a vertical split
F12                 Escape sequence
    Shift-F12           Toggle on/off Byobu's keybindings
    Alt-F12             Toggle on/off Byobu's mouse support
    Ctrl-Shift-F12      Mondrian squares
EOF
