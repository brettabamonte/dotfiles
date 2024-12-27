## Iterm Setup
1. Settings -> Profile -> General
2. Add `tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}` to Send text at start.
