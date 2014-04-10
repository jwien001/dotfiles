if [ -f /etc/bashrc ]; then
	. /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

if [ -f ~/.git-completion.sh ]; then
    . ~/.git-completion.sh
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

export PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1 " \[\e[1;36m\](%s)\[\e[0;39m\]") \$ '

export HOMEBREW_GITHUB_API_TOKEN=02548e9a51b3786fe1d5225e5c559379e18584e9

alias la="ls -a"
alias ssh="ssh -A"

# Python interactive commands
alias ipy="ipython"
alias bpy="bpython"

# Dogegit
alias such=git
alias very=git
alias wow="git status"
