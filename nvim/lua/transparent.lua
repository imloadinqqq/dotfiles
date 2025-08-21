local function set_transparency()
  local groups = { "Normal", "NormalNC", "VertSplit", "StatusLine", "LineNr", "NonText" }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

set_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparency,
})

