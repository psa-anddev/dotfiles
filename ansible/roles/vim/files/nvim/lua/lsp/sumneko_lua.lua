local M = {}
local root_path = os.getenv('HOME') .. '/repos/lsp/lua/lua-language-server'

function M.setup(on_attach)
    local runtime_path = M.add_lua_files_to_runtime_path()
    require'lspconfig'.sumneko_lua.setup {
        cmd = {M.get_sumneko_bin_path(), "-E", root_path .. '/main.lua'};
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

function M.add_lua_files_to_runtime_path()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    return runtime_path
end

function M.get_sumneko_bin_path()
    return root_path .. '/bin/' .. M.get_system_name() .. '/lua-language-server'
end

function M.get_system_name()
    if vim.fn.has("mac") == 1 then
        return "macOS"
    elseif vim.fn.has("unix") == 1 then
        return "Linux"
    elseif vim.fn.has('win32') == 1 then
        return "Windows"
    else
        print("Unsupported system for sumneko")
    end
end

return M
