# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
source /usr/share/zsh/scripts/antigen/antigen.zsh


antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle common-aliases
antigen bundle thefuck
antigen theme bureau

antigen apply



alias tschuss="sudo shutdown now"

alias eject="udiskie-umount -a"
alias unlock="udiskie-mount -a"

PATH=~/bin:~/.cabal/bin:$PATH
