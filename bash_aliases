# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='/bin/ls --color=auto'
    alias dir='/bin/dir --color=auto'
    alias vdir='/bin/vdir --color=auto'

    alias grep='/bin/grep --color=auto'
    alias fgrep='/bin/fgrep --color=auto'
    alias egrep='/bin/egrep --color=auto'
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
