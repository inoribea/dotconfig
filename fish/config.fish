#set -g fish_greeting

function fish_greeting
     pokeget random
     sleep 0.5
     clear
end

function starship_transent_rmpt_func
  starship module time
end
starship init fish | source
enable_transience


if status is-interactive
    starship init fish | source
end

# Alias
alias chags="cp -f /home/inoribea/dotconfig/hypr/ags.conf /home/inoribea/.config/hypr/hyprland.conf&&hyprctl reload&&pkill waybar&&pkill dunst"
alias chhyde="cp -f /home/inoribea/dotconfig/hypr/hyde.conf /home/inoribea/.config/hypr/hyprland.conf&&hyprctl reload&&pkill ags"
alias proxy="proxychains4 -q fish"
alias ff="pokeget random --hide-name | fastfetch -c /home/inoribea/.config/fastfetch/ff.jsonc --file-raw -"
alias fff="fastfetch"
alias lol="lolcat"
alias ctloff="sudo systemctl disable --now"
alias ctlon="sudo systemctl enable --now"
alias ctlr="sudo systemctl restart --now"
alias uphyde="cd ~/HyDE/Scripts
git pull
./install.sh -r
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
