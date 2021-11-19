function strip-ext
        set result (string replace -r "\.($argv[2])" '' $argv[1])
        echo $result
end
