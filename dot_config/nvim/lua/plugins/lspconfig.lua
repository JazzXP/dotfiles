local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, res, ...)
              local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
              if string.match(file_name, "^%.env") == nil and string.match(file_name, "%.env$") == nil then
                return on_publish_diagnostics(err, res, ...)
              end
            end,
          },
        },
        yamlls = {
            format = {
              enable = true,
            },
            hover = true,
            completion = true,

            customTags = {
              "!fn",
              "!And",
              "!If",
              "!Not",
              "!Equals",
              "!Or",
              "!FindInMap sequence",
              "!Base64",
              "!Cidr",
              "!Ref",
              "!Ref Scalar",
              "!Sub",
              "!GetAtt",
              "!GetAZs",
              "!ImportValue",
              "!Select",
              "!Split",
              "!Join sequence",
            },
        },
      }
    },
  },
}
