local mason_lsp = require("mason-lspconfig")
local mason = require("mason")
local lspconfig = require("lspconfig")
local coq = require("coq")
local on_attach = function(client, bufnr)
  local keymap = vim.keymap
  local buf = vim.lsp.buf
  local diagnostic = vim.diagnostic
  local opt = { buffer = bufnr, noremap = true }
  keymap.set("n", "K", buf.hover, opt)
  keymap.set("n", "gf", buf.format, opt)
  keymap.set("n", "gd", buf.definition, opt)
  keymap.set("n", "gD", buf.declaration, opt)
  keymap.set("n", "gi", buf.implementation, opt)
  keymap.set("n", "gt", buf.type_definition, opt)
  keymap.set("n", "gn", buf.rename, opt)
  keymap.set("n", "ga", buf.code_action, opt)
  keymap.set("n", "ge", diagnostic.open_float, opt)
  keymap.set("n", "g]", diagnostic.goto_next, opt)
  keymap.set("n", "g[", diagnostic.goto_prev, opt)
  keymap.set("n", "gr", buf.references, opt)
end

mason_lsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = coq.lsp_ensure_capabilities(),
      on_attach = on_attach,
      settings = server_name == "lua_ls" and {
        Lua = {
          diagnostics = { globals = { "vim" } }
        }
      } or nil,
    }
  end
}


mason.setup {}
