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
