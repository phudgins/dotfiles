# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

export EDITOR="vim"
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
export DMM_ENVIRONMENT=local

alias -g bx="bundle exec"
alias -g ll="ls -l"
alias -g start-redis="start_redis"
alias -g dalek="cat ~/dalek.txt"
alias -g cowtzu="fortune -s | cowsay && say moo"
alias -g ohcrap="say 'Oh Crap!'"
alias -g got="gti"
alias -g gut="gti"
alias -g nyan="( youtube-dl -q -o- 'http://www.youtube.com/watch?v=QH2-TGUlwu4' | mplayer -really-quiet -vo null -cache 500 - ; echo $'\035quit';reset ) | telnet miku.acm.uiuc.edu"
alias -g crazy="youtube-dl -q -o- 'http://www.youtube.com/watch?v=bd2B6SjMh_w' | mplayer -really-quiet -vo null -cache 500 -"
alias -g bspec="bin/rspec"

source $HOME/.aliases

function start_redis {
  for file in `ls ~/redis-*.conf`; do
    redis-server $file
  done
}

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
eval "$(rbenv init -)"
