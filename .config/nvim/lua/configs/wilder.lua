local wilder_setup, wilder = pcall(require, "wilder")
if not wilder_setup then
  return
end

wilder.setup({
  modes = { ':', '/', '?' },
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  }),  
  {
    highlighter = {
      wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
      wilder.lua_fzy_highlighter(),   -- requires fzy-lua-native vim plugin found
                                      -- at https://github.com/romgrk/fzy-lua-native
    },
    highlights = {
      accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
    },
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
  }
))