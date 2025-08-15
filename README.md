# Neovim Config (Lazy.nvim)

## Install
```bash
git clone <repo> ~/.config/nvim
nvim +Lazy! sync
```

## Custom data location
Ensure your .bashrc contains:
```bash
export XDG_CACHE_HOME=/home/ilya/ssd_disk/nvim-data/cache
export XDG_DATA_HOME=/home/ilya/ssd_disk/nvim-data/share  
export XDG_STATE_HOME=/home/ilya/ssd_disk/nvim-data/state
```

## Cscope Usage
1. Generate cscope database: `:CscopeBuild` or run manually:
   ```bash
   find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
   cscope -b -i cscope.files
   ```

2. Use cscope keymaps:
   - `<leader>cs` - Find symbol
   - `<leader>cg` - Find definition  
   - `<leader>cc` - Find functions calling this function
   - `<leader>ct` - Find text
   - `<leader>cf` - Find file
   - `<leader>ci` - Find files #including this file

## Key Features
- LSP support with nvim-lspconfig
- GitHub Copilot integration
- Telescope fuzzy finder
- Cscope integration for C/C++ navigation
- Auto-completion with nvim-cmp
- Custom XDG directory support

