if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

export TERMINAL="kitty"
export EDITOR="vim"
export VISUAL="vim"

# if bash profile exists, call it else directly call bashrc
# this shouldn't be necessary since .profile is ignored if .bash_profile is present
# .profile is sourced by .bash_profile
# if [ -f ~/.bash_profile ] ; then
# 	. ~/.bash_profile
# else
# 	[[ -f ~/.bashrc ]] && . ~/.bashrc
# fi

if [ -d "/home/wheezy/anaconda3/bin" ]; then
  export PATH="$PATH:/home/wheezy/anaconda3/bin"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

export QT_QPA_PLATFORMTHEME=qt5ct

export ADW_DISABLE_PORTAL=1

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
source "/usr/lib/emsdk/emsdk_env.sh"
