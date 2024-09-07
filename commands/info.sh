function module {
	local script_name="$2"
	local script_path="$RUN_SCRIPTS_DIR/${script_name}.sh"
	
	if [[ ! -f "$script_path" ]]; then
		echo "Error: Script not found: $script_path" >&2
		return 1
	fi
	
	echo "Script Information:"
	echo " - Name: $script_name"
	echo " - Path: $script_path"
	echo " - Size: $(du -h "$script_path" | cut -f1)"
	 
	if [[ "$(uname)" == "Darwin" ]]; then
		echo " - Last Modified: $(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$script_path")"
	else
		echo " - Last Modified: $(stat -c "%y" "$script_path")"
	fi
	 
	if [[ "$(uname)" == "Darwin" ]]; then
		echo " - Permissions: $(stat -f "%Sp" "$script_path")"
	else
		echo " - Permissions: $(stat -c "%A" "$script_path")"
	fi
	 
	local message="To view the full script, use: run view $2"
	printf '%*s\n' "${#message}" | tr ' ' '-'
	echo "$message"
}