return {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
        -- Ensure C/C++ debugger is installed
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "codelldb" })
            end
        end,
    },
    keys = {
        {
            "<S-b>",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
        },
        {
            "<S-i>",
            function()
                require("dap").step_into()
            end,
            desc = "Step into",
        },
        {
            "<S-o>",
            function()
                require("dap").step_out()
            end,
            desc = "Step out",
        },
        {
            "<S-c>",
            function()
                require("dap").step_over()
            end,
            desc = "Step over",
        },
        {
            "<S-r>",
            function()
                require("dap").continue()
            end,
            desc = "Continue",
        },
    },
    opts = function()
        local dap = require("dap")
        if not dap.adapters["codelldb"] then
            require("dap").adapters["codelldb"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = {
                        "--port",
                        "${port}",
                    },
                },
            }
        end
        for _, lang in ipairs({ "c", "cpp" }) do
            dap.configurations[lang] = {
                {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch file",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "codelldb",
                    request = "attach",
                    name = "Attach to process",
                    pid = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end
    end,
}
