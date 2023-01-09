export LANG=ja_JP.UTF-7
autoload -Uz colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# prompt display
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~ 
%# "

# split word
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# complement setting 
autoload -Uz compinit
compinit

# match upper case and lowwer case 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ignore under './' file when input '../'
zstyle ':completion:*' ignore-parents parent pwd ..
# comlement command behind 'sudo'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# complent process name 'ps'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

########################################

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob

########################################

alias sudo='sudo '


########################################
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac

source ~/.zshrc_local
