export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
export DEFAULT_USER="$USER"
ZSH_THEME="sunrise" # agnoster2

plugins=(git notify zsh-autosuggestions git-flow-completion)

# User configuration
source $ZSH/oh-my-zsh.sh

# GO
export GOPATH=$(go env GOPATH)
PATH=$PATH:$(go env GOPATH)/bin

# PostgresApp
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"

# Add RVM and cabal packages to PATH for scripting
export PATH="$HOME/.rvm/bin:$HOME/.cabal/bin:$PATH"

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Fixes misspells
setopt correct

# Ignore commands starting with space
setopt HIST_IGNORE_SPACE

# Default time before notification.
# export NOTIFY_COMMAND_COMPLETE_TIMEOUT="15"
# source $HOME/.oh-my-zsh/notify.plugin.zsh

# What I've done for today
alias idone="git log --since=midnight  --all --author=\"Ilya\" --format=\"%s\" | grep -v \"Revert.*\" | grep -v \"Merge pull request.*\" | sed -e \"s/DUR\-[0-9X]\{3,4\}: //g\" | paste -sd \",\" -"
alias drspec="docker-compose run --rm test rspec --format progress"

emoji() {
  echo "require 'utf8_emoji';puts Utf8Emoji.emojis.values.sample" | ruby
}

git_emoji() {
  git commit -m  "$1 `emoji` `git rev-parse --abbrev-ref HEAD | sed -e 's/feature\///' | grep -o '[A-Z0-9]\+\-\d\+'`"
}

# Fixes for rvm env's built vim
alias vim='rvm system do /usr/local/bin/vim $@'
alias mvim='rvm system do /usr/local/bin/mvim $@'

ruby_sandbox() {
  grep -oP "(?<=ruby [\'\"])(.*)(?=[\'\"])" Gemfile > .ruby-version
  echo ${PWD##*/} > .ruby-gemset
  cd ..
  cd -
  gem install bundler
}

alias gj=git_emoji
alias emj=emoji

###-tns-completion-start-###
if [ -f /Users/Smelkov/.tnsrc ]; then
    source /Users/Smelkov/.tnsrc
fi
###-tns-completion-end-###

export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin/
