# Path {{{
set -ag fish_user_paths $HOME/.cargo/bin
set -ag fish_user_paths $HOME/.local/bin
set -ag fish_user_paths $HOME/.nvm
set -g  EDITOR nvim
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
# }}}

# FZF {{{
setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'
# }}}

# Abbreviations {{{
# mkcd becomes mkdir and cd

abbr -a nv 'nvim'
abbr -a vim 'nvim'

# }}}

# Aliases {{{
# run last command
alias !!='commandline -i "$history[1]";history delete --exact --case-sensitive "!!"'

# I want to see colors in less
alias less='less -r'

# I want Python3 damnit
alias python='python3'
alias pip='python3 -m pip'
alias pip3='python3 -m pip'

# Replace ls with exa
if command -v exa > /dev/null
	abbr -a l 'exa -alF --icons --group-directories-first --git'
	abbr -a ls 'exa -alF --icons --group-directories-first --git'
	abbr -a ll 'exa -alF --icons --group-directories-first --git'
	abbr -a lll 'exa -laF --icons --group-directories-first --git'
	abbr -a lr  'exa -RF --icons --group-directories-first --git'
	abbr -a lrt 'exa -RTF --icons --group-directories-first --git'
	abbr -a lt  'exa -TF --icons --group-directories-first --git'
else
	abbr -a l 'ls -Al'
	abbr -a ll 'ls -Al'
	abbr -a lll 'ls -lA'
end

# }}}

# Prompt {{{
# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'auto'
set -g fish_prompt_pwd_dir_length 3

function fish_greeting
	set_color green
	echo  "Welcome, " (hostname)
end

# }}}

# MISC {{{

alias config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/home/bmay'
fish_default_key_bindings

# }}}

# GUI {{{
# for GUI, execute route.exe in the windows to determine its IP address

set -gx DISPLAY (route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

# }}}
