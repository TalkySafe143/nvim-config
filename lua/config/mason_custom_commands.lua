vim.api.nvim_create_user_command("CustomMasonSync", function(opts)
    local force = false
    if #opts.fargs == 1 then
        if opts.fargs[1] ~= "force" then
            vim.notify("[Custom Mason command] Unknown argument", vim.log.levels.ERROR)
            return
        end

        force = true
    end

    local mason_servers = require("config.mason_servers")

    local servers = mason_servers.read_servers(force)

    require("mason-tool-installer").setup({
        ensure_installed = servers,
        auto_update = false,
        run_on_start = false,
        debounce_hours = 5, -- at least 5 hours between attempts to install/update
    })

    require("mason-tool-installer").check_install(false)

    vim.notify("[Custom Mason command] Servers loaded", vim.log.levels.INFO)
end, { nargs = "?" })
