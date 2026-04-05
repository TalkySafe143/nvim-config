local M = {}

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end


local function read_servers(hard_refresh)
    local config_path = vim.fn.stdpath("config")
    local mason_filepath = config_path .. "/.mason_packages"
    local servers = {}

    vim.notify("[Custom Mason command] Checking for .mason_packages...", vim.log.levels.INFO)

    if file_exists(mason_filepath) == false or hard_refresh then
        vim.notify("[Custom Mason command] Executing Bash for create Mason packages", vim.log.levels.INFO)
        local bash_script = config_path .. "/export_mason_packages.sh"
        local success, _, _ = os.execute(bash_script)

        if success == false then
            vim.notify("[Custom Mason command] Bash script for Mason packages failed", vim.log.levels.ERROR)
            return servers
        end

        vim.notify("[Custom Mason command] Bash script success", vim.log.levels.INFO)
    else
        vim.notify("[Custom Mason command] .mason_packages exist!", vim.log.levels.INFO)
    end

    for line in io.lines(mason_filepath) do
        table.insert(servers, line)
    end


    return servers
end

M.read_servers = read_servers

return M
