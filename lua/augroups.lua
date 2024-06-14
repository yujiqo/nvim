local create_augroups = function(definitions)
  local api = vim.api

  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup "..group_name)
    api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{"autocmd", def}, " ")
      api.nvim_command(command)
    end
    api.nvim_command("augroup END")
  end
end

create_augroups {
  terminal = {
    { "TermOpen", "*", "startinsert" },
    { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" }
  }
}
