#set -g fish_greeting

function fish_greeting
     pokemon-colorscripts -r
end

#if status is-interactive
#    starship init fish | source
#end

# List Directory
alias pika="pikaur"
alias neo="neofetch"
alias lol="lolcat"

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'
