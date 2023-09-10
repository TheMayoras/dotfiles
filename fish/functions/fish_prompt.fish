function fish_prompt
        set LAST_STATUS $status
        if test $LAST_STATUS -eq 0
                set_color blue
                echo -ns '✓ '
        else
                set_color magenta
                printf '%d ' $LAST_STATUS
        end

	set_color blue
	echo -ns $USER 
        set_color brblack
        echo -n ':'
	if [ $PWD != $HOME ]
		set_color green
		set PAR_DIR (dirname $PWD)
		echo -ns (basename $PAR_DIR) / (basename $PWD)
        else
                set_color green
                echo -ns '~'
	end
	set_color -di magenta
	printf '%s ' (__fish_git_prompt)
        set_color normal # exit the dim and italics
        set_color blue
	echo -n '$> '
	set_color normal
end

