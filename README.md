# Installing on a new system

Add the following alias to `~/.zshrc`
```sh
alias config='$(which git) --git-dir=$HOME/.git-cfg --work-tree=$HOME'
```

Add the bare repo to gitignore, for avoiding recursion
```sh
echo ".git-cfg" >> .gitignore
```

Clone the repo
```sh
git clone --bare <git-repo-url> $HOME/.git-cfg
```

Finally, checkout the entirety of the files with
```sh
config checkout
```

or alternatively, select discrete files
```sh
config checkout .config/
```

# Commiting new changes to files

```sh
config status
config add
config commit
config push
```




