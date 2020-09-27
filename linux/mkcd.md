```
unalias mkcd
unset -f mkcd

mkcd () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
```

[se](https://unix.stackexchange.com/a/125386/)
