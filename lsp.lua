

local lsp = require('lspconfig')
local util = lsp.util
local saga = require('lspsaga')





local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg='#8ec07c' guifg='#282828'
      hi LspReferenceText cterm=bold ctermbg=red guibg='#8ec07c'  guifg='#282828'
      hi LspReferenceWrite cterm=bold ctermbg=red guibg='#8ec07c' guifg='#282828'
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end


lsp.rust_analyzer.setup { on_attach = on_attach }
lsp.jsonls.setup { on_attach = on_attach }
lsp.vimls.setup { on_attach = on_attach }
lsp.tsserver.setup { on_attach = on_attach }
lsp.bashls.setup { on_attach = on_attach }
lsp.html.setup { on_attach = on_attach }

lsp.denols.setup {
  root_dir = lsp.util.root_pattern(".git");
  on_attach = on_attach
}


lsp.hls.setup {
  on_attach = on_attach,
  settings = {
    languageServerHaskell = {
      formattingProvider = "stylish-haskell"
    }
  }
}


require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
  };
}

--vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler
--vim.lsp.handlers['textDocument/references'] = require('lsputil.locations').references_handler
--vim.lsp.handlers['textDocument/definition'] = require('lsputil.locations').definition_handler
--vim.lsp.handlers['textDocument/declaration'] = require('lsputil.locations').declaration_handler
--vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
--vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
--vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
--vim.lsp.handlers['workspace/symbol'] = require('lsputil.symbols').workspace_handler


saga.init_lsp_saga {
  border_style = 1,
  code_action_keys = { quit = '<esc>', exec = '<CR>' },
  rename_action_keys = { quit = '<esc>', exec = '<CR>' },
  finder_action_keys = { 
    quit = '<esc>', 
    open = '<CR>',
    vsplit = 'v',
    split = 'b',
    scroll_up = '<C-u>',
    scroll_down = '<C-d>'
  },
}
