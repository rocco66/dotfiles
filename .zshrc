# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery, command-not-found, git-flow, python, git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# virtualenvwrapper
#source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=~/Envs

#my aliases
EDITOR="nano" && export EDITOR
alias cswift78="ssh user@swift78"
alias cswift79="ssh user@swift79"
alias cswift80="ssh user@swift80"
alias cswift81="ssh user@swift81"
alias cswift82="ssh user@swift82"
alias csaltmin1="ssh root@saltmin1"
alias csnap="ssh root@snap"
alias cssw_cnt="ssh storage@ssw_cnt"
alias ccloud_sswp="ssh root@cloud_sswp"
alias cssp_test="ssh root@ssp_test"

#alias test=’nocorrect test’


#git flow stuff
source ~/dist/git-flow-completion/git-flow-completion.zsh

# node ninja section
export NODE_PATH=/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="~/.cabal/bin:$PATH"

### small notify alias for long time work
alias notify="notify-send \"Done\" -u critical -t 5 || notify-send \"Error\" -u critical -t 5 "

### maybe fix freeze mouse
alias freeze="synclient TouchpadOff=0"


# antigen
source ~/.zsh/antigen/antigen.zsh
# antigen-lib

# OPAM configuration
. /home/max/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config -env`

# bower stuff
alias bower='noglob bower'
###-begin-bem-completion-###
#
# bem command completion script
#
# Installation: bem completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: bem completion > /usr/local/etc/bash_completion.d/bem
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _bem_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           bem completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _bem_completion bem
elif compctl &>/dev/null; then
  _bem_completion () {
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
                       bem completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _bem_completion bem
fi
###-end-bem-completion-###
