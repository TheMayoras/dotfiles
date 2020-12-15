function up
        if count $argv > /dev/null
                for x in (seq $argv[1])
                        cd ..
                end
        else
                cd ..
        end
end

