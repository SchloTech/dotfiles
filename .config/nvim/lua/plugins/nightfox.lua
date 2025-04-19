return {
    "EdenEast/nightfox.nvim",
    priority = 1000,  -- ensure it loads before other plugins
    config = function()
        require("nightfox").setup({
            options = {
                transparent = true,    -- Enable transparency
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                }
            },
            groups = {
                all = {
                    -- Make specific Avante elements transparent
                    AvanteNormal = { bg = "NONE" },
                    AvanteFloat = { bg = "NONE" },
                    AvanteFloatNormal = { bg = "NONE" },
                    AvanteFloatBorder = { bg = "NONE" },
                    AvanteBackground = { bg = "NONE" },
                    -- Make sure these base groups are also transparent
                    Normal = { bg = "NONE" },
                    NormalFloat = { bg = "NONE" },
                    FloatBorder = { bg = "NONE" },
                    SignColumn = { bg = "NONE" },
                    NormalNC = { bg = "NONE" },
                }
            }
        })
    end
}
