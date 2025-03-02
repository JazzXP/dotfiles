set PATH /usr/local/opt/vim/bin /usr/local/opt/ruby/bin /usr/local/opt/git/bin/ /usr/local/opt/gnu-tar/libexec/gnubin $PATH ~/bin/ /Applications/WezTerm.app/Contents/MacOS
set -g MANPAGER "sh -c 'col -bx | bat -l man -p --theme 'ansi''"
set -g LDFLAGS "$LDFLAGS -L/opt/homebrew/opt/ruby/lib"
set -g CPPFLAGS "$CPPFLAGS -I/opt/homebrew/opt/ruby/include"
set -g PKG_CONFIG_PATH "$PKG_CONFIG_PATH:/opt/homebrew/opt/ruby/lib/pkgconfig"
set -g TERM xterm-256color
set -g PNPM_HOME /Users/sdickinson/Library/pnpm

if status is-interactive
    # Commands to run in interactive sessions can go here
    ~/bin/run_once_daily.sh

    alias ls=lsd
    alias cat=bat
    wezterm shell-completion --shell fish | source
    fzf --fish | source
    oh-my-posh init fish --config ~/.config/slim.omp.json | source
end

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
