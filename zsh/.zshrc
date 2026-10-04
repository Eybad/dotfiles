# ~/.zshrc

# --- Selector de prompt para pruebas A/B ---
typeset -g PROMPT_ENGINE=p10k   # "p10k" | "starship" — cambiar y correr: exec zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ "$PROMPT_ENGINE" == "p10k" ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

# Variables de entorno
export EDITOR='nvim'
export LANG=en_US.UTF-8

# --- Tema Ayu Dark (TerminalColors.com) - #0b0e14 ---
export BAT_THEME=ansi
# Sin border: fzf-tab (completado) rompe su layout con border global.
export FZF_DEFAULT_OPTS='--color=bg:#0b0e14,fg:#bfbdb6,hl:#ffb454,fg+:#ffffff,bg+:#1b3a5b,hl+:#f9af4f,info:#686868,marker:#7fd962,prompt:#53bdfa,pointer:#53bdfa,spinner:#e6b450,header:#90e1c6,preview-bg:#0b0e14'

# Colores de man pages via less (LESS_TERMCAP) - paleta del tema
export LESS_TERMCAP_mb=$'\e[1;38;2;205;161;250m'  # bold blink: purpura
export LESS_TERMCAP_md=$'\e[1;38;2;205;161;250m'  # bold: purpura
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;38;2;199;199;199;48;2;27;58;91m'  # standout: texto claro sobre borde
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;38;2;144;225;198m'  # subrayado: cian
export LESS_TERMCAP_ue=$'\e[0m'

# Colores de grep/rg - match amarillo, linea naranja, archivo cian
export GREP_COLORS='ms=1;38;2;255;180;84:mt=1;38;2;255;180;84:ln=1;38;2;249;175;79:fn=1;38;2;144;225;198:se=1;38;2;104;104;104:bn=1;38;2;104;104;104'
export RG_COLORS='match:fg=255,180,84:style:bold:line:fg=249,175,79:style:bold:column:fg=249,175,79:style:bold:path:fg=144,225,198:style:bold'

# Configuración del Historial
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE

# Opciones de comportamiento de Zsh
setopt AUTO_CD INTERACTIVE_COMMENTS

