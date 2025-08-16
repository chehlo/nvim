local M = {}

-- Function to check for keymap conflicts
M.check_keymap_conflicts = function()
  local conflicts = {}
  local keymaps = {}

  -- Get all current keymaps for different modes
  local modes = { 'n', 'i', 'v', 'x', 's', 'o', 't', 'c' }

  for _, mode in ipairs(modes) do
    local mode_maps = vim.api.nvim_get_keymap(mode)
    for _, map in ipairs(mode_maps) do
      local key = mode .. ":" .. map.lhs
      if keymaps[key] then
        table.insert(conflicts, {
          mode = mode,
          key = map.lhs,
          existing = keymaps[key],
          new = map.rhs or map.callback
        })
      else
        keymaps[key] = map.rhs or map.callback or "callback function"
      end
    end
  end

  -- Print results
  if #conflicts > 0 then
    print("⚠️  KEYMAP CONFLICTS DETECTED:")
    for _, conflict in ipairs(conflicts) do
      print(string.format("  Mode: %s, Key: %s", conflict.mode, conflict.key))
      print(string.format("    Existing: %s", conflict.existing))
      print(string.format("    Conflict: %s", conflict.new))
      print("")
    end
  else
    print("✅ No keymap conflicts detected!")
  end

  return conflicts
end

-- Function to check a specific key combination
M.check_specific_key = function(mode, key)
  local maps = vim.api.nvim_get_keymap(mode)
  local found = {}

  for _, map in ipairs(maps) do
    if map.lhs == key then
      table.insert(found, {
        mode = mode,
        key = key,
        rhs = map.rhs or "callback function",
        desc = map.desc or "no description",
        buffer = map.buffer or false
      })
    end
  end

  if #found > 0 then
    print(string.format("🔍 Key '%s' in mode '%s':", key, mode))
    for _, mapping in ipairs(found) do
      print(string.format("  → %s (%s)", mapping.rhs, mapping.desc))
      if mapping.buffer then
        print("    (buffer-local)")
      end
    end
  else
    print(string.format("✅ Key '%s' in mode '%s' is available!", key, mode))
  end

  return found
end

-- Function to suggest alternative keys
M.suggest_alternatives = function(base_key)
  local alternatives = {
    ["<C-Space>"] = { "<C-g>", "<C-s>", "<A-Space>", "<C-Tab>", "<F2>" },
    ["<C-l>"] = { "<C-;>", "<C-'>", "<A-l>", "<C-n>", "<F3>" },
    ["<C-h>"] = { "<C-p>", "<C-b>", "<A-h>", "<C-u>", "<F4>" },
    ["<leader>c"] = { "<leader>x", "<leader>z", "<leader>m", "<leader>v" }
  }

  local alts = alternatives[base_key] or { "No suggestions available" }
  print(string.format("💡 Alternative keys for '%s':", base_key))
  for i, alt in ipairs(alts) do
    print(string.format("  %d. %s", i, alt))
  end

  return alts
end

-- Setup user commands
M.setup = function()
  vim.api.nvim_create_user_command("CheckKeymaps", M.check_keymap_conflicts, {})
  vim.api.nvim_create_user_command("CheckKey", function(opts)
    local parts = vim.split(opts.args, " ")
    local mode = parts[1] or "n"
    local key = parts[2] or "<C-Space>"
    M.check_specific_key(mode, key)
  end, { nargs = "*", desc = "Check specific key (usage: CheckKey <mode> <key>)" })

  vim.api.nvim_create_user_command("SuggestKeys", function(opts)
    M.suggest_alternatives(opts.args)
  end, { nargs = 1, desc = "Suggest alternative keys" })
end

-- Add this function to lua/keymap-checker.lua

-- Function to test actual key behavior (detects built-in mappings too)
M.test_key_behavior = function(mode, key)
  print(string.format("🧪 Testing key '%s' in mode '%s'...", key, mode))

  -- First check custom mappings
  local custom_maps = M.check_specific_key(mode, key)

  -- Test for common built-in behaviors
  local builtin_behaviors = {
    ["i"] = {
      ["<C-Space>"] = "Often mapped to next word or completion trigger",
      ["<C-w>"] = "Delete word backward",
      ["<C-u>"] = "Delete to beginning of line",
      ["<C-h>"] = "Backspace",
      ["<C-l>"] = "Often used for window navigation",
      ["<C-n>"] = "Next completion item",
      ["<C-p>"] = "Previous completion item"
    },
    ["n"] = {
      ["<C-Space>"] = "May be mapped to word movement or completion",
      ["<C-w>"] = "Window commands prefix",
      ["<C-u>"] = "Scroll up half page",
      ["<C-d>"] = "Scroll down half page",
      ["<C-f>"] = "Page down",
      ["<C-b>"] = "Page up"
    }
  }

  if builtin_behaviors[mode] and builtin_behaviors[mode][key] then
    print(string.format("⚠️  Built-in behavior: %s", builtin_behaviors[mode][key]))
    print("   This may interfere with your intended mapping!")
  end

  -- Check if it's a terminal escape sequence issue
  if key:match("C%-Space") then
    print("💡 Terminal tip: Some terminals send different codes for Ctrl-Space")
    print("   Try these alternatives:")
    print("   - <C-@>  (Ctrl-@ is often the same as Ctrl-Space)")
    print("   - <C-g>  (Usually available)")
    print("   - <A-Space> (Alt-Space)")
    print("   - <F2>   (Function keys are very safe)")
  end

  return {
    custom_mappings = custom_maps,
    has_builtin = builtin_behaviors[mode] and builtin_behaviors[mode][key] ~= nil
  }
end

-- Function to find truly safe keys
M.find_safe_keys = function(mode)
  local safe_candidates = {
    ["i"] = { "<C-g>", "<A-Space>", "<F2>", "<F3>", "<F4>", "<C-s>", "<A-s>" },
    ["n"] = { "<F2>", "<F3>", "<F4>", "<leader>gg", "<leader>tt", "<A-Space>" }
  }

  local mode_candidates = safe_candidates[mode] or {}
  local truly_safe = {}

  print(string.format("🔍 Finding safe keys for mode '%s':", mode))

  for _, key in ipairs(mode_candidates) do
    local maps = vim.api.nvim_get_keymap(mode)
    local is_mapped = false

    for _, map in ipairs(maps) do
      if map.lhs == key then
        is_mapped = true
        break
      end
    end

    if not is_mapped then
      table.insert(truly_safe, key)
      print(string.format("  ✅ %s - Available", key))
    else
      print(string.format("  ❌ %s - Already mapped", key))
    end
  end

  return truly_safe
end

-- Add to the setup function
local original_setup = M.setup
M.setup = function()
  original_setup() -- Call the original setup

  -- Add new commands
  vim.api.nvim_create_user_command("TestKey", function(opts)
    local parts = vim.split(opts.args, " ")
    local mode = parts[1] or "i"
    local key = parts[2] or "<C-Space>"
    M.test_key_behavior(mode, key)
  end, { nargs = "*", desc = "Test key behavior (usage: TestKey <mode> <key>)" })

  vim.api.nvim_create_user_command("FindSafeKeys", function(opts)
    local mode = opts.args or "i"
    M.find_safe_keys(mode)
  end, { nargs = "?", desc = "Find safe keys for mode" })
end
return M
