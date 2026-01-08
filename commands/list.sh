function module {
	echo "Available scripts:"
	local exclude_names="run|list|info|view|help"
	
	for script in "$RUN_SCRIPTS_DIR"/**/*.sh; do
		[[ -f "$script" && -x "$script" ]] || continue
		
		local name=$(basename "$script" .sh)
		[[ "$name" =~ ^($exclude_names)$ ]] && continue
		
		local dir=$(basename "$(dirname "$script")")
		if [[ "$dir" == "commands" ]]; then
			echo "- $name"
		else echo "- $dir/$name"; fi
	done
}