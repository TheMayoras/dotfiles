# set the path to include cargo
set -ag fish_user_paths $HOME/.cargo/bin
set -ag fish_user_paths $HOME/.local/bin
set -ag fish_user_paths $HOME/.nvm
set -g  EDITOR nvim

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

# ====== Abbreviations ==============
# mkcd becomes mkdir and cd
abbr -a nv 'nvim'
abbr -a vim 'nvim'

# run last command
alias !!='commandline -i "$history[1]";history delete --exact --case-sensitive "!!"'

# I want to see colors in less
alias less='less -r'

# I want Python3 damnit
alias python='python3'
alias pip='pip3'

# run last command starting with arg
function h
        # concat all arguments passed 
	set args (echo $argv)
	set result (history search -n 1 --prefix "$args")
	if test -n "$result"
                commandline -i "$result[1]"
                history delete --exact --case-sensitive "h $args"
	else
		set_color red
		echo "!! Nothing found !!" 
		set_color normal
	end
end

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

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'auto'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color blue
	echo -n -s (hostname) " @ " $USER
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		set PAR_DIR (dirname $PWD)
		echo -n -s (basename $PAR_DIR) / (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end


function fish_greeting
	set_color green
	echo  "Welcome, " (hostname)
end

alias config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/home/bmay'
fish_default_key_bindings
