
# ── Path ─────────────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"

path=("$HOME/.juliaup/bin" $path)
export PATH

# ── SSH agent ─────────────────────────────────────────────────────────────────

if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval "$(ssh-agent -s)" > /dev/null 2>&1
fi
ssh-add ~/.ssh/id_* 2>/dev/null

# ── NVM ───────────────────────────────────────────────────────────────────────

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]             && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ]    && source "$NVM_DIR/bash_completion"

# ── Bun ───────────────────────────────────────────────────────────────────────

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ── Zsh options ───────────────────────────────────────────────────────────────

setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD           # cd pushes to dir stack
setopt PUSHD_IGNORE_DUPS
setopt CORRECT              # suggest corrections
setopt INTERACTIVE_COMMENTS # allow # comments in shell
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE    # don't save commands starting with space
setopt SHARE_HISTORY        # share history across sessions
setopt GLOB_DOTS            # include dotfiles in globs

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

# ── Completion ────────────────────────────────────────────────────────────────

autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{purple}── %d ──%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' squeeze-slashes true

# ── Key bindings ──────────────────────────────────────────────────────────────

bindkey -e                              # emacs keys (ctrl-a, ctrl-e, etc.)
bindkey '^[[A' history-search-backward # up arrow searches history
bindkey '^[[B' history-search-forward
bindkey '^[[1;5C' forward-word         # ctrl+right
bindkey '^[[1;5D' backward-word        # ctrl+left

# ── Aliases — navigation ──────────────────────────────────────────────────────

alias ls='lsd'
alias ll='lsd -lah'
alias la='lsd -A'
alias lt='lsd --tree --depth 2'
alias l='lsd -lh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -- -='cd -'   # go back to last dir

# ── Aliases — tools ───────────────────────────────────────────────────────────

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias cat='bat --style=plain'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -sh'
alias free='free -h'

alias top='btop'

# ── Aliases — git ─────────────────────────────────────────────────────────────

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# ── Aliases — system ──────────────────────────────────────────────────────────

alias pac='yay'
alias update='yay -Syu'
alias cleanup='yay -Sc --noconfirm'
alias mirrors='sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'

alias reload='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias wayconf='nvim ~/.config/waybar/config'

alias ip='ip --color=auto'
alias ports='ss -tulnp'

# ── Zoxide ────────────────────────────────────────────────────────────────────

eval "$(zoxide init zsh)"   # replaces cd with zoxide

# ── Starship ──────────────────────────────────────────────────────────────────

eval "$(starship init zsh)"

