#set -g fish_greeting
#fish_add_path ~/.local/bin
source ~/.config/fish/functions
set -g  fish_greeting

    pokeget random
    sleep 0.5
    clear

    #wthrr

function starship_transent_rmpt_func
  starship module time
end
starship init fish | source
enable_transience


if status is-interactive
    starship init fish | source
end

# Alias
alias proxy="proxychains4 -q fish"
alias ff="pokeget random --hide-name | fastfetch -c /home/inoribea/.config/fastfetch/ff.jsonc --file-raw -"
alias fff="fastfetch"
alias lol="lolcat"
alias scoff="sudo systemctl disable --now"
alias scon="sudo systemctl enable --now"
alias scr="sudo systemctl restart --now"
alias uphyde="cd ~/HyDE/Scripts
git pull
./install.sh -r
cp -rf /home/inoribea/dotconfig/* /home/inoribea/.config"
alias upags="cd ~/dots-hyprland
git pull
sh update-dots.sh
cp -rf /home/inoribea/dotconfig/* /home/inoribea/.config"
alias upconf="sh /home/inoribea/dotconfig/dotconfig.sh"
alias dnsoff="sudo systemctl stop dnsproxy
sleep 0.5
sudo pkill -f dnsproxy
sudo systemctl start systemd-resolved"
alias dnson="sudo systemctl stop systemd-resolved
sleep 0.5
sudo pkill -f systemd-resolved
sleep 0.5
sudo systemctl start dnsproxy"
alias lsp="sudo lsof -nP -iTCP -sTCP:LISTEN"
alias tson="sudo tailscale up --accept-dns=false"
alias timeck="chronyc tracking"
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
