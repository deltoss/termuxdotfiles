let manifest = (path self . | path join ".chezmoidata" "packages.toml")
let packages = (open $manifest).packages

^pkg upgrade -y
^npm install --global --ignore-scripts ...$packages.npm
