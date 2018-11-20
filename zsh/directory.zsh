## changing directories
setopt auto_cd # activate auto_cd, cd into name if directory
setopt autopushd # always pushd, see list with dirs -v
setopt pushdignoredups # do not add duplicates
setopt pushdminus # enable cd -

# control directory
alias d='dirs -v | head -10'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
