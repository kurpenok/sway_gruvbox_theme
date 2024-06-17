# Gruvbox theme for sway windows manager

<!--
#### Screenshots

![Home screen]("screenshots/homescreen.png")
![Neofetch]("screenshots/neofetch.png")
![Apps menu]("screenshots/wofi.png")
![Console utilities]("screenshots/htop_mc.png")
![Neovim]("screenshots/neovim.png")
-->

#### Quick start

Clone NvChad config for neovim:

```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

Setup skin for midnight commander:

```
mkdir -p ~/.local/share/mc/skins/
cp mc/gruvbox256.ini ~/.local/share/mc/skins
```

Enable battery notifier service:

```
systemctl --user enable ~/.config/systemd/user/battery-notifier.service --now
```
