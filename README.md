# DOTFILES

Este repositorio tiene una copia de mis archivos de configuración principales
de vim, fish, y otras herramientas.


```
ln -s ~/proyectos/dotfiles/alacritty.yml ~/.alacritty.yml
ln -s ~/proyectos/dotfiles/vimrc ~/.vimrc
ln -s ~/proyectos/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/proyectos/dotfiles/urls_newsboat.txt ~/.newsboat/urls
ln -s proyectos/dotfiles/tmux.conf ~/.tmux.conf

rm -rf ~/.config/karabiner
ln -s ~/proyectos/dotfiles/karabiner ~/.config/karabiner
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
```


Ah, y para la configuración de vim es necesario tener pre-instalado
[vim-plug](https://github.com/junegunn/vim-plug):

Para instalar en linux y osx:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

