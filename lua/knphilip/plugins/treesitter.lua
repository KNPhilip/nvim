return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
      ensure_installed = { 
	'vim', 'markdown', 'markdown_inline', 'dockerfile', 'sql',
        'c', 'cpp', 'zig', 'rust', 'python', 'odin', 'php', 'ruby', 'bash',
	'lua', 'groovy', 'java', 'clojure', 'c_sharp', 'fsharp', 'powershell',
	'haskell', 'scala', 'commonlisp', 'elixir', 'elm', 'erlang', 'perl',
	'html', 'css', 'javascript', 'typescript', 'dart', 'swift', 'kotlin',
	'csv', 'json', 'yaml', 'xml'
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          additional_vim_regex_highlighting = false,
        },
      }      
    end
  }
}

