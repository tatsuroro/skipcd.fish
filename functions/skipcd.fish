function skipcd
    # exec builtin cd
    builtin cd $argv
    or return

    if set -q SKIPCD_REPO_PATH
        # check if the current directory is in the specified repository
        set -l toplevel (git rev-parse --show-toplevel 2>/dev/null)
        if [ "$toplevel" = "$SKIPCD_REPO_PATH" ]
            if set -q SKIPCD_SUBDIR_NAME; and [ -d $SKIPCD_SUBDIR_NAME ]
                builtin cd $SKIPCD_SUBDIR_NAME
            end
        end
    end
end
