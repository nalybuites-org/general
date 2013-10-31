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
# Last modified on:	2-13-10-31



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local TERMWIDTH
(( TERMWIDTH = ${COLUMNS} - 1))
HLEFT='%n@%M'
HRIGHT='%D{%F %H:%M:%S %Z}'

local hleft_len=${#${(%):-%n@%M}} 
local hright_len=${#${(%):-%D{%F %H:%M:%S %Z}}}
local mid_len
(( mid_len=$TERMWIDTH - ($hleft_len + $hright_len) - 2 ))

# primary prompt
PROMPT='$FG[237]$HLEFT ${(l:$mid_len:: :)} $HRIGHT%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
