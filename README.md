# Neovim Configuration

Modern Neovim setup for C/C++ and web development.

## Install
```bash
git clone <repo> ~/.config/nvim
nvim +Lazy! sync
```

**Custom data location** (optional, add to `.bashrc`):
```bash
NVIM_ROOT = <<your-nvim-data-root>
export XDG_CACHE_HOME=$NVIM_ROOT/cache
export XDG_DATA_HOME=$NVIM_ROOT/share
export XDG_STATE_HOME=$NVIM_ROOT/state
```

## Essential Keymaps

**Leader:** `\` (backslash)

### Core
| Key | Action |
|-----|--------|
| `\w` | Save |
| `\q` | Quit |
| `<C-h/j/k/l>` | Window navigation |

### AI (Copilot)
| Key | Action |
|-----|--------|
| `<F2>` | **Trigger suggestions** |
| `<C-y>` | Accept suggestion |
| `<C-w>` | Accept word |
| `<C-l>` | Accept line |
| `<C-e>` | Dismiss |
| `\cpe/\cpd/\cps` | Enable/Disable/Status |

### Navigation
| Key | Action |
|-----|--------|
| `\ff` | **Find files** |
| `\fg` | **Search in files** |
| `\e` | File explorer |
| `gd` | Go to definition (LSP) |
| `gr` | Find references |

### C/C++ (Cscope)
| Key | Action |
|-----|--------|
| `\cg` | **Go to definition** |
| `\cs` | Find symbol |
| `\cc` | Find callers |
| `\ct` | Find text |

### Code
| Key | Action |
|-----|--------|
| `\f` | **Format file** |
| `\rn` | Rename symbol |
| `\ca` | Code actions |
| `K` | Show docs |

## Commands

```bash
# Cscope setup
:CscopeBuild

# Keymap debugging
:CheckKeymaps
:CheckKey i <F2>
:FindSafeKeys i

# Plugin management
:Lazy sync
```

## Language Support

- **C/C++:** clangd + Cscope
- **Web:** TypeScript, HTML, CSS, JSON
- **Formatting:** Prettier, ESLint via conform.nvim
- **Database:** SQL with vim-dadbod

## Structure

```
lua/
├── core/           # Basic Vim settings
├── config/         # Plugin configs (each has own keymaps)
├── plugins/        # Plugin definitions
├── keymap-checker.lua  # Conflict detection
└── utils.lua       # Utilities
```

**Plugin-centric keymaps:** Each plugin manages its own keys to avoid conflicts.
