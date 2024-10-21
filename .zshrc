export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export GTK_THEME=Catppuccin-Dark

ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/src/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
if [ -d "$HOME/.cargo" ]; then
    source "$HOME/.cargo/env"
fi

alias vim=nvim
alias config='$(which git) --git-dir=$HOME/.git-cfg --work-tree=$HOME'
alias cfgs='config status --untracked-files=no'
alias cdg="cd ~/src/github.com"


if ! [[ $(which npm) =~ "not found"  ]]; then
    mkdir -p "${HOME}/.npm-packages"
    npm config set prefix "${HOME}/.npm-packages"
    NPM_PACKAGES="${HOME}/.npm-packages"

    export PATH="$PATH:$NPM_PACKAGES/bin"
    export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fi

prompt_context() {
  prompt_segment black default ""
}

prompt_dir() {
  prompt_segment blue black '%c'
}

if [ -s "$HOME/.zshrc.embroker" ]; then
    source $HOME/.zshrc.embroker
fi

if [ -s "$HOME/.zshrc.secrets" ]; then
    source $HOME/.zshrc.secrets
fi

alias config='$(which git) --git-dir=$HOME/.git-cfg --work-tree=$HOME'
