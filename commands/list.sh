function module {
	echo "Available scripts:"
	
	for script in "$RUN_SCRIPTS_DIR"/*.sh; do
		if [[ -f "$script" && -x "$script" ]]; then
			script_name=$(basename "$script" .sh)
			if [[ "$script_name" != "run" && "$script_name" != "list" && "$script_name" != "info" && "$script_name" != "view" && "$script_name" != "help" ]]; then
				echo "- $script_name"
			fi
		fi
	done
}