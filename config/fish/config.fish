if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias yay="paru"
alias yeet="paru -Rcs"
alias vimrc="vim $HOME/.vimrc"
alias fishrc="vim $HOME/.config/fish/config.fish"
alias i3rc="vim $HOME/.config/i3/config"

alias sysupdate="bash $HOME/.config/user/scripts/system_update.sh"

alias gamesetup="bash $HOME/.config/user/scripts/game_setup.sh"

alias dot="git -C $HOME/.dotfiles"

bind -M insert \cf forward-char

starship init fish | source
