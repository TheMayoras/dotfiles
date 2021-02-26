function hexec --description "Execute a command from history by selecting it.  Press ESC to cancel" 
        # fuzzy find in history
        set result (history | sk)

        if test (count $argv) -gt 0
                # more than one arg passed in for some reason
                history delete --exact --case-sensitive "hexec $args"
        else
                history delete --exact --case-sensitive "hexec"
        end
        commandline -i "$result"
end

