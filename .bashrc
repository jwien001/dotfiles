if [ -f /etc/bashrc ]; then
	. /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

alias la="ls -a"
alias bpy="bpython"
#alias dev="mosh --server=\"LD_LIBRARY_PATH=/nail/home/jwien/lib /nail/home/jwien/bin/mosh-server\" jwien@dev1-devb.dev.yelpcorp.com"
alias dev="ssh dev"
