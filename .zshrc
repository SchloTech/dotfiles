# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile
source $HOME/.api_keys
source $HOME/.aws_profile

# Start ssh-agent silently and only if not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Add SSH key if it exists (checking ed25519 first, then rsa as fallback)
if [[ -f ~/.ssh/id_ed25519 ]]; then
    ssh-add -q ~/.ssh/id_ed25519 2>/dev/null
elif [[ -f ~/.ssh/id_rsa ]]; then
    ssh-add -q ~/.ssh/id_rsa 2>/dev/null
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tmux sessionizer
bindkey -s '^F' 'tmux-sessionizer\n'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
