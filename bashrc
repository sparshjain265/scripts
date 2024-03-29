# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  if [ -f /usr/share/bash-complete-alias/complete_alias ]; then
	  . /usr/share/bash-complete-alias/complete_alias
	  complete -F _complete_alias "${!BASH_ALIASES[@]}"
  fi
fi

# Change shell prompt

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo " [${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export RANGER_LOAD_DEFAULT_RC=FALSE

export PS1="\[\033[01;32m\][\D{%Y-%m-%d} \t] [\h \u]\[\033[00m\] \[\033[01;36m\]\w\`parse_git_branch\` \n\[\033[00m\]\$ "

# thefuck
# eval $(thefuck --alias --enable-experimental-instant-mode)
eval $(thefuck --alias)
# you can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

PATH="/home/padfoot/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/padfoot/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/padfoot/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/padfoot/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/padfoot/perl5"; export PERL_MM_OPT;

# cabal path 
export PATH="$HOME/.cabal/bin:$PATH"

# rbenv init
eval "$(rbenv init - bash)"

# fzf settings

if [ -f /usr/share/fzf/key-bindings.bash ]; then
	. /usr/share/fzf/key-bindings.bash
fi

if [ -f /usr/share/fzf/completion.bash ]; then
	. /usr/share/fzf/completion.bash
fi

if [ -f /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh ]; then
	. /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh
	bind -x '"\t": fzf_bash_completion'
fi

# if [ -f /home/padfoot/.local/opt/fzf-obc/bin/fzf-obc.bash ]; then
# 	. /home/padfoot/.local/opt/fzf-obc/bin/fzf-obc.bash
# fi

if [ -f /usr/share/fzf/fzf-extras.bash ]; then
	. /usr/share/fzf/fzf-extras.bash
fi

export FZF_DEFAULT_OPTS="--cycle"
# export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
# export FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/padfoot/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/padfoot/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/padfoot/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/padfoot/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

