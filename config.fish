# =========
# GENERALES
# =========

set -x EDITOR "vim"
set -x NO_UPDATE_NOTIFIER 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x FZF_DEFAULT_COMMAND "fd -t f"

# =====
# ALIAS
# =====

alias m="cd; cd proyectos/; mgit"
alias p="cd ~/proyectos; ls *.yaml | fzf | xargs tmuxp load"
alias ggo="git-open"
alias nowrap="tput rmam"
alias wrap="tput smam"
alias descargar="~/proyectos/dotfiles/bin/descargar"
alias crear-post="~/proyectos/dotfiles/bin/crear-post"
alias cerrar-tmux="tmux kill-server"

# ============
# ALIAS DE GIT
# ============

alias   s='git status'
alias  ss="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(white)%<(25,trunc)%s%C(reset) %C(dim white)- %an%C(reset) - %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset) ' -10"
alias sss="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(dim white)- %an%C(reset) - %C(bold green)(%ar)%C(reset) %C(bold yellow)%d%C(reset) ' -10"

# =====================
# CONFIGURACIÓN DE FISH
# =====================

set fish_greeting ''

function fish_prompt
  set_color green
  printf '%s' (prompt_pwd)
  printf '%s\n' (__fish_git_prompt)
  printf '→ '
  set_color normal
end

# ======================
# CONFIGURACIÓN DE PATHs
# ======================

set -x PATH ~/apps/bin $PATH
set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/proyectos/dotfiles/bin $PATH
set -x PATH ~/Library/Android/sdk/platform-tools $PATH
set -x PATH ~/Library/Android/sdk/tools $PATH
set -x PATH /usr/local/bin/ $PATH
set -x PATH /usr/local/sbin/ $PATH
set -x PATH ~/Library/Python/3.7/bin $PATH
set -x PATH $HOME/paquetes-node/bin $PATH
set -x PATH /Applications/Postgres.app/Contents/Versions/10/bin $PATH
set -x PATH ~/.gem/ruby/3.0.0/bin $PATH

# =====================
# Configuración de ruby
# =====================

set -x PATH /usr/local/opt/ruby/bin $PATH
set -x LDFLAGS "-L/usr/local/opt/ruby/lib" $LDFLAGS
set -x CPPFLAGS "-I/usr/local/opt/ruby/include" $CPPFLAGS


# ====================
# Variables de entorno
# ====================

set -x ANDROID_HOME ~/Library/Android/sdk
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
set -x NODE_PATH $NODE_PATH $HOME/node-packages/bin
set -x GOPATH $HOME/go

