local plugins = {
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = 'mfusseneger/nvim-dap',
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      handles = {},
    },
  },
  {
    'mfussenegger/nvim-dap',
    config = function(_, _)
      require('core.utils').load_mappings('dap')

      local dap = require('dap')

      -- codelldb
      dap.adapters.codelldb = {
          type = "server",
          port = "${port}",
          executable = {
              command = "/usr/bin/codelldb",
              args = { "--port", "${port}" },
          },
      }

      dap.configurations.cpp = {
        {
          -- Change it to "cppdbg" if you have vscode-cpptools
          type = "codelldb",
          request = "launch",
          program = function()
            -- Compile and return exec name
            local filetype = vim.bo.filetype
            local filename = vim.fn.expand("%")
            local basename = vim.fn.expand('%:t:r')
            local makefile = os.execute("(ls | grep -i makefile)")
            if makefile == "makefile" or makefile == "Makefile" then
              os.execute("make debug")
            else
              if filetype == "c" then
                os.execute(string.format("gcc -g -o %s %s", basename, filename))
              else
                os.execute(string.format("g++ -g -o %s %s", basename, filename))
              end
            end
            return basename
          end,
          args = function ()
            local argv = {}
            arg = vim.fn.input(string.format("argv: "))
            for a in string.gmatch(arg, "%S+") do
              table.insert(argv, a)
            end
            vim.cmd('echo ""')
            return argv
          end,
          cwd = "${workspaceFolder}",
          -- Uncomment if you want to stop at main
          -- stopAtEntry = true,
          MIMode = "gdb",
          miDebuggerPath = "/usr/bin/gdb",
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing",
              ignoreFailures = false,
            },
          },
        },
      }

      -- You can even copy configurations
      dap.configurations.c = dap.configurations.cpp

      dap.configurations.rust = {
        {
          type = "codelldb",
          request = "launch",
          -- This is where cargo outputs the executable
          program = function ()
            os.execute("cargo build &> /dev/null")
            return "target/debug/${workspaceFolderBasename}"
          end,
          args = function ()
            local argv = {}
            arg = vim.fn.input(string.format("argv: "))
            for a in string.gmatch(arg, "%S+") do
              table.insert(argv, a)
            end
            return argv
          end,
          cwd = "${workspaceFolder}",
          -- Uncomment if you want to stop at main
          -- stopOnEntry = true,
          MIMode = "gdb",
          miDebuggerPath = "/usr/bin/gdb",
          setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
    }

    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    opts = function ()
      return require 'custom.configs.null-ls'
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function ()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'clangd',
        'clang-format',
        'codelldb',
        'rust-analyzer',
        'pyright',
        'mypy',
        'ruff',
        'black',
      }
    }
  }
}

return plugins
