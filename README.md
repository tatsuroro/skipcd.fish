# skipcd.fish

A utility to skip to a preferred subdirectory when navigating to a GitHub repository with cd.

## Usage

1. Install with fisher  
2. Set env variables (below is a sample)  

```
set -gx SKIPCD_REPO_PATH /path/to/github.com/hoge
set -gx SKIPCD_SUBDIR_NAME target_subdir
```

3. Alias cd (or exec skipcd directly)
