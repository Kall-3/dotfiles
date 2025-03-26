local notify = require("notify")
notify.setup({
  stages = "fade",
  timeout = 5000,
  background_colour = "#000000",
  text_colour = "#d0d0d0",
})
vim.notify = notify
