#!/bin/zsh

# Check if tmux server is running
if ! tmux has-session 2>/dev/null; then
    echo "Session name: "
    read session_name
    if [[ "$session_name" == "" ]]; then
        tmux new-session
    else
        tmux new-session -s ${session_name}
    fi
else
    IFS=$'\n'
    sessions="$(tmux ls)"
    echo ${sessions}
    sessionNames=()
    while IFS= read --r line; do
        sessionName=$(echo "$line" | awk '{print $1}' | tr -d ":")
        sessionNames+=("$sessionName")
    done <<< "$sessions"

    echo "Enter session you want to attach to: "
    read desired_session
    
    foundSession=false
    for session in "${sessionNames[@]}"; do
        if [[ "$session" == "$desired_session" ]]; then
            tmux attach-session -t "$session"
            foundSession=true
            break
        fi
    done

    if [[ $foundSession == false ]]; then
        tmux new-session -s "$desired_session"
    fi
fi

return 0

