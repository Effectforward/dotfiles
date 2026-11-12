# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
# Add a directory to PATH only if it exists and is not already there.
# Use $HOME instead of hardcoded /home/<username> so this file works on any machine.
_add_path() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1${PATH:+:$PATH}" ;;
    esac
}

_add_path_end() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="${PATH:+$PATH:}$1" ;;
    esac
}

_add_path "$HOME/bin"
_add_path "$HOME/.local/bin"
_add_path "$HOME/.cargo/bin"
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
#aliases
alias cat="bat"
alias rm="trash"
_add_path_end "$HOME/.spicetify"
eval "$(starship init bash)"


# Source - https://superuser.com/a
# Posted by ingkebil, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-27, License - CC BY-SA 3.0


# Bash spelling correction
shopt -s cdspell
shopt -s dirspell

# Better tab completion
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'

# Tab completion: cycle through possibilities
bind '"\C-i": menu-complete'
#nerdfetch
export QT_QPA_PLATFORMTHEME=qt6ct

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export DOTNET_ROOT="$HOME/.dotnet"
_add_path_end "$HOME/.dotnet"

# opencode
_add_path "$HOME/.opencode/bin"

# Added by LM Studio CLI (lms)
_add_path_end "$HOME/.lmstudio/bin"
# End of LM Studio CLI section

export HF_ENDPOINT=https://hf-mirror.com
