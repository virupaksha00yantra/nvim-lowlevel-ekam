return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
-- ys<main key> iw<Motion> ""<what you need to surround with> for surround a word with ""
-- the same iw is the motion
