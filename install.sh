#!/bin/sh

WORKING_DIR=$(pwd)
MKDIR_COMMAND=$(which mkdir)
LINK_COMMAND=$(which ln)
COPY_COMMAND=$(which cp)

# vim configuration
${MKDIR_COMMAND} -p ${HOME}/.vim
${MKDIR_COMMAND} -p ${HOME}/.vim/backup
${MKDIR_COMMAND} -p ${HOME}/.vim/tmp
${LINK_COMMAND} -sfT ${WORKING_DIR}/vim/autoload $HOME/.vim/autoload
${LINK_COMMAND} -sfT ${WORKING_DIR}/vim/bundle $HOME/.vim/bundle
${LINK_COMMAND} -sfT ${WORKING_DIR}/vim/colors $HOME/.vim/colors
${LINK_COMMAND} -sf ${WORKING_DIR}/vim/vimrc $HOME/.vimrc

# Bash supporting configuration
${LINK_COMMAND} -sfT ${WORKING_DIR}/colors $HOME/.colors

# Bash scripts
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_aliases $HOME/.bash_aliases
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_cflags $HOME/.bash_cflags
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_login $HOME/.bash_login
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_logout $HOME/.bash_logout
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_profile $HOME/.bash_profile
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_prompt $HOME/.bash_prompt
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bash_syscheck $HOME/.bash_syscheck
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bashlib $HOME/.bashlib
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/bashrc $HOME/.bashrc
${LINK_COMMAND} -sf ${WORKING_DIR}/bash/inputrc $HOME/.inputrc

# mplayer configuration
#${LINK_COMMAND} -sf ${WORKING_DIR}/mplayer/ $HOME/.mplayer

# mpv player configuration
${MKDIR_COMMAND} -p ${HOME}/.mpv ${HOME}/.mpv/watch_later
${LINK_COMMAND} -sfT ${WORKING_DIR}/mpv/config $HOME/.mpv/config
${LINK_COMMAND} -sfT ${WORKING_DIR}/mpv/input.conf $HOME/.mpv/input.conf
${LINK_COMMAND} -sfT ${WORKING_DIR}/mpv/kq.profile $HOME/.mpv/kq.profile
${LINK_COMMAND} -sfT ${WORKING_DIR}/mpv/subs.profile $HOME/.mpv/subs.profile

# mpd, mpdscribble configuration
${MKDIR_COMMAND} -p ${HOME}/.config/mpd
${MKDIR_COMMAND} -p ${HOME}/.config/mpd/cache
${MKDIR_COMMAND} -p ${HOME}/.config/mpd/log
${MKDIR_COMMAND} -p ${HOME}/.config/mpd/db
${MKDIR_COMMAND} -p ${HOME}/.config/mpd/tmp
${LINK_COMMAND} -sf ${WORKING_DIR}/mpd/mpd.conf $HOME/.config/mpd/mpd.conf
${LINK_COMMAND} -sf ${WORKING_DIR}/mpd/mpdscribble.conf $HOME/.config/mpd/mpdscribble.conf
${MKDIR_COMMAND} -p ${HOME}/.ncmpcpp
${LINK_COMMAND} -sfT ${WORKING_DIR}/ncmpcpp/config ${HOME}/.ncmpcpp/config
${LINK_COMMAND} -sfT ${WORKING_DIR}/ncmpcpp/bindings ${HOME}/.ncmpcpp/bindings

# synergys configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/synergy/synergy.conf $HOME/.synergy.conf

# git configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/git/gitattributes $HOME/.gitattributes
${LINK_COMMAND} -sf ${WORKING_DIR}/git/gitconfig $HOME/.gitconfig
${LINK_COMMAND} -sf ${WORKING_DIR}/git/gitignore_global $HOME/.gitignore_global
${LINK_COMMAND} -sf ${WORKING_DIR}/git/gitk $HOME/.gitk
${LINK_COMMAND} -sfT ${WORKING_DIR}/git/hooks $HOME/.git_template

# hg configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/hg/hgignore_global $HOME/.hgignore_global

# tmux configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/tmux/tmux.conf $HOME/.tmux.conf

# gtk configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/gtk/gtkrc-2.0 $HOME/.gtkrc-2.0
${LINK_COMMAND} -sf ${WORKING_DIR}/gtk/gtkrc-2.0.mine $HOME/.gtkrc-2.0.mine

# X11 configuration
${LINK_COMMAND} -sf ${WORKING_DIR}/X11/Xresources $HOME/.Xresources

# pianobar cfg
${MKDIR_COMMAND} -p ${HOME}/.config/pianobar
${LINK_COMMAND} -sf ${WORKING_DIR}/pianobar/config ${HOME}/.config/pianobar/config

# emacs cfg
${LINK_COMMAND} -sf ${WORKING_DIR}/emacs/emacs ${HOME}/.emacs

