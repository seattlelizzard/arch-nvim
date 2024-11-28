return {
  {
    'nvim-lua/plenary.nvim', -- Optional dependency for shell commands
    config = function()
      -- Function to replace visual selection with the printf output
      local function replace_with_printf()
        -- Get the visual selection range
        local line_start, col_start = unpack(vim.fn.getpos("'<"), 2, 3)
        local line_end, col_end = unpack(vim.fn.getpos("'>"), 2, 3)

        -- Get the selected lines
        local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)

        -- Trim the selection to the exact range
        if #lines > 0 then
          lines[#lines] = string.sub(lines[#lines], 1, col_end)
          lines[1] = string.sub(lines[1], col_start)
        end
        local selection = table.concat(lines, " ")

        -- Run printf command on the selection
        local handle = io.popen(string.format('printf "%%x\\n" %s', selection))
        local result = handle:read("*a")
        handle:close()

        -- Remove trailing newlines from the result
        result = result:gsub("%s+$", "")

        -- Replace the selected text with the output
        vim.api.nvim_buf_set_text(
          0, -- Current buffer
          line_start - 1, col_start - 1, -- Start position
          line_end - 1, col_end, -- End position
          { result } -- Replacement text
        )
      end

      -- Create a user command for ReplaceWithHex
      vim.api.nvim_create_user_command("ReplaceWithHex", function()
        replace_with_printf()
      end, {
        range = true, -- Allow range for manual invocation
      })

      -- Map <leader>x to call the command in visual mode
      vim.api.nvim_set_keymap(
        'v', -- Visual mode
        '<leader>x', -- Your chosen keybinding
        ":<C-u>ReplaceWithHex<CR>", -- Clear the range before invoking the command
        { noremap = true, silent = true }
      )
    end
  }
}
