return {
  {
    'nvim-lua/plenary.nvim', -- Optional dependency for shell commands
    config = function()
      -- Function to replace visual selection with the printf output for each number
      local function replace_numbers_with_hex()
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
        local selection = table.concat(lines, "\n")

        -- Replace each number in the selection
        local processed = selection:gsub("%d+", function(number)
          -- Convert the number to hexadecimal
          local handle = io.popen(string.format('printf "%%x" %s', number))
          local result = handle:read("*a")
          handle:close()
          return result:gsub("%s+$", "") -- Trim trailing spaces/newlines
        end)

        -- Replace the selected text with the processed output
        vim.api.nvim_buf_set_text(
          0, -- Current buffer
          line_start - 1, col_start - 1, -- Start position
          line_end - 1, col_end, -- End position
          vim.split(processed, "\n", { plain = true }) -- Split into lines
        )
      end

      -- Create a user command for ReplaceNumbersWithHex
      vim.api.nvim_create_user_command("ReplaceNumbersWithHex", function()
        replace_numbers_with_hex()
      end, {
        range = true, -- Allow range for manual invocation
      })

      -- Map <leader>x to call the command in visual mode
      vim.api.nvim_set_keymap(
        'v', -- Visual mode
        '<leader>x', -- Your chosen keybinding
        ":<C-u>ReplaceNumbersWithHex<CR>", -- Clear the range before invoking the command
        { noremap = true, silent = true }
      )
    end
  }
}
