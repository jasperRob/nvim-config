local dap = require 'dap'
local dapui = require 'dapui'

require('mason-nvim-dap').setup {
  automatic_installation = true,
  handlers = {},
  ensure_installed = { 'delve', 'debugpy' },
}

dapui.setup {
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
}

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

require('dap-go').setup {
  delve = { detached = vim.fn.has 'win32' == 0 },
}

require('dap-python').setup(vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python')

dap.adapters.python = {
  type = 'server',
  host = '127.0.0.1',
  port = 9292,
}

dap.configurations.python = dap.configurations.python or {}
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'attach',
  name = 'Attach to vscode_tests',
  connect = { host = '127.0.0.1', port = 9292 },
  pathMappings = {
    { localRoot = vim.fn.getcwd() .. '/kogan3', remoteRoot = '.' },
  },
})
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'attach',
  name = 'Attach to Django (vscode)',
  connect = { host = '127.0.0.1', port = 9292 },
  pathMappings = {
    { localRoot = vim.fn.getcwd() .. '/kogan3', remoteRoot = vim.fn.getcwd() .. '/kogan3' },
  },
})

vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>dO', function() dap.step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>ds', function() dapui.toggle() end, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<leader>dt', function() dap.terminate() end, { desc = 'Debug: Terminate session' })
