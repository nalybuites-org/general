# topbar.zsh-theme
#
# Author: Michael Wright
# URL: http://mikedoesit.net/
# Repo: https://github.com/nalybuites/general
# Direct Link: https://github.com/nalybuites/general/zsh/themes/topbar.zsh-theme
#
# Based on af-magic by Andy Flemming: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		2013-10-31
# Last modified on:	2013-10-31



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# color vars
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"
typeset +H my_ltblue="$FG[075]"

precmd() {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1))
    USERNAME=`id -un`
    HOSTNAME=`hostname --long`
    HLEFT="$USERNAME@$HOSTNAME"
    HRIGHT=`date +'%F %T %Z'`

    local hleft_len=${#HLEFT} 
    local hright_len=${#HRIGHT}
    local mid_len
    (( mid_len=$TERMWIDTH - ($hleft_len + $hright_len) - 1 ))
    print "\033[38;5;237m$HLEFT ${(l:$mid_len:: :)} \033[38;5;214m$HRIGHT$reset_color"
}

# primary prompt
PS1='%{$FG[032]%}%~$(git_prompt_info) %{$FG[105]%}%(!.#.»)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$my_ltblue%}(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$my_orange%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$my_ltblue%})%{$reset_color%}"
