# go@latest
function install_go {
	local tools=(
		"golang.org/x/tools/gopls@latest"
		"github.com/go-delve/delve/cmd/dlv@latest"
		"github.com/wailsapp/wails/v2/cmd/wails@latest"
	)
	
	mise upgrade go

	for tool in "${tools[@]}"; do
		if ! go install "$tool"; then echo "Failed to install $tool"; fi
	done
}

function module {
	install_go
}
