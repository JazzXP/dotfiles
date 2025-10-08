# Gruvbox Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#7c6f64'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[function]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[command]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#b8ab26,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ebdbb2,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ebdbb2'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ebdbb2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#ebdbb2'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#b8ab26'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#b8ab26'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#de8019'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#de8019'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#de8019'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#de8019'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#cc241d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#cc241d'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f9e2af'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#cc241d'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#e5c07b'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#cc241d'
ZSH_HIGHLIGHT_STYLES[path]='fg=#e5c07b,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#de8019,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#e5c07b,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#de8019,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ebdbb2'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#cc241d'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[default]='fg=#e5c07b'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#e5c07b'
