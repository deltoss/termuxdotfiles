# Set the login shell after Chezmoi has deployed the wrapper.
let wrapper = ($nu.home-dir | path join ".local" "bin" "nu-termux")
let shell_link = ($nu.home-dir | path join ".termux" "shell")

if ((^test -f $wrapper | complete).exit_code != 0) or ((^test -x $wrapper | complete).exit_code != 0) {
  error make {msg: $"Login shell wrapper must be a regular, executable file: ($wrapper)"}
}

mkdir ($shell_link | path dirname)
^ln -sfT -- $wrapper $shell_link
