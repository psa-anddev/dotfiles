osascript <<EOF
tell application "iTerm"
	set new_window to (create window with default profile)
	set cSession to current session of new_window
	tell new_window
		tell cSession
			write text "source ~/.iterm2_shell_integration.zsh"
			write text "$@"
			repeat
				delay 0.1
				set isdone to is at shell prompt
				if isdone then exit repeat
			end repeat
			close new_window
		end tell
	end tell
end tell
EOF

