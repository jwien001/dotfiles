if [ -f /etc/bashrc ]; then
	. /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

if [ -f ~/.git-completion.sh ]; then
    . ~/.git-completion.sh
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

if [ -f ~/.kube-prompt.sh ]; then
    . ~/.kube-prompt.sh
fi

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

PSNORMAL="\[\e[0;39m\]"
PSBLUE="\[\e[1;34m\]"
PSGREEN="\[\e[1;32m\]"
PSYELLOW="\[\e[1;33m\]"
PSCYAN="\[\e[1;36m\]"
PSPURPLE="\[\e[1;35m\]"
PSGIT="${PSCYAN}(%s)${PSNORMAL}"
export PS1="${PSBLUE}\u${PSNORMAL}@${PSGREEN}\h${PSNORMAL}:${PSYELLOW}\w${PSNORMAL} ${PSPURPLE}\$(__kube_ps1)${PSNORMAL} \$(__git_ps1 \"${PSGIT}\")\n\t \$ "

function detach-others {
    tmux ls |
    grep attached |
    cut -d: -f1 |
    grep -v `tmux display-message -p '#S'` |
    xargs -rn1 tmux detach -s
}

function git-find-replace {
    git grep -l "$1" | xargs sed -i "" -e "s/$1/$2/g"
}

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ssh="ssh -A"

# Python interactive commands
alias ipy="ipython"
alias bpy="bpython"

# Dogegit
alias such=git
alias very=git
alias wow="git status"
