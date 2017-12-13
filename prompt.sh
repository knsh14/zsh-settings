#branch名を表示する
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "need to commit"
zstyle ':vcs_info:git:*' unstagedstr "need to add"
zstyle ':vcs_info:git:*' formats '[%b] %c%u'
zstyle ':vcs_info:git:*' actionformats '[%b|%a] %c%u'

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"

case ${UID} in
0)
    PROMPT="%{$fg[cyan]%}%n%%%{$reset_color%} "
    RPROMPT="%1(v|%F{green}%1v%f|) [%~]"
    PROMPT2="%B%{$fg[cyan]%}%_#%{$reset_color%}%b "
    SPROMPT="%B%{$fg[red]m%}%r is correct? [n,y,a,e]:%{$reset_color%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{$fg[cyan]%}%n%%%{$reset_color%} "
    RPROMPT="%1(v|%F{green}%1v%f|) [%~]"
    PROMPT2="%{$fg[cyan]%}%_%%%{$reset_color%} "
    SPROMPT="%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac
