# auto suggestions setting
bindkey '^f' autosuggest-accept

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

# zaw setting
if zplug check "zsh-users/zaw"; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
    zstyle ':chpwd:*' recent-dirs-default yes
    zstyle ':completion:*' recent-dirs-insert both
    bindkey '^@' zaw-src-cdr
    bindkey '^R' zaw-history
    bindkey '^X^F' zaw-git-files
    bindkey '^X^B' zaw-git-branches
    bindkey '^X^P' zaw-process
    zstyle ':filter-select' case-insensitive yes
    zstyle ':filter-select' max-lines 10 # use 10 lines for filter-select
    zstyle ':filter-select' max-lines -10 # use $LINES - 10 for filter-select
    zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
    zstyle ':filter-select' extended-search yes # see below
    zstyle ':filter-select' hist-find-no-dups yes # ignore duplicates in history source
    zstyle ':filter-select:highlight' selected fg=black,bg=white,standout
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history
