-- 
--  boostrap
-- 

local function system_verbose(command)
	-- Print the command being executed
	print("Executing:", vim.inspect(command))

	-- Start the system call
	local out = vim.fn.system(command)
	local exitcode = vim.v.shell_error
	-- Log the result in the callback
	print("Command finished with exit code:", exitcode)
	print(output, "\n")
	return output
end

local function setup_lazy ()

	vim.g.mapleader = ","
	vim.g.maplocalleader = " "
	vim.loader.enable()


	require("lazy").setup({
		spec = {
			-- import lua/plugins/init.lua
			{ import = "plugins" },
		},
		change_detection = {
			notify = false,
			enable = true,
			reload = true,
		},
		-- Configure any other settings here. See the documentation for more details.
		-- colorscheme that will be used when installing plugins.
		-- install = { colorscheme = { "habamax" } },
		-- automatically check for plugin updates
		checker = { enabled = true },
	})


	require("nfnl").setup()
	require("core.init").init()
end

local lazy_path = vim.fn.stdpath("data") .. "/lazy/"
local function bootstrap(path, repo)
	local plugin_path = lazy_path .. path
	if not vim.uv.fs_stat(plugin_path) then
		print("bootstrap " .. repo .. "...")
		system_verbose({"git", "clone", "--filter=blob:none", "--single-branch", "--branch", "v11.17.1", "--depth", "1",
			"https://github.com/" .. repo .. ".git", plugin_path})
	end

	vim.opt.rtp:prepend(plugin_path)
end

bootstrap("lazy.nvim", "folke/lazy.nvim")
bootstrap("nfnl", "Olical/nfnl")

setup_lazy()

