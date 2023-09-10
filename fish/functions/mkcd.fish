function mkcd --description "make a directory and cd into.  NOTE: makes parents if they do not exist" -w mkdir
        #        if test (count $argv) -ne 1
        #                set_color red
        #                echo Invalid Parameters Supplied.
        #                echo You supplied (count $argv) args, this function expects 1.
        #                echo Try wrapping your path in \" or \' if this was a single path.
        #                set_color normal
        #                return 1
        #        end

        command mkdir $argv
        
        set LAST_STATUS $status
        if test $LAST_STATUS = 0
            switch $argv[(count $argv)]
                case '-*'
                case '*'
                    cd $argv[(count $argv)]
                    return
            end
        end
end
