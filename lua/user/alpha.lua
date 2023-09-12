local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end


local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[  ______    __                   ___                                    __      _            __ ]],
[[ /_  __/   / /_   ___           /   |   ____   ____ _   _____  _____   / /_    (_)   _____  / /_]],
[[  / /     / __ \ / _ \         / /| |  / __ \ / __ `/  / ___/ / ___/  / __ \  / /   / ___/ / __/ ]],
[[ / /     / / / //  __/        / ___ | / / / // /_/ /  / /    / /__   / / / / / /   (__  ) / /_  ]],
[[/_/     /_/ /_/ \___/        /_/  |_|/_/ /_/ \__,_/  /_/     \___/  /_/ /_/ /_/   /____/  \__/  ]],
}

 dashboard.section.buttons.val = {
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}


-- local footer =  "Don't Stop Until You are Proud..."
--
-- dashboard.section.footer.val = footer

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
