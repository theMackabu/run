export RUN_SCRIPTS_DIR="$HOME/.local/scripts"
ALIAS_CONF="$HOME/.local/scripts/alias.conf"

if [[ -f "$ALIAS_CONF" ]]; then
	source "$ALIAS_CONF"
fi

function run {
	local command_name="$1"
	local script_name="${alias_list[$command_name]:-$command_name}"
	local script_path="$RUN_SCRIPTS_DIR/${script_name}.sh"

	if [[ -x "$script_path" ]]; then (
		source "$script_path"
		
		if command -v module > /dev/null 2>&1; then
			module "$@"
		else
			echo "Error: module function not found in $script_path" >&2
			exit 1
		fi 
	 ) else
		echo "Error: Script not found or not executable: $script_path" >&2
		return 1
	fi
}