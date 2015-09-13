export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
export DEFAULT_USER="$USER"
ZSH_THEME="agnoster"

plugins=(git)

# User configuration
source $ZSH/oh-my-zsh.sh

# Add RVM and cabal packages to PATH for scripting
export PATH="$HOME/.cabal/bin:$PATH:$HOME/.rvm/bin"

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Default time before notification.
export NOTIFY_COMMAND_COMPLETE_TIMEOUT="15"
source $HOME/.oh-my-zsh/notify.plugin.zsh

# What I've done for today
alias idone="git log --since=midnight  --all --author=\"Ilya\" --format=\"%s\" | grep -v \"Revert.*\" | grep -v \"Merge pull request.*\" | sed -e \"s/DUR\-[0-9]\{3,4\}: //g\" | paste -sd \",\" -"
