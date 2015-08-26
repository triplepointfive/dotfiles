export ZSH=/home/maud/.oh-my-zsh

# Set name of the theme to load.
export DEFAULT_USER="maud"
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

source $HOME/.oh-my-zsh/notify.plugin.zsh
