vim.g.NERDTreeWinSize=45

function Toggle_NERDTree()
	vim.cmd([[
		if ( exists("g:NERDTree") && g:NERDTree.IsOpen() ) || ( @% == "" )
			NERDTreeToggle
		else
			NERDTreeFind
		endif
	]])
end
