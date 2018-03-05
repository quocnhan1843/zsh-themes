function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[green]%} ✚%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNCHANGED="%{$fg[green]%}"

ZSH_THEME_VI_MODE_COMMAND="%{$fg_bold[magenta]%}<#%{$reset_color%}"
ZSH_THEME_VI_MODE_INSERT="%{$fg[red]%}❯%{$reset_color%}%{$fg[yellow]%}❯%{$reset_color%}%{$fg[green]%}❯%{$reset_color%}"

vi_mode_prompt_info () {
  if [[ ${KEYMAP} = 'vicmd' ]]
  then
    echo $ZSH_THEME_VI_MODE_COMMAND
  fi
}

git_color () {
  if [[ $(git_prompt_status) ]]
  then
    echo $(git_prompt_status)
  else
    echo $ZSH_THEME_GIT_PROMPT_UNCHANGED
  fi
}

PROMPT='%{$fg[green]%}%c %{$fg[yellow]%}~ %{$reset_color%}$(vi_mode_prompt_info) '
RPROMPT='$(git_color) $(git_prompt_info) '
