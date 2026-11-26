# Termux Dotfiles

Minimal Chezmoi configuration for Android. Reuses [nushell-config](https://github.com/deltoss/nushell-config) (Termux profile) and [kickstart.nvim](https://github.com/deltoss/kickstart.nvim).

## Installation

Install Termux from F-Droid or GitHub. In its default shell:

```sh
pkg update && pkg upgrade
pkg install git nushell chezmoi
chezmoi init deltoss/termuxdotfiles --apply
```

Chezmoi sets `nu-termux` as the default login shell once, after deploying the wrapper and configuration. Open a new Termux session and check `$nu.config-path` and `$nu.env-path`. Both should point to files in `~/.config/nushell/profiles/termux/`.

To restore Bash, run `chsh -s bash`. Subsequent applies will not reset your shell choice unless the setup script changes.

## Updating

```nu
chezmoi update
nu --no-config-file (chezmoi source-path | path join update.nu)
```

The package manifest is in `.chezmoidata/packages.toml`. Package installation runs when the rendered installation script changes. Upgrades are separate.

## Pi and Obsidian

Run `pi` and use `/login` to authenticate with your ChatGPT account. Credentials stay local.

For access to an Obsidian vault in Android shared storage, run `termux-setup-storage` once and grant permission. Then launch Pi with:

```nu
pi-notes ~/storage/shared/Documents/MyVault
```

Replace the path with your vault location. Back up the vault before allowing AI to edit notes.

## Scope

No root, proot, desktop services or password manager. Yazi uses its default configuration with the shared Nushell integration. Zellij uses the managed shell; desktop-specific layout shortcuts require separate layout files. Neovim plugins may need additional native dependencies or Android-specific adjustments. Chezmoi installs JetBrains Mono Nerd Font for Termux icons. Colour overrides are intentionally left unmanaged.

After installing the font or changing extra keys, run `termux-reload-settings`.

The initial setup has not been runtime-tested on Android.
