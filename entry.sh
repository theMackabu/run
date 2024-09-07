#!/usr/bin/env bash

export RUN_SCRIPTS_DIR="$HOME/.local/scripts/commands"
ALIAS_CONF="$HOME/.local/scripts/alias.conf"

if [ -n "$ZSH_VERSION" ]; then
	typeset -A alias_list
else
	declare -A alias_list
fi

if [[ -f "$ALIAS_CONF" && -r "$ALIAS_CONF" ]]; then
	alias_content=$(<"$ALIAS_CONF")
	 
	while IFS='=' read -r key value; do		 
		if [[ $value == \"* ]]; then
			value="${value:1:-1}"
		fi
		alias_list[$key]=$value
	done <<< "$alias_content"
fi


function run {    
	local command_name="$1"
	local script_name="${alias_list[$command_name]:-$command_name}"
	local script_path="$RUN_SCRIPTS_DIR/${script_name}.sh"
	
	if [[ -x "$script_path" ]]; then (
		source "$script_path"
		  
		if declare -f module > /dev/null; then
			module "$@"
		else
			echo "Error: module function not found in $script_path" >&2
			return 1
		fi 
	) else
		echo "Error: Script not found or not executable: $script_path" >&2
		return 1
	fi
}