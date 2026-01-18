return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://docs.astral.sh/ty/reference/editor-settings
        ty = {
          settings = {
            ty = {
              -- Scope of diagnostics
              diagnosticMode = "workspace", -- "off" | "openFilesOnly" | "workspace"

              -- Configure rules for strictness
              configuration = {
                rules = {
                  ["unresolved-reference"] = "error",
                  ["invalid-assignment"] = "error",
                  ["invalid-argument-type"] = "error",
                  ["invalid-return-type"] = "error",
                  ["call-non-callable"] = "error",
                  ["missing-argument"] = "error",
                  ["unknown-argument"] = "error",
                },
              },

              -- Optional: disable language features if you only want type checking
              -- disableLanguageServices = false,

              -- Optional: show/hide syntax errors
              -- showSyntaxErrors = true,
            },
          },
        },
      },
    },
  },
}
