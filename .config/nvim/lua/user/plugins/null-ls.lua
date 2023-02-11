return {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    config = function()
      local null_ls_status_ok, null_ls = pcall(require, "null-ls")
      if not null_ls_status_ok then
        return
      end

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- https://github.com/prettier-solidity/prettier-plugin-solidity
      null_ls.setup({
          debug = false,
          sources = {
              formatting.black.with({ extra_args = { "--fast" } }),
              formatting.golines.with({
                  extra_args = { "--base-formatter", "gofumpt" },
              }),
              formatting.stylua,
              formatting.eslint_d,
              formatting.shfmt,

              diagnostics.flake8,
              diagnostics.golangci_lint,
              diagnostics.eslint_d,
              diagnostics.shellcheck,
          },
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                  end,
              })
            end
          end,
      })
    end,
}