# grc cfg
${MKDIR_COMMAND} -p ${HOME}/.grc
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.configure ${HOME}/.grc/conf.configure
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.cvs ${HOME}/.grc/conf.cvs
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.df ${HOME}/.grc/conf.df
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.diff ${HOME}/.grc/conf.diff
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.dig ${HOME}/.grc/conf.dig
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.esperanto ${HOME}/.grc/conf.esperanto
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.gcc ${HOME}/.grc/conf.gcc
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.ifconfig ${HOME}/.grc/conf.ifconfig
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.irclog ${HOME}/.grc/conf.irclog
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.ldap ${HOME}/.grc/conf.ldap
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.log ${HOME}/.grc/conf.log
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.ls ${HOME}/.grc/conf.ls
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.mount ${HOME}/.grc/conf.mount
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.mount2 ${HOME}/.grc/conf.mount2
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.mtr ${HOME}/.grc/conf.mtr
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.netstat ${HOME}/.grc/conf.netstat
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.php ${HOME}/.grc/conf.php
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.ping ${HOME}/.grc/conf.ping
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.proftpd ${HOME}/.grc/conf.proftpd
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.ps ${HOME}/.grc/conf.ps
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.traceroute ${HOME}/.grc/conf.traceroute
${LINK_COMMAND} -sf ${WORKING_DIR}/grc/conf.wdiff ${HOME}/.grc/conf.wdiff

case "$(uname -s)" in
Darwin)

  # Ensure that expected environment folders are present
  if [[ ! -d "$HOME/local/bin" ]]; then
    mkdir -p $HOME/local/bin
  fi

  # mpd configuration
  if [ -d "/Volumes/Media/Music" ]; then
    ${LINK_COMMAND} -sf /Volumes/Media/Music $HOME/.config/mpd/music

    if [ -d "/Volumes/Media/Music/playlists" ]; then
      ${LINK_COMMAND} -sf /Volumes/Media/Music/playlists/ $HOME/.config/mpd/playlists
    fi
  else
    if [ -d "$HOME/Music" ]; then
      ${LINK_COMMAND} -sf $HOME/Music/ $HOME/.config/mpd/music

      if [ -d "$HOME/Music/playlists" ]; then
        ${LINK_COMMAND} -sf $HOME/Music/ $HOME/.config/mpd/music
      fi
    fi
  fi

  # FIXME: synergys launchd script
  ${LINK_COMMAND} -sf ${WORKING_DIR}/synergy/synergys.sh $HOME/local/bin/synergys.sh
  #${LINK_COMMAND} -sf ${WORKING_DIR}/synergy/org.local.synergys.plist $HOME/Library/LaunchAgents/org.local.synergys.plist
  #launchctl unload ~/Library/LaunchAgents/org.local.synergys.plist
  #launchctl load ~/Library/LaunchAgents/org.local.synergys.plist

  # unison launchd script
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/unison_nomlib.sh $HOME/local/bin/unison_nomlib.sh
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/unison_nomdev.sh $HOME/local/bin/unison_nomdev.sh
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/unison_ttcards.sh $HOME/local/bin/unison_ttcards.sh
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/unison_third-party.sh $HOME/local/bin/unison_third-party.sh

  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/org.local.unison_nomlib.plist $HOME/Library/LaunchAgents/org.local.unison_nomlib.plist
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/org.local.unison_nomdev.plist $HOME/Library/LaunchAgents/org.local.unison_nomdev.plist
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/org.local.unison_ttcards.plist $HOME/Library/LaunchAgents/org.local.unison_ttcards.plist
  ${LINK_COMMAND} -sf ${WORKING_DIR}/unison/org.local.unison_third-party.plist $HOME/Library/LaunchAgents/org.local.unison_third-party.plist

  launchctl unload ~/Library/LaunchAgents/org.local.unison_nomlib.plist
  launchctl unload ~/Library/LaunchAgents/org.local.unison_nomdev.plist
  launchctl unload ~/Library/LaunchAgents/org.local.unison_ttcards.plist
  launchctl unload ~/Library/LaunchAgents/org.local.unison_third-party.plist

  launchctl load ~/Library/LaunchAgents/org.local.unison_nomlib.plist
  launchctl load ~/Library/LaunchAgents/org.local.unison_nomdev.plist
  launchctl load ~/Library/LaunchAgents/org.local.unison_ttcards.plist
  launchctl load ~/Library/LaunchAgents/org.local.unison_third-party.plist

  # pow configuration
  ${LINK_COMMAND} -sf ${WORKING_DIR}/powconfig $HOME/.powconfig

  # Convenience helper script for setting default audio routing to Internal Output
  ${LINK_COMMAND} -sf ${WORKING_DIR}/AppleScript/setaudio.applescript $HOME/local/bin/setaudio

  # Helper script for AirParrot that activates AppleTV's "Extended Desktop"
  # feature at user login
  ${LINK_COMMAND} -sf ${WORKING_DIR}/AppleScript/AppleTV.applescript $HOME/local/bin/AppleTV.applescript

  # Hermes app helper script
  ${LINK_COMMAND} -sf ${WORKING_DIR}/AppleScript/hermes.applescript $HOME/local/bin/hermes

  ;;
Linux)
  return 0
  ;;
*)
  return 0
  ;;
esac
