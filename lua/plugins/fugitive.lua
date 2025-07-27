return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
		vim.keymap.set("n", "<leader>gc", ":Git commit -a<CR>")

		vim.keymap.set("n", "<leader>gp", function()
			-- current branch
			local current_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
			if current_branch == "" then
				vim.notify("No pude determinar la rama", vim.log.levels.ERROR)
				return
			end
			local default = "origin/" .. current_branch

			vim.ui.input({ prompt = "Push to remote/branch: ", default = default }, function(input)
				if not input or input == "" then
					vim.notify("Push cancelado", vim.log.levels.INFO)
					return
				end

				local remote, branch = input:match("([^/]+)/(.+)")
				if not remote or not branch then
					vim.notify("Formato invalido. Use remote/branch (e.g., origin/main)", vim.log.levels.ERROR)
					return
				end

				vim.cmd("Git push " .. remote .. " " .. branch)
			end)
		end, { desc = "Push to remote/branch (Fugitive)" })

		vim.keymap.set("n", "<leader>gf", function()
			vim.ui.input({ prompt = "Remote: " }, function(input)
				if input and input ~= "" then
					vim.cmd("Git pull " .. input)
				end
			end)
		end, { desc = "Pull Git changes (Fugitive)" })

		vim.keymap.set("n", "<leader>gb", function()
			vim.ui.input({ prompt = "Branch name: " }, function(input)
				if input and input ~= "" then
					vim.cmd("Git switch " .. input)
				end
			end)
		end, { desc = "Create Git branch (Fugitive)" })
	end,
}
