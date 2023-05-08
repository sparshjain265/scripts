# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# 	if [ -f /usr/bin/lsd ]; then
# 		alias ls='/usr/bin/lsd --color=auto' # lsd for icons in ls
# 	else 
# 		alias ls='/usr/bin/ls --color=auto'
# 	fi
	alias ls='/usr/bin/ls --color=auto'

	alias dir='/usr/bin/dir --color=auto'
    alias vdir='/usr/bin/vdir --color=auto'

    alias grep='/usr/bin/grep --color=auto'
    alias fgrep='/usr/bin/fgrep --color=auto'
    alias egrep='/usr/bin/egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# my aliases
alias python=python3

alias pdf="xdg-open 2>/dev/null"
alias open="xdg-open"
alias shit="fuck"

alias mirror="sudo reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist"

alias discord='/bin/discord --no-sandbox --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

alias nautilus='GTK_THEME=oomox-DarkOnesk1 /bin/nautilus'

alias yay='paru'
alias please='sudo'
