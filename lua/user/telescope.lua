require('telescope').setup{
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
			on_complete = {
				function()
					vim.cmd("stopinsert")
				end
			},
        },
  },
}
