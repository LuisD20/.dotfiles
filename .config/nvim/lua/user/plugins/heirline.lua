-- import heirline safely
local heirline_setup, heirline = pcall(require, "heirline")
if not heirline_setup then
	return
end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local icons = require "user.core.icons"

local colors = {
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = "#98c379",
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("Constant").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_del = '#ec5f67',
  git_add = utils.get_highlight("diffAdded").fg,
  git_change = utils.get_highlight("diffChanged").fg,
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local ViMode = 
{
  static = {
      mode_names = { -- change the strings if you like it vvvvverbose!
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
      },
      mode_colors = {
          n = "red" ,
          i = "green",
          v = "cyan",
          V =  "cyan",
          ["\22"] =  "cyan",
          c =  "orange",
          s =  "purple",
          S =  "purple",
          ["\19"] =  "purple",
          R =  "orange",
          r =  "orange",
          ["!"] =  "red",
          t =  "red",
      }
  },
  provider = function(self)
    return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
  end,
  hl = function(self)
      local color = self:mode_color() -- here!
      return { fg = color, bold = true }
  end,
}

local FileNameBlock = 
{
  -- let's first set up some attributes needed by this component and it's children
  init = function(self)
      self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = 
{
  init = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
      return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
      return { fg = self.icon_color }
  end
}

local FileName = 
{
  provider = function(self)
      -- first, trim the pattern relative to the current directory. For other
      -- options, see :h filename-modifers
      local filename = vim.fn.fnamemodify(self.filename, ":t")
      if filename == "" then return "[No Name]" end

      return filename
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = 
{
  {
      condition = function()
          return vim.bo.modified
      end,
      provider = "[+]",
      hl = { fg = "green" },
  },
  {
      condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
      end,
      provider = "",
      hl = { fg = "orange" },
  },
}

local FileSize = 
{
  provider = function()
      -- stackoverflow, compute human readable file size
      local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
      local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
      fsize = (fsize < 0 and 0) or fsize
      if fsize < 1024 then
          return fsize..suffix[1]
      end
      local i = math.floor((math.log(fsize) / math.log(1024)))
      return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
  end
}

FileNameBlock = utils.insert(FileNameBlock,
  utils.surround({ "", "" }, "#252931", 
  { 
    FileSize,
    Space,
    FileIcon,
    FileName,
    Space,
    unpack(FileFlags),
  }),
  Align
)

local Git = 
{
  condition = conditions.is_git_repo,

  init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "black" },

  {   -- git branch name
      provider = function(self)
          return " " .. self.status_dict.head
      end,
      hl = { bold = true }
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
      condition = function(self)
          return self.has_changes
      end,
      provider = "("
  },
  {
      provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("+" .. count)
      end,
      hl = { fg = "git_add" },
  },
  {
      provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("-" .. count)
      end,
      hl = { fg = "#98c379" },
  },
  {
      provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("~" .. count)
      end,
      hl = { fg = "git_change" },
  },
  {
      condition = function(self)
          return self.has_changes
      end,
      provider = ")",
  },
}

-- We're getting minimalists here!
local Ruler = 
{
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P",
}

local Diagnostics = 
{

  condition = conditions.has_diagnostics,

  static = {
      error_icon = icons.DiagnosticError,
      warn_icon = icons.DiagnosticWarn,
      info_icon = icons.DiagnosticInfo,
      hint_icon = icons.DiagnosticHint,
  },

  init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
      provider = "![",
  },
  {
      provider = function(self)
          -- 0 is just another output, we can decide to print it or not!
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
      end,
      hl = { fg = "diag_error" },
  },
  {
      provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
      end,
      hl = { fg = "diag_warn" },
  },
  {
      provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
      end,
      hl = { fg = "diag_info" },
  },
  {
      provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
      end,
      hl = { fg = "diag_hint" },
  },
  {
      provider = "]",
  },
}

local Navic = {
    condition = require("nvim-navic").is_available,
    static = {
        -- create a type highlight map
        type_hl = {
            File = "Directory",
            Module = "@include",
            Namespace = "@namespace",
            Package = "@include",
            Class = "@structure",
            Method = "@method",
            Property = "@property",
            Field = "@field",
            Constructor = "@constructor",
            Enum = "@field",
            Interface = "@type",
            Function = "@function",
            Variable = "@variable",
            Constant = "@constant",
            String = "@string",
            Number = "@number",
            Boolean = "@boolean",
            Array = "@field",
            Object = "@type",
            Key = "@keyword",
            Null = "@comment",
            EnumMember = "@field",
            Struct = "@structure",
            Event = "@keyword",
            Operator = "@operator",
            TypeParameter = "@type",
        },
        -- bit operation dark magic, see below...
        enc = function(line, col, winnr)
            return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
        end,
        -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
        dec = function(c)
            local line = bit.rshift(c, 16)
            local col = bit.band(bit.rshift(c, 6), 1023)
            local winnr = bit.band(c,  63)
            return line, col, winnr
        end
    },
    init = function(self)
        local data = require("nvim-navic").get_data() or {}
        local children = {}
        -- create a child for each level
        for i, d in ipairs(data) do
            -- encode line and column numbers into a single integer
            local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
            local child = {
                {
                    provider = d.icon,
                    hl = self.type_hl[d.type],
                },
                {
                    -- escape `%`s (elixir) and buggy default separators
                    provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ''),
                    -- highlight icon only or location name as well
                    -- hl = self.type_hl[d.type],

                    on_click = {
                        -- pass the encoded position through minwid
                        minwid = pos,
                        callback = function(_, minwid)
                            -- decode
                            local line, col, winnr = self.dec(minwid)
                            vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), {line, col})
                        end,
                        name = "heirline_navic",
                    },
                },
            }
            -- add a separator only if needed
            if #data > 1 and i < #data then
                table.insert(child, {
                    provider = " > ",
                    hl = { fg = 'bright_fg' },
                })
            end
            table.insert(children, child)
        end
        -- instantiate the new child, overwriting the previous one
        self.child = self:new(children, 1)
    end,
    -- evaluate the children containing navic components
    provider = function(self)
        return self.child:eval()
    end,
    hl = { fg = "gray" },
    update = 'CursorMoved'
}

local status_line = 
{
  static = 
  {
    mode_colors_map = 
    {
        n = "red",
        i = "green",
        v = "cyan",
        V = "cyan",
        ["\22"] = "cyan",
        c = "orange",
        s = "purple",
        S = "purple",
        ["\19"] = "purple",
        R = "orange",
        r = "orange",
        ["!"] = "red",
        t = "green",
    },
    mode_color = function(self)
        local mode = conditions.is_active() and vim.fn.mode() or "n"
        return self.mode_colors_map[mode]
    end,
  },
  Space,
  utils.surround({ "", "" }, "#252931", { ViMode } ),
  Space, FileNameBlock, Space, Diagnostics, Align, 
  Align, Navic, Align,
  utils.surround({ "", "" }, "#61afef", { Git } ),
  Space,
  utils.surround({ "", "" }, function(self) return self:mode_color() end, {Ruler, hl = {fg = 'black'}} ),
  Space
}

heirline.load_colors(colors)
heirline.setup(status_line)