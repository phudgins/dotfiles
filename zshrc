# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

export NODE_ENV=local
export EDITOR="vim"
export RUBY_GC_MALLOC_LIMIT=90000000
export DMM_ENVIRONMENT=local
export SCALA_HOME=/usr/local/share/scala
export SBT_HOME=/usr/local/share/sbt
export PLAY_HOME=/Users/pete.hudgins/tools/play
export DYLD_LIBRARY_PATH=/Users/pete.hudgins/tools/oracle/instantclient
export OCI_LIB_DIR="$DYLD_LIBRARY_PATH"
export OCI_INC_DIR="$DYLD_LIBRARY_PATH/sdk/include"

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
alias -g sysdown="youtube-dl -q -o- 'https://www.youtube.com/watch?t=48&v=ILVfzx5Pe-A' | mplayer -really-quiet -vo null -cache 500 -"
alias -g bspec="bin/rspec"

source $HOME/.aliases

function start_redis {
  for file in `ls ~/redis-*.conf`; do
    redis-server $file
  done
}

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh

eval "$(rbenv init -)"
export GRAILS_HOME="/Users/pete.hudgins/grails"
export GROOVY_HOME="/Users/pete.hudgins/groovy"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"
export FORWARDER_HOME="/Users/pete.hudgins/logstash-forwarder"
#export NODE_PATH="/usr/local/opt/nvm/versions/node/v0.12.2/lib/node_modules"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:$SCALA_HOME/bin:$SBT_HOME/bin:$PLAY_HOME:$GRAILS_HOME/bin:$GROOVY_HOME/bin
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/php5/bin:$PATH"
export PATH="$HOME/chromedriver:$PATH"
export PATH="$FORWARDER_HOME:$PATH"
export PATH="/usr/local/sbin:$PATH"
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
fpath=(/usr/local/share/zsh-completions $fpath)
