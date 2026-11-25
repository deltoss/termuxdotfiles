# Set the login shell after Chezmoi has deployed the wrapper.
^chsh -s ($nu.home-dir | path join ".local/bin/nu-termux")
