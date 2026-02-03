# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
#cat alias bat
alias cat="bat"

export PATH=$PATH:/home/fedora/.spicetify
eval "$(starship init bash)"


# Source - https://superuser.com/a
# Posted by ingkebil, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-27, License - CC BY-SA 3.0

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
. "$HOME/.cargo/env"
