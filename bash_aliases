#!/bin/sh
#
# 2011-07-20:jeff
#
# 		~/.bash_aliases
#
# Local bash (1) aliases executed for interactive shells.
#

case "$(uname -s)" in
	Darwin)

		alias ncdu='ncdu -r $@'
		alias ip='echo "Public IP: "; curl icanhazip.com; echo "Internal IPs: "; ifconfig|grep 192.168.151.'
    alias www='browser $@'
    #alias findfile='find $1 -name $2'
    alias fstring='grep $1 -R $2'
    alias c='pbcopy'
    alias p='pbpaste'

		# coreutils package from brew needs to be installed
		if [ "$(brew list|grep coreutils)" ]; then
      alias du='gdu -csh'
      alias ls="gls -lhas --color=auto"
			alias lsr="gls -lRa --color=auto"
			alias df="gdf -Th"
			alias rm="grm -iv"
			alias cp="gcp -iav"
			alias mv="gmv -iv"
			alias mkdir="gmkdir -pv"
			alias rmdir='grmdir -v'
			alias chmod='gchmod -v'
			alias chown='gchown -v'
			alias ln='gln -v'
			alias find='gfind'
			alias dmesg='sudo dmesg'
			alias eject='diskutil eject $@'
			alias mount_ext4='ext4fuse -o allow_other $@'
			#alias cloc='cloc --by-file-by-lang --exclude-list-file=.cloc $@'
      alias route='netstat -nr'
      alias gitx='open -a "GitX"'
      alias leaks='iprofiler -T 300 -allocations -leaks $@'
		fi

		#alias pgrep="psgrep"

		alias edit='subl' 	# See the ~/local/bin/subl file -- note that it is
							# indeed a symbolic (soft) link to an unusual binary
							# location for us to execute from.
							# ...this is our best & preferred method of launching
							# OSX GUI apps from the term. Unfortunately, many
							# $PACKAGE.app/Contents/MacOS/$BIN apps refuse to
							# run from our terminal, thus we use the
							# pre-installed open (1) command.

		alias chrome='open -a "Google Chrome" --args -allow-file-access-from-files'
		alias marked='open -a "Marked"'
		alias iphone='open -a "iPhone Simulator"'
		alias extract='open -a "Archive Utility"'
		alias lsmod='kextstat'
		alias modprobe='kextload $@'
    alias otool='otool -L $@'

		if [ -x "$(which md5deep)" ]; then
			alias md5='md5deep -re'
		fi

		if [ -x "$(which colormake)" ]; then
			alias make='colormake'
		fi
	;;
	Linux)

		alias ip='echo "Public IP: " && curl icanhazip.com; echo "\nInternal IPs: "; ifconfig|grep 192.168.151.'
		# safe assumption that coreutils package is installed within any
		# given Linux distribution -- that I'll touch, anyway...
		alias ls="ls -lhas --color=auto"
		alias lsr="ls -lRa --color=auto"
		alias df="df -Th"
		alias rm="rm -iv"
		alias cp="cp -iav"
		alias mv="mv -iv"
		alias mkdir="mkdir -pv"
		alias chmod='chmod -v'
		alias chown='chown -v'
		alias ln='ln -v'
		alias xclip="xclip -sel clip"

		alias edit="$(which geany)"


		if [ -x "$(which md5deep)" ]; then
			alias md5='md5deep -re' # recursive, progress
		else
			alias md5='md5sum'
		fi

		# User specific
		if [[ -n "$(id|grep jeff)" ]]; then
			if [ -x "$(which nvidia-settings)" ]; then
				alias nvidia-settings="nvidia-settings --config=$HOME/.nvidia-settings-libra &"
			fi
		fi

		#if [[ "$TERMINAL" == "urxvtc" && getpid 'urxvtd' > 0 ]]; then
		if [ "$TERMINAL" == "urxvtc" ]; then
			alias urxvt='urxvtc'
		fi

		# Arch (Linux) specific:

		#if [[ "$COLORTERM" && -x "$(which pacman-color)" ]]; then
			#alias pacman="$(which pacman-color)"
		#else
			#alias pacman="$(which pacman)"
			alias pacman="/usr/bin/pacman"
		#fi

		#if [[ "$COLORTERM" && -x "$(which packer-color)" ]]; then
			#alias packer="$(which packer-color)"
		#else
			#alias packer="$(which packer)"
			alias packer="/usr/bin/yaourt"
		#fi

		# TODO/FIXME: yaourt <3
		alias yogurt="yaourt"
		alias pkginst="pacman -S" # package install from arch repos
		alias pkgupdate="pacman -Syy" # package repos update
		alias pkgupgrade="pacman -Syu" # package upgrade from arch repos
		#alias pkgupgrade="yaourt -Syua" # package repo upgrade, arch + AUR
		alias pkgq="pacman -Q|grep $1" # package repo query (installed)
		alias pkgd="yaourt -Sii $@" # package info w/ details
		alias pkgs="yaourt -Ss" # package search from arch + AUR repos
		alias pkgi="yaourt -Si $@" # package info
		alias pkgii="pacman -Qii $@" # ???
		alias pkgf="yaourt -Ql $@" # list files within package
		alias pkgf?="pacman -Qo $1" # list package from which file is from
		alias pkgorphan="pacman -Qdt" # list package orphans; ...
		alias pkgsrc="pacman -sQm" # list locally compiled/installed packages (AUR, abs)
	;;
	*)
		#alias ls="ls -lhas --color=never"
		#alias lsr="ls -lRa --color=never"
	;;
esac

alias gclone='git clone $@'
alias youtube-dl='youtube-dl --max-quality mp4 $@'

# grep options
alias tree="tree -Chu"
GREP_OPTIONS="--color=always -I"; export GREP_OPTIONS # -I = --binary-files-without-match
alias killall="killall -9 $@"

alias pid="ps aux|pgrep"
alias watch="watch -n 1.0"
alias iostat="iostat -d 1"
alias ifstat="clear && $(which ifstat) -z -i en2 -w -S $@"

alias cls="reset"
#alias diff="diff -uNr"
alias kpatch="patch -p1 < $@"

# TODO/FIXME
#alias 'shutdown_vbox'="VBoxManage controlvm $@ poweroff"

#if [[ "$COLORTERM" && -x "$(which colorgcc)" ]]; then
	#alias gcc="$(which colorgcc)"
	#alias g++="$(which colorgcc)"
#else
	alias gcc="$(which gcc)"
	alias g++="$(which g++)"
	alias gcc="/usr/bin/gcc"
	alias g++="/usr/bin/gcc"
#fi

if [ -x "$(which colordiff)" ]; then
#if [[ "$COLORTERM" && -x "/usr/bin/colordiff" ]]; then
	alias diff="$(which colordiff)"
	#alias diff="$(which colordiff) -uNr $@"
else
	alias diff="$(which diff)"
fi

