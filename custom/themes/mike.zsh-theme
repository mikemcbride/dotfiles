# This is a tweaked clone of the awesome ys theme for oh-my-zsh:
# http://blog.ysmood.org/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Git Info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}\u2731"
ZSH_THEME_GIT_PROMPT_CLEAN=""


: <<'FORMAT'
Prompt format:

PRIVILEGES USER @ MACHINE in DIRECTORY on BRANCH STATE [TIME]
$ COMMAND

For example:

% ys@ys-mbp in ~/.oh-my-zsh on master * [21:47:42]
$

FORMAT

PROMPT="
%{$terminfo[bold]$fg[blue]%}%#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[white]%}@ \
%{$fg[green]%}%m \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
