#
# ~/.bash_profile
#

# xsettingsd &

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

[[ -f ~/.zshrc ]] && . ~/.zshrc

if [ -d "/home/wheezy/anaconda3/bin" ]; then
  export PATH="$PATH:/home/wheezy/anaconda3/bin"
fi

export XDG_CONFIG_HOME="$HOME/.config"

export QT_QPA_PLATFORMTHEME=qt5ct
