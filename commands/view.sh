function module {
	local script_path="$RUN_SCRIPTS_DIR/$2.sh"
	 
	if [[ ! -f "$script_path" ]]; then
		print -u2 "Error: Script not found: $script_path"
		return 1
	fi
	 
	if (( $+commands[bat] )); then
		bat "$script_path"
	else less "$script_path"; fi
}