return {
    {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
            require("dap-vscode-js").setup({
                adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
                node_path = "/usr/bin/node",
                debugger_path = os.getenv("HOME") .. "/.cache/nvim/vscode-js-debug",
            })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
    },
    {
        "nvim-telescope/telescope-dap.nvim",
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local codelldb = require("mason-registry").get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.adapters.go_remote = function(cb, config)
                cb({
                    type = "server",
                    port = config.port,
                    substitutePath = config.substitutePath,
                    executable = {
                        command = "dlv",
                        args = { "connect", "127.0.0.1:" .. config.port },
                    },
                })
            end

            dap.adapters.go_local = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "dlv",
                    args = { "dap", "-l", "127.0.0.1:${port}" },
                },
            }

            local js_based_languages = { "typescript", "javascript", "typescriptreact" }

            for _, language in ipairs(js_based_languages) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                        sourceLanguages = { language },
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                        sourceLanguages = { language },
                    },
                    {
                        type = "pwa-chrome",
                        request = "launch",
                        name = 'Start Chrome with "localhost"',
                        url = "http://localhost:3000",
                        webRoot = "${workspaceFolder}",
                        userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                        sourceLanguages = { language },
                    },
                }
            end

            dap.configurations["rust"] = {
                {
                    name = "rust-launch-debug",
                    request = "launch",
                    type = "codelldb",
                    cwd = "${workspaceFolder}",
                    cargo = {
                        args = { "build", "--all-features" },
                    },
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                    end,
                    sourceLanguages = { "rust" },
                    stopOnEntry = false,
                    environment = { "RUST_LOG=debug" },
                },
            }

            dap.configurations["c"] = {
                {
                    name = "c-launch-debug",
                    request = "launch",
                    type = "codelldb",
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations["cpp"] = {
                {
                    name = "cpp-launch-debug",
                    request = "launch",
                    type = "codelldb",
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations["go"] = {
                {
                    name = "Go local debug",
                    request = "launch",
                    type = "go_local",
                    program = "${file}",
                },
                {
                    name = "Product Definition Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src",
                        },
                    },
                    port = 4013,
                },

                {
                    name = "DocGen Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src",
                        },
                    },
                    port = 41255,
                },
                {
                    name = "Form Library Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src",
                        },
                    },
                    port = 4222,
                },
                {
                    name = "Papyrus Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src",
                        },
                        {
                            from = "${workspaceFolder}/../docmosis-ds4/client",
                            to = "/vendor/github.com/embroker/docmosis-ds4/client",
                        },
                    },
                    port = 4111,
                },
                {
                    name = "Web-gateway Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}/service",
                            to = "/tmp/gobuild/service",
                        },
                    },
                    port = 4123,
                },

                {
                    name = "Chubb BOP Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}/service",
                            to = "/tmp/gobuild",
                        },
                    },
                    port = 4003,
                },
                {
                    name = "Chubb WC Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}/service",
                            to = "/tmp/gobuild",
                        },
                    },
                    port = 4004,
                },
                {
                    name = "Cowbell Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}/service",
                            to = "/tmp/gobuild",
                        },
                    },
                    port = 4002,
                },
                {
                    name = "Excess API Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}/service",
                            to = "/tmp/gobuild/service",
                        },
                    },
                    port = 45654,
                },

                {
                    name = "Monolith Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src/server/server",
                        },
                        -- {
                        -- 	from = "${workspaceFolder}/../../docmosis-ds4",
                        -- 	to = "/go/src/server/server/vendor/github.com/embroker/docmosis-ds4",
                        -- },
                        -- {
                        -- 	from = "${workspaceFolder}/../../papyrus",
                        -- 	to = "/go/src/server/server/vendor/github.com/embroker/papyrus",
                        -- },
                    },
                    port = 45653,
                },
                {
                    name = "Rating Engine Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/go/src",
                        },
                    },
                    port = 4030,
                },
                {
                    name = "Notifications Docker Debug",
                    request = "attach",
                    type = "go_remote",
                    mode = "remote",
                    substitutePath = {
                        {
                            from = "${workspaceFolder}",
                            to = "/backend-src/notifications",
                        },
                    },
                    port = 45651,
                },
            }
        end,
    },
}
