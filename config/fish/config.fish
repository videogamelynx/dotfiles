if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vi="vim"
alias vim="nvim"
alias yay="paru"
alias yeet="paru -Rcs"
alias vimrc="nvim $HOME/.config/nvim/init.lua"
alias tmuxrc="nvim $HOME/.tmux.conf"
alias fishrc="nvim $HOME/.config/fish/config.fish"
alias i3rc="nvim $HOME/.config/i3/config"
alias sshrc="nvim $HOME/.ssh/config"
alias meditate="peaclock --config-dir $HOME/.config/peaclock"
alias scratch="nvim (mktemp)"
alias playswitch="gamemoderun $HOME/mediaSSD/Games/ryujinx/publish/Ryujinx"
alias sysupdate="bash $HOME/.config/user/scripts/system_update.sh"
alias gamesetup="bash $HOME/.config/user/scripts/game_setup.sh"
alias makeclass="bash $HOME/.config/user/scripts/createclasscpp.sh"
alias desk="cd $HOME/Desktop"

alias dot="git -C $HOME/.dotfiles"

bind -M insert \cf forward-char

starship init fish | source
