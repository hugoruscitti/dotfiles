# DOTFILES

Este repositorio tiene una copia de mis archivos de configuración principales
de vim, fish, y otras herramientas.


```
ln -s ~/proyectos/dotfiles/alacritty.yml ~/.alacritty.yml
ln -s ~/proyectos/dotfiles/vimrc ~/.vimrc
ln -s ~/proyectos/dotfiles/config.fish ~/.config/fish/fish.config

rm -rf ~/.config/karabiner
ln -s ~/proyectos/dotfiles/karabiner ~/.config/karabiner
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
```
