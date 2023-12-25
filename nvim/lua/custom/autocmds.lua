-- replace string from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window onl
local function liveReload_xresources()
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufEnter", "InsertLeave", "FocusGained"},
  { pattern = "*",
    --command = "set relativenumber",  -- if callback, vim.api.nvim_buf_set_option(0,relativenumber,true) ?
    callback = function()
      vim.api.nvim_buf_set_option(0, 'relativenumber', true)
    end,
    group = numtogGrp,
    desc = "Turn on relative line numbering when the buffer is entered.",
  }
)
vim.api.nvim_create_autocmd(
  { "BufLeave", "InsertEnter", "FocusLost"},
  { pattern = "*",
    --command = "set norelativenumber",
    callback = function()
      vim.api.nvim_buf_set_option(0, 'relativenumber', false)
    end,
    group = numtogGrp,
    desc = "Turn off relative line numbering when the buffer is exited.",
  }
)
