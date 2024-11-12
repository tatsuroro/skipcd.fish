function skipcd
    # exec builtin cd
    builtin cd $argv
    or return

    # 環境変数をカンマで分割してリストにする
    set SKIPCD_REPO_PATHS (string split ',' $SKIPCD_REPO_PATH)
    set SKIPCD_SUBDIR_NAMES (string split ',' $SKIPCD_SUBDIR_NAME)

    # 現在のディレクトリが指定されたリポジトリのいずれかにあるか確認
    set -l toplevel (git rev-parse --show-toplevel 2>/dev/null)

    for repo_path in $SKIPCD_REPO_PATHS
        if [ "$toplevel" = "$repo_path" ]
            for subdir_name in $SKIPCD_SUBDIR_NAMES
                if [ -d $subdir_name ]
                    builtin cd $subdir_name
                    return
                end
            end
        end
    end
end
