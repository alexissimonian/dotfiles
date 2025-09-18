return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fF', function()
			builtin.find_files({ hidden = true })
		end, {})
		vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fw', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>fW', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>fs', function()
			builtin.live_grep()
		end)
	end
}