# Saltos de palabra que respeten "/" como límite
WORDCHARS=${WORDCHARS//\/}

# Inicialización de Zoxide
eval "$(zoxide init zsh)"

# Alias de productividad
alias c='clear'
alias ls='eza -a --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias cat='bat --style=plain'

# Colores de eza (ls) - Ayu Dark con truecolor
# di=dir azul, ln=link cian, ex=ejecutable verde, fi=archivo texto
export EXA_COLORS='di=1;38;2;83;189;250:ln=1;38;2;249;175;79:ex=1;38;2;127;217;98:fi=1;38;2;199;199;199:*.md=1;38;2;255;180;84:*.txt=1;38;2;104;104;104:*.zip=1;38;2;205;161;250:*.gz=1;38;2;205;161;250:*.tar=1;38;2;205;161;250:*.xz=1;38;2;205;161;250:*.png=1;38;2;205;161;250:*.jpg=1;38;2;205;161;250:*.gif=1;38;2;205;161;250:*.svg=1;38;2;205;161;250:*.webp=1;38;2;205;161;250:*.mp4=1;38;2;234;108;115:*.mkv=1;38;2;234;108;115:*.mp3=1;38;2;234;108;115:*.flac=1;38;2;234;108;115:*.sh=1;38;2;127;217;98:*.zsh=1;38;2;127;217;98:*.py=1;38;2;144;225;198:*.js=1;38;2;255;180;84:*.ts=1;38;2;144;225;198:*.json=1;38;2;255;180;84:*.yml=1;38;2;255;180;84:*.yaml=1;38;2;255;180;84:*.toml=1;38;2;255;180;84:*.rs=1;38;2;234;108;115:*.go=1;38;2;144;225;198:*.c=1;38;2;144;225;198:*.h=1;38;2;144;225;198:*.cpp=1;38;2;234;108;115:*.html=1;38;2;234;108;115:*.css=1;38;2;205;161;250:*.conf=1;38;2;104;104;104:*.log=1;38;2;104;104;104:README.md=1;38;2;127;217;98:Makefile=1;38;2;127;217;98'

# LS_COLORS: espejo de EXA_COLORS para herramientas que usan ls clasico
export LS_COLORS='di=1;38;2;83;189;250:ln=1;38;2;249;175;79:ex=1;38;2;127;217;98:fi=1;38;2;199;199;199:*.md=1;38;2;255;180;84:*.txt=1;38;2;104;104;104:*.zip=1;38;2;205;161;250:*.gz=1;38;2;205;161;250:*.tar=1;38;2;205;161;250:*.xz=1;38;2;205;161;250:*.png=1;38;2;205;161;250:*.jpg=1;38;2;205;161;250:*.gif=1;38;2;205;161;250:*.svg=1;38;2;205;161;250:*.webp=1;38;2;205;161;250:*.mp4=1;38;2;234;108;115:*.mkv=1;38;2;234;108;115:*.mp3=1;38;2;234;108;115:*.flac=1;38;2;234;108;115:*.sh=1;38;2;127;217;98:*.zsh=1;38;2;127;217;98:*.py=1;38;2;144;225;198:*.js=1;38;2;255;180;84:*.ts=1;38;2;144;225;198:*.json=1;38;2;255;180;84:*.yml=1;38;2;255;180;84:*.yaml=1;38;2;255;180;84:*.toml=1;38;2;255;180;84:*.rs=1;38;2;234;108;115:*.go=1;38;2;144;225;198:*.c=1;38;2;144;225;198:*.h=1;38;2;144;225;198:*.cpp=1;38;2;234;108;115:*.html=1;38;2;234;108;115:*.css=1;38;2;205;161;250:*.conf=1;38;2;104;104;104:*.log=1;38;2;104;104;104:README.md=1;38;2;127;217;98:Makefile=1;38;2;127;217;98'

# SSH a VPS personal — movidos a ~/.zshrc.local (privado, no versionado).

# Completado con cache (regenerar dump con "compinit" al instalar plugins nuevos)
autoload -Uz compinit
compinit -C

# Autopair: después de compinit (recomendación del plugin)
source ~/.zsh-autopair/autopair.zsh

# Estilos de completado (deben ir antes de fzf-tab)
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'

# fzf-tab: después de compinit, antes de autosuggestions/syntax-highlighting
source ~/.fzf-tab/fzf-tab.zsh

# Historial interactivo y vinculación de teclas
source ~/.zsh-history-substring-search/zsh-history-substring-search.zsh
# Resaltado del match: fuera de la paleta quedaba con bg magenta/rojo pesado.
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=#ffb454,underline,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=#ea6c73,bold'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Integración nativa de FZF
source /data/data/com.termux/files/usr/share/fzf/key-bindings.zsh
source /data/data/com.termux/files/usr/share/fzf/completion.zsh

# Autosuggestions: después de fzf-tab
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
# El default 'fg=8' resuelve a #4B5263 (muy tenue sobre fondo oscuro); subo a
# gris de comentario #686868: visible pero secundario.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#686868,bold'

# Resaltado de sintaxis (SIEMPRE al final de los plugins)
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Estilos zsh-syntax-highlighting - Ayu Dark
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ea6c73,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#cda1fa,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#cda1fa,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#bfbdb6,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#686868,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#cda1fa,bold'
# Defaults del plugin que quedaban fuera de la paleta (verde/cian/magenta ANSI
# crudos): los alineo con los roles existentes.
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#7fd962,underline,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#7fd962,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#cda1fa,bold'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#cda1fa,bold'
ZSH_HIGHLIGHT_STYLES[for-loop-variable]='fg=#f9af4f,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#cda1fa,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ffb454,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#686868,bold'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#f9af4f,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ea6c73,bold'
ZSH_HIGHLIGHT_STYLES[sudo]='fg=#f07178,bold'

# --- Carga del motor de prompt seleccionado ---
if [[ "$PROMPT_ENGINE" == "p10k" ]]; then

  # gitstatus compilado contra libgit2 1.9.6 de Termux (rama local
  # termux-gitstatus-fix de ~/powerlevel10k). Si el binario se pierde,
  # recompilar: cd ~/powerlevel10k/gitstatus && make

  # p10k define PS1/RPS1; cargar después de los plugins de zle y antes de ~/.p10k.zsh
  source ~/powerlevel10k/powerlevel10k.zsh-theme

  # Para aplicar cambios: exec zsh. NUNCA "source ~/.zshrc" (FAQ oficial p10k).
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  # Segmentos custom (RAM usada % / disco libre GB): definidos y registrados
  # en ~/.p10k.zsh (bloque al final, sección "Custom segments").

elif [[ "$PROMPT_ENGINE" == "starship" ]]; then

  eval "$(starship init zsh)"

  # Transient prompt: al aceptar la línea con Enter, zle-line-finish
  # dispara y redibuja esa línea con un prompt mínimo.
  zle-line-finish() {
    PROMPT='❯ '
    RPROMPT=''
    zle reset-prompt
  }
  zle -N zle-line-finish

fi

# --- Cursor delgado (bar) siempre ---
# Termux solo aplica terminal-cursor-style al iniciar la sesión; apps TUI
# (opencode, nvim, tmux...) mandan DECSCUSR y lo dejan en bloque al salir.
# Re-aplicar bar en cada prompt. En Termux \e[5 q y \e[6 q son equivalentes.
autoload -Uz add-zsh-hook
_restore_bar_cursor() { printf '\e[5 q' }
add-zsh-hook precmd _restore_bar_cursor

# --- Dashboard ii ---
alias ii='~/bin/ii'
export PATH="$HOME/go/bin:$PATH"

# Google Cloud / Vertex — movidos a ~/.zshrc.local (apuntan a credencial privada).
# Bolivia (UTC-4, sin DST). TZDIR apunta al tzdata de IANA de PostgreSQL:
# glibc no trae zoneinfo en Termux ni hereda persist.sys.timezone, y sin
# TZDIR America/La_Paz cae a UTC. "BOL4" no sirve: Intl/ICU solo acepta zonas IANA.
export TZDIR=/data/data/com.termux/files/usr/share/postgresql/timezone
export TZ=America/La_Paz

# Descarta CONTEXT7_API_KEY heredada de sesiones viejas; ctx7 usa sesión OAuth (sin key en disco).
unset CONTEXT7_API_KEY

# --- Config local privada (no versionada) ---
# ~/.zshrc.local contiene alias SSH y exports con datos privados.
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
