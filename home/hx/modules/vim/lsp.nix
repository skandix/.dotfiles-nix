{ pkgs, unstable, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      blink-cmp
    ];

    extraPackages = with pkgs; [
      unstable.gopls
      rust-analyzer
      basedpyright
      unstable.ruff
      yaml-language-server
      helm-ls
      nil
      nixfmt
      bash-language-server
      shellcheck
    ];
    initLua = /* vim */ ''
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      require("blink.cmp").setup({
        keymap = { preset = "enter" },
        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            staticcheck = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "standard" },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            validate = true,
            completion = true,
            hover = true,
            schemaStore = { enable = true },
            schemas = {
              kubernetes = {
                "k8s/**/*.yaml",
                "manifests/**/*.yaml",
                "*.k8s.yaml",
              },
            },
          },
        },
      })

      vim.lsp.config("nil_ls", {
        settings = {
          ["nil"] = {
            formatting = { command = { "nixfmt" } },
          },
        },
      })

      -- ENABLE LSP
      vim.lsp.enable({
        "gopls",
        "rust_analyzer",
        "basedpyright",
        "ruff",
        "yamlls",
        "helm_ls",
        "nil_ls",
        "bashls",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end

          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("<leader>e", vim.diagnostic.open_float, "Show error under cursor")
          map("<leader>F", function() vim.lsp.buf.format({ async = true }) end, "Format file")
        end,
      })

      -- ONS AVE FORMAT !
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.go", "*.rs", "*.py", "*.nix" },
        callback = function()
          vim.lsp.buf.format({ timeout_ms = 2000 })
        end,
      })
    '';
  };
}
