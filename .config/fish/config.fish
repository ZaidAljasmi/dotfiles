set -g fish_greeting ''

if status is-interactive
    if not set -q DISPLAY; and test (tty) = /dev/tty1
        # set -x GTK_THEME Tokyonight-Dark
        # set -x ICON_THEME Tokyonight-Dark
        # set -x GTK_FONT_NAME "JetBrainsMono Nerd Font 15"
        # set -x XCURSOR_THEME Apple-X-Cursor
        # set -x XCURSOR_SIZE 24
        exec sway
    end
end

# prompt
function fish_prompt

    set_color yellow
    if test $PWD = $HOME
        echo -n "~ "
    else
        set_color yellow
        echo -n (prompt_pwd) ""
    end

    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (git branch --show-current 2>/dev/null)
        if test -n "$branch"
            set_color white
            echo -n "$branch "
        end
    end

    set_color white
    echo -n "> " # or λ
end

# fzf extension

eval "$(fzf --fish)"
# Catppuccin-Mocha theme for fzf with transparency:
set -gx FZF_DEFAULT_OPTS '--color=fg:#cdd6f4,bg:-1,hl:#f38ba8,fg+:#cdd6f4,bg+:#313244,hl+:#f38ba8,info:#cba6f7,prompt:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,spinner:#f5e0dc,separator:#94e2d5,border:#1E1E2E,header:#f38ba8 --info=right --prompt="Search: "'
# fzf colors (https://github.com/junegunn/fzf/wiki/Color-schemes) 

# bat tool
export BAT_THEME="Catppuccin Mocha"

# tmux setup
# if status is-interactive
#     and not set -q TMUX
#     exec tmux
# end

# aliases
alias mnt="sudo mount /dev/sdb1 ~/usb"
alias umnt="sudo umount /dev/sdb1 ~/usb"
alias shstart="eval (ssh-agent -c); ssh-add ~/.ssh/id_github"
alias tl='java -jar ~/Documents/tlauncher/TLauncher.jar'
alias ll='ls -lah'
alias vi='nvim'
alias vim='vim.basic'
alias network='nmtui'
alias usage='ncdu'
alias aud='alsamixer'
alias bt='acpi'
alias digital='_JAVA_AWT_WM_NONREPARENTING=1 java -jar /home/zaid/Digital/Digital.jar'
alias rm='rm -I --preserve-root'
alias emacs='emacs -nw'
# run zathura with disown and shortcut word 
function pdf
    zathura $argv &
    disown
end

alias ls='eza --group-directories-first --color=always --icons'
alias ll='eza -lah --group-directories-first --color=always --icons'

alias i='sudo apt install --no-install-recommends'
alias u='sudo apt update && sudo apt upgrade'
alias f='apt search'
alias r='sudo apt remove --purge'
alias rc='sudo apt autoremove && sudo apt clean'

alias shzaid='git remote set-url origin git@github.com:Zaid-Aljasmy/dotfiles.git'

# Neovim opt
set -U fish_user_paths $fish_user_paths /opt/nvim-linux-x86_64/bin

set -gx PATH $PATH $HOME/.config/emacs/bin
set -x TERMINAL foot
# bash ~/.colorscripts/elfman
# pfetch
# Themes setup
fish_config theme choose "Catppuccin Mocha"
# Starship setup
# starship init fish | source
