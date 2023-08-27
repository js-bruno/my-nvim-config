
local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
    return
end

dashboard.setup {
  config = {
    center = {
      {
        icon = '',
        icon_hl = 'group',
        desc = 'description',
        desc_hl = 'group',
        key = 'shortcut key in dashboard buffer not keymap !!',
        key_hl = 'group',
        action = '',
      },
    },
    footer = {},
}}

