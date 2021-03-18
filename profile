#
# ~/.bash_profile
#

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d "/home/wheezy/anaconda3/bin" ]; then
  export PATH="/home/wheezy/anaconda3/bin:$PATH"
fi
