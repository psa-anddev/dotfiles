local M = {}

function M.setup()
    local keybindings = require('which-key')
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()
    keybindings.register({
        d = {
            name = "debug",
            t = {
                name = "toggle",
                b = { function() dap.toggle_breakpoint() end, "breakpoint" },
                u = { function() dapui.toggle() end, "ui" }
            },
            c = { function() dap.continue() end, "continue" },
            s = {
                name = "step",
                l = { function() dap.step_into() end, "into" },
                j = { function() dap.step_over() end, "over" },
                h = { function() dap.step_out() end, "out" }
            },
            j = { function() dap.down() end, "down-stack" },
            k = { function() dap.up() end, "up-stack" },
            K = { function() require('dap.ui.widgets').hover() end, "hover-value" }
        }
    }, { prefix = "<leader>" })
end

return M
