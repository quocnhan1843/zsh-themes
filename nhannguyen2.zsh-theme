local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c $(vi_mode_prompt_info)'
RPROMPT='%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_VI_MODE_COMMAND="%{$fg_bold[magenta]%}<#%{$reset_color%}"
ZSH_THEME_VI_MODE_INSERT="%{$fg[red]%}❯%{$reset_color%}%{$fg[yellow]%}❯%{$reset_color%}%{$fg[green]%}❯%{$reset_color%}"

vi_mode_prompt_info () {
  if [[ ${KEYMAP} = 'vicmd' ]]
  then
    echo $ZSH_THEME_VI_MODE_COMMAND
  else
    echo $ZSH_THEME_VI_MODE_INSERT
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"