# Created by newuser for 5.8
zmodload zsh/complist
autoload -Uz compinit promptinit vcs_info colors
colors	# Load colors

precmd () { vcs_info }
compinit
promptinit
setopt prompt_subst

#share history between sessions
setopt SHARE_HISTORY
#append entries rather than overrite then
setopt APPEND_HISTORY
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

# The following lines were added by compinstall

zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle :compinstall filename '/home/fele/.zshrc'

# Key Bindings
bindkey -M menuselect "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
bindkey '^R' history-incremental-search-backward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
