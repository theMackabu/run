# bootstrappable command runner

This project provides a flexible system for executing custom scripts and commands in a shell environment, with support for aliases.

## Overview

The system consists of three main components:

1. `entry.sh`: The core script that sets up the environment and defines the `run` function.
2. `.zshrc`: An example of how to integrate the system into your shell configuration.
3. `alias.conf`: A configuration file for defining command aliases.

## Installation

1. Place the `entry.sh` script in `$HOME/.local/scripts/`.
2. Place your custom command scripts in `$HOME/.local/scripts/commands/`.
3. Create an `alias.conf` file in `$HOME/.local/scripts/`.
4. Add the following line to your `.zshrc` file:

   ```bash
   source $HOME/.local/scripts/entry.sh
   ```

## Usage

Once installed, you can use the `run` function to execute your custom commands:

```bash
run <script_name> [arguments]
```

If an alias is defined for `script_name`, the system will execute the corresponding script instead.

## Custom Scripts

Create your custom scripts in the `$HOME/.local/scripts/commands/` directory. Each script should:

1. Have a `.sh` extension
2. Be executable (`chmod +x script_name.sh`)
3. Define a `module` function that accepts arguments

Example:

```bash
#!/bin/bash

function module {
	echo "Hello, World!"
	echo "Arguments: $@"
}
```

## Aliases

Define aliases in the `alias.conf` file using the following format:

```bash
alias_name="script_name"
```

For example, the provided `alias.conf` maps the `ls` command to the `list` script:

```bash
ls="list"
```

With this alias, running `run ls` will execute the `list.sh` script instead of `ls.sh`.

## Error Handling

The system provides basic error handling:

- If a script is not found or not executable, an error message will be displayed.
- If a script doesn't define a `module` function, an error message will be displayed.

## Customization

You can customize the system by modifying the following variables in `entry.sh`:

- `RUN_SCRIPTS_DIR`: The directory containing your custom scripts
- `ALIAS_CONF`: The path to your alias configuration file
