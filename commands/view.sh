function module {
	local script_name="$2"
	local script_path="$RUN_SCRIPTS_DIR/${script_name}.sh"
	 
	if [[ ! -f "$script_path" ]]; then
		echo "Error: Script not found: $script_path" >&2
		return 1
	fi
	 
	if command -v bat &> /dev/null; then
		bat "$script_path"
	else
		cat "$script_path" | less
	fi
}