
local ensure_packer = function()
  local fn = vim.fn
  local inspath = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(inspath)) > 0 then
    fn.system({'git', 'clone', "--depth", "1", "https://github.com/wbthomason/packer.nvim", inspath})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local bootstrap = ensure_packer()

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use { "ms-jpq/coq_nvim", branch = "coq"}
  use { "ms-jpq/coq.artifacts", branch = "artifacts"}
  use { "ms-jpq/chadtree", branch = "chad" }
  use "WhoIsSethDaniel/lualine-lsp-progress.nvim"
  use "nvim-lualine/lualine.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use "folke/tokyonight.nvim"
  use "marko-cerovac/material.nvim"
  use "akinsho/toggleterm.nvim"
  use "kdheepak/tabline.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "andweeb/presence.nvim"

  if bootstrap then
    require("packer").sync()
  end
end)

