#!/bin/sh
#
# 2011-07-20:jeff
#
# 		~/.bashrc
#
# Local interactive bash (1) shell config.
#

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If true, .bash_history is appended at logout rather than overwritten as per
# the defaults.
shopt -s histappend

shopt -u mailwarn
unset MAILCHECK

shopt -s cdable_vars

# if true, Bash paths include dotfiles when the wildcard * is specified. If false, one must explicitly select dot files by specifiying .*
shopt -s dotglob

# if true, aliases are expanded
shopt -s expand_aliases

# if true, extend the pattern matching featureset
#shopt -s extglob

# if true, attempt to perform hostname tab completion
shopt -s hostcomplete

# if true, minor spelling errors of a dir component in a cd will be corrected
shopt -s cdspell

# Our bash (1) history file
export HISTFILE="$HOME/.bash_history"

# Maximum of 16384 lines storable in our history file
export HISTFILESIZE=8192

# TODO: need to verify this is the same as above.
export HISTSIZE="$HISTFILESIZE"

# Do not put duplicate lines in the history.
export HISTCONTROL=ignoredups

# Linux)
# NOTE:	The following line *must* be included before the repo GCC toolchain bins
#		path is set
#PATH="/usr/lib/colorgcc/bin"

if [ -x "$HOME/.bash_cflags" ]; then
	. "$HOME/.bash_cflags"
fi

if [ -x "$HOME/.bashlib" ]; then
	. "$HOME/.bashlib"
fi

if [ -x "$HOME/.bash_prompt" ]; then
	. "$HOME/.bash_prompt"
fi

if [ -x "$(which locale)" ]; then
	eval "$(locale)"
fi

PATH="$CCACHE_PATH:$HOME/local/bin:$PATH"
export PATH

PATH="$PATH:$HOME/local/bin/checker"
export PATH

PYTHONPATH="$(brew --prefix)/lib/python2.7/site-packages"

PATH="$PATH:/usr/local/share/python:$PYTHONPATH"
export PATH

#PATH="$PATH:$HOME/local/src/emscripten"
#export PATH

#eval "$(resize)"

#export USECOLOR=true
TERM=xterm-256color; export TERM
TMPDIR="/private/tmp"; export TMPDIR
#TMPDIR="$HOME/tmp"; export TMPDIR
BLOCKSIZE=K; export BLOCKSIZE
INPUTRC="/private/etc/inputrc"; export INPUTRC

if [ -x "$(which vimpager)" ]; then
	#PAGER="aless"; export PAGER
	MAN_PAGER="aless"; export MAN_PAGER;
fi

BROWSER="google-chrome"; export BROWSER
EDITOR="subl"; export EDITOR
VISUAL="subl"; export VISUAL

MINICOM="-m -c on"; export MINICOM
MPD_HOST="666@virgo.local"; export MPD_HOST
SSH_KEYS="$HOME/.ssh/libra_dsa"; export SSH_KEYS

case "$(uname -s)" in
	Darwin)
		TERMINAL="iterm"; export TERMINAL

		if [ -f "$(which lesspipe.sh)" ]; then
			LESSOPEN="|/usr/local/bin/lesspipe.sh %s"; export LESSOPEN
		fi

		LESS="-r"; export LESS # color support

		if [ -f "$(which gdircolors)" ]; then
			eval "$(gdircolors -b $HOME/.colors/dir_colors)"
		fi

		if [ -f `brew --prefix`/etc/bash_completion ]; then
    		. `brew --prefix`/etc/bash_completion
    	#else
			#echo "ERR: Ensure that $(which brew) --prefix /etc/bash_completion file permissions are executable (x) and readable (r)."
		fi

		SSH_ASKPASS="/usr/local/libexec/ssh-askpass"; export SSH_ASKPASS
		SUDO_ASKPASS="/usr/local/libexec/ssh-askpass"; export SUDO_ASKPASS
	;;
	Linux)
		TERMINAL="urxvtc"; export TERMINAL

		if [ -f "$(which lesspipe)" ]; then
			eval "$(lesspipe)"
		fi

		eval "$(dircolors -b $HOME/.colors/dir_colors)"

		# XDG CONFIG DIRS (Xorg FreeDesktop standard)
		if [ -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs ]; then
			. ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
		fi

		if [ -f ${XDG_DOCUMENTS_DIR:-~/.config}/user-dirs.dirs ]; then
			. ${XDG_DOCUMENTS_DIR:-~/.config}/user-dirs.dirs
		fi

		export XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR XDG_TEMPLATES_DIR
		export XDG_PUBLICSHARE_DIR XDG_MUSIC_DIR
		export XDG_PICTURES_DIR XDG_VIDEOS_DIR

		SciTE_HOME="/home/jeff/.scite"; export SciTE_HOME

		if [ -f "/etc/bash_completion" ]; then
			. /etc/bash_completion
		#else
			#echo "ERR: Ensure that /etc/bash_completion file permissions are executable (x) and readable (r)."
		fi

		#SSH_ASKPASS=""; export SSH_ASKPASS
		#SUDO_ASKPASS=""; export SUDO_ASKPASS
	;;
	*)
	;;
esac

# Additional Bash(1) inclusion files

#if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
#	. /usr/local/etc/bash_completion.d/git-completion.bash
#else
#	echo "ERR: Ensure that /usr/local/etc/bash_completion.d/git-completion.bash file permissions are executable (x) and readable (r)."
#fi

if [ -x "$HOME/.bash_aliases" ]; then
	. $HOME/.bash_aliases
fi

if [ -x "$HOME/.bash_aliases" ]; then
	. $HOME/.bash_aliases
fi
