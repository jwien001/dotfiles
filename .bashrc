if [ -f /etc/bashrc ]; then
	. /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w \$(parse_git_branch) \\$\[\033[00m\] "

alias la="ls -a"
alias bpy="bpython"
