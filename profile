if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

export TERMINAL="kitty"

# if bash profile exists, call it else directly call bashrc
if [ -f ~/.bash_profile ] ; then
	. ~/.bash_profile
else
	[[ -f ~/.bashrc ]] && . ~/.bashrc
fi

if [ -d "/home/wheezy/anaconda3/bin" ]; then
  export PATH="$PATH:/home/wheezy/anaconda3/bin"
fi

export XDG_CONFIG_HOME="$HOME/.config"

export QT_QPA_PLATFORMTHEME=qt5ct
