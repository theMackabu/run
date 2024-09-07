# go@latest
function install_go {
	local tools=(
		"golang.org/x/tools/gopls@latest"
		"github.com/go-delve/delve/cmd/dlv@latest"
		"github.com/wailsapp/wails/v2/cmd/wails@latest"
	)
	
	mise use go@latest --global

	for tool in "${tools[@]}"; do
		if ! go install "$tool"; then
			echo "Failed to install $tool"
		fi
	done
}

# node@latest
function install_node {
	local packages=(
		"pnpm"
		"@themackabu/yarn2" 
		"create-dmg"
	)
	 
	mise use node@latest --global

	for pkg in "${packages[@]}"; do
		if ! npm install -g "$pkg"; then
			echo "Failed to install npm:$pkg"
		fi
	done
}

function cleanup {
	local node_bin="$HOME/.local/share/mise/installs/node/latest/bin"
	mv "$node_bin/yarn2" "$node_bin/yarn"
}

function module {
	install_go
	install_node
}
