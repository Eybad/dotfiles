# dotfiles (Termux)

Respaldo público de mi configuración de Termux. Un paquete por programa,
gestionado con [GNU Stow](https://www.gnu.org/software/stow/): cada paquete
replica rutas relativas a `$HOME` y stow las enlaza con symlinks.

> [!NOTE]
> Repo de solo lectura desde otros equipos (`clone`, sin instalar nada).
> Sin secretos: lo privado vive en archivos `*.local`, ignorados por git.

## Restaurar en Termux limpio

```sh
pkg install git stow
git clone https://github.com/<usuario>/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding zsh git termux nvim starship gh bin
```

> [!CAUTION]
> Siempre `--no-folding`: sin eso stow enlaza directorios enteros y las
> apps escribirían dentro del repo.

## Contenido

| paquete | qué instala |
|---|---|
| `zsh` | `.zshrc`, `.zprofile`, `.p10k.zsh`, `.hushlogin` |
| `git` | `.gitconfig` (email noreply + `include` a `~/.gitconfig.local`) |
| `termux` | `.termux/colors.properties`, `.termux/termux.properties` |
| `nvim` | `.config/nvim/` (auto-instala `lazy.nvim` al primer arranque) |
| `starship` | `.config/starship.toml` |
| `gh` | `.config/gh/config.yml` (solo prefs; `hosts.yml` no versionado) |
| `bin` | `bin/arbitraje`, `bin/ii` |

## Después de stow

```sh
termux-reload-settings   # aplica .termux/
gh auth login            # credenciales (hosts.yml no versionado)
```

Plugins zsh (clones git, no versionados — reinstalalos con estos nombres
de directorio; upstreams habituales, confirmalos antes de clonar):

| directorio | upstream habitual |
|---|---|
| `~/powerlevel10k` | `https://github.com/romkatv/powerlevel10k` |
| `~/.zsh-autosuggestions` | `https://github.com/zsh-users/zsh-autosuggestions` |
| `~/.zsh-syntax-highlighting` | `https://github.com/zsh-users/zsh-syntax-highlighting` |
| `~/.zsh-history-substring-search` | `https://github.com/zsh-users/zsh-history-substring-search` |
| `~/.zsh-autopair` | `https://github.com/hlissner/zsh-autopair` |
| `~/.fzf-tab` | `https://github.com/Aloxaf/fzf-tab` |

La fuente de `.termux/` (`font.ttf`) no está versionada: copiala a mano.

## Archivos privados (crear a mano, nunca commitear)

- `~/.zshrc.local` — alias SSH + exports `GOOGLE_*`/`VERTEX_*`.
  El `.zshrc` lo carga solo si existe.
- `~/.gitconfig.local` — `[user]` con email real. El versionado usa el
  noreply de GitHub y el `[include]` va después a propósito, para que lo
  local tenga precedencia.
