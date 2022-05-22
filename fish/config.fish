# Path {{{
set -ag fish_user_paths $HOME/.cargo/bin
set -ag fish_user_paths $HOME/.local/bin
set -ag fish_user_paths $HOME/.nvm
set -g  EDITOR nvim
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
alias pip='pip3'


# Replace ls with exa
if command -v exa > /dev/null
	abbr -a l 'exa -alF --icons'
	abbr -a ls 'exa -alF --icons'
	abbr -a ll 'exa -alF --icons'
	abbr -a lll 'exa -laF --icons'
	abbr -a lr  'exa -RF --icons'
	abbr -a lrt 'exa -RTF --icons'
	abbr -a lt  'exa -TF --icons'
else
	abbr -a l 'ls -Al'
	abbr -a ll 'ls -Al'
	abbr -a lll 'ls -lA'
end

# }}}

# PROMPT {{{
# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'auto'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color blue
	echo -ns $USER 
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		set PAR_DIR (dirname $PWD)
		echo -n -s (basename $PAR_DIR) / (basename $PWD)
        else
                set_color yellow
                echo -ns ':~'
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color blue
	echo -n '>> '
	set_color normal
end


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


