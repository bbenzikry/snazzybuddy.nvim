-- Name:         Snazzybuddy
-- Description:  Light and dark theme inspired by hyper-snazzy
-- Author:       bbenzikry
-- Maintainer:   bbenzikry
-- Website:      https://github.com/bbenzikry/snazzybuddy.nvim
-- License:      MIT
local Color, colors, Group, groups, styles = require('colorbuddy').setup()
local g = require('colorbuddy.group').groups
local c = require('colorbuddy.color').colors
local s = require('colorbuddy.style').styles
local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE
-- local o = vim.o
-- local v = vim.g

local COLORS = {
    dark = {
        bg = '#282a36',
        fg = '#eff0eb',
        red = '#ff5c57',
        yellow = '#f3f99d',
        green = '#5af78e',
        blue = '#57c7ff',
        cyan = '#9aedfe',
        purple = '#ff6ac1',
        orange = '#ff9f43',
        brown = '#b2643c',
        pink = '#FF5370'
    },
    light = {
        bg = '#eff0eb',
        fg = '#282a36',
        red = '#ff5c57',
        yellow = '#CF9C00',
        green = '#2DAE58',
        blue = '#09A1ED',
        cyan = '#13BBB7',
        purple = '#F767BB',
        orange = '#F76D47',
        brown = '#C17E70',
        pink = '#FF5370'
    }
}

local get_current_mode = function()
    if vim.g.background == 'dark' or vim.g.background == 'light' then
        return vim.g.background
    else
        return 'dark'
    end
end

local get_color = function(color_name, mode)
    local default_mode = get_current_mode()
    local selected_mode = mode or default_mode
    if not mode then
        if default_mode == 'light' or default_mode == 'dark' then
            selected_mode = default_mode
        else
            default_mode = 'dark'
        end
    end
    return COLORS[selected_mode][color_name]
end

-- Unused colors
-- Color.new('paleblue', '#8796B0')

local M = {}
function M.load()
    vim.g.colors_name = 'snazzybuddy'
    local current_mode = get_current_mode()
    -- Universal colors
    Color.new('fg1', get_color('fg'))
    Color.new('fg2', get_color('fg'))
    Color.new('fg3', '#e2e4e5')
    Color.new('disabled', '#464B5D')
    Color.new('line_numbers', '#525975')
    Color.new('selection', '#464B5D')

    Color.new('white', '#eff0eb')
    Color.new('gray', '#5e6c70')
    Color.new('black', '#000000')
    Color.new('red', get_color('red'))
    Color.new('green', get_color('green'))
    Color.new('yellow', get_color('yellow'))
    Color.new('yellowfaded', '#ebcb8b')
    Color.new('blue', get_color('blue'))
    Color.new('cyan', get_color('cyan'))
    Color.new('purple', get_color('purple'))
    Color.new('orange', get_color('orange'))
    Color.new('brown', get_color('brown'))
    Color.new('comments', '#78787e')
    Color.new('error', get_color('red'))
    Color.new('pink', get_color('pink'))
    Color.new('incsearch', get_color('yellow'))
    Color.new('search', get_color('yellow'))
    Color.new('Constant', get_color('orange'))
    Color.new('String', get_color('green'))
    Color.new('Character', get_color('red'))
    Color.new('Boolean', get_color('orange'))
    Color.new('Float', get_color('orange'))
    Color.new('Identifier', get_color('red'))
    Color.new('Function', get_color('blue'))
    Color.new('Statement', get_color('red'))
    Color.new('Conditional', get_color('purple'))
    Color.new('Repeat', get_color('yellow'))
    Color.new('Label', get_color('yellow'))
    Color.new('Operator', get_color('yellow'))
    Color.new('Number', get_color('green'))
    Color.new('Keyword', get_color('purple'))
    Color.new('Exception', get_color('red'))
    Color.new('PreProc', get_color('yellow'))
    Color.new('Include', get_color('blue'))
    Color.new('Define', get_color('purple'))
    Color.new('Macro', get_color('red'))
    Color.new('PreCondit', get_color('purple'))
    Color.new('Type', get_color('yellow'))
    Color.new('StorageClass', get_color('yellow'))
    Color.new('Structure', get_color('purple'))
    Color.new('Typedef', get_color('yellow'))
    Color.new('Special', get_color('blue'))
    Color.new('SpecialChar', get_color('yellow'))
    Color.new('Tag', get_color('orange'))
    Color.new('Delimiter', get_color('brown'))
    Color.new('SpecialComment', get_color('yellow'))
    Color.new('Debug', get_color('red'))
    Color.new('Underlined', get_color('blue'))
    Color.new('Todo', get_color('yellow'))
    -- Color.new('TSProperty', get_color('fg'))
    -- Style specific colors
    if current_mode == 'dark' then
        -- Dark theme specific styling
        Color.new('bg', get_color('bg'))
        Color.new('fg1', get_color('fg'))
        Color.new('invisibles', '#65737E')
        Color.new('comments', '#78787e')
        Color.new('guides', '#424242')
        Color.new('line_numbers', '#606580')
        -- Color.new('lsp_background', '#606580')
        Color.new('lsp_background', '#54555e')
        Color.new('line_highlight', '#171717')
        Color.new('accent', get_color('yellow'))
        Color.new('htmlBold', get_color('yellow'))
        Color.new('url', get_color('red'))
        Color.new('link', get_color('green'))
        Color.new('heading', get_color('blue'))
        Color.new('codeDelimiter', get_color('purple'))
        Color.new('TSVariable', get_color('fg'))
        Color.new('TSField', get_color('fg'))
        Color.new('TSProperty', get_color('blue'))
        Color.new('Boolean', get_color('purple'))
        Color.new('TSParameter', get_color('fg'))
        Color.new('TSKeywordOperator', get_color('yellow'))

        -- Group.new('Ignore', c.disabled, c.none, no) -- left blank, hidden

        -- Color.new('Repeat')
    elseif current_mode == 'light' then
        -- Light theme specific styling
        Color.new('bg', get_color('bg', 'light'))
        Color.new('fg1', get_color('fg', 'light'))
        Color.new('invisibles', '#E7EAEC')
        Color.new('comments', '#90A4AE')
        Color.new('caret', '#272727')
        Color.new('selection', '#c2efd1')
        Color.new('guides', '#B0BEC5')
        Color.new('line_numbers', '#686968')
        -- Color.new('lsp_background', '#b5e5fc')
        Color.new('lsp_background', '#e2e3e9')
        Color.new('line_highlight', '#ECF0F1')
        Color.new('accent', get_color('cyan'))
        Color.new('incsearch', get_color('purple'))
        Color.new('search', get_color('purple'))
        Color.new('htmlBold', get_color('cyan'))
        Color.new('url', get_color('yellow'))
        Color.new('link', get_color('blue'))
        Color.new('heading', get_color('green'))
        Color.new('codeDelimiter', '#78787e')
        Color.new('Function', get_color('blue'))
        -- Color.new('Type', get_color('yellow', 'light'))

        -- Color.new('Statement', get_color('red', 'light'))
        Color.new('Operator', get_color('fg'))
        Color.new('Number', get_color('green'))
        Color.new('Conditional', get_color('purple'))
        Color.new('String', get_color('yellow'))
        Color.new('TSVariable', get_color('fg'))
        Color.new('TSField', get_color('fg'))
        Color.new('TSProperty', get_color('fg'))
        Color.new('TSParameter', get_color('fg'))
        Color.new('TSKeywordOperator', get_color('purple'))

    end
    -- Choose italic comments
    if vim.g.snazzybuddy_italics == 1 then
        Group.new('Comment', c.comments, c.none, i) -- italic comments
    else
        Group.new('Comment', c.comments, c.none, no) -- normal comments
    end

    Group.new('Constant', c.Constant, c.none, no) -- any constant
    Group.new('String', c.String, c.none, i) -- this is a string
    Group.new('Character', c.Character, c.none, no) -- a character constant: 'c', '\n'
    Group.new('Boolean', c.Boolean, c.none, no) -- a boolean constant: TRUE, false
    Group.new('Number', c.Number, c.none, no) -- a boolean constant: TRUE, false
    Group.new('Float', c.Float, c.none, no) -- a floating point constant: 2.3e10
    Group.new('Identifier', c.Identifier, c.none, no) -- any variable name
    Group.new('Function', c.Function, c.none, no) -- function name (also: methods for classes)
    Group.new('Statement', c.Statement, c.none, no) -- any statement
    Group.new('Conditional', c.Conditional, c.none, no) -- if, then, else, endif, switch, etc.
    Group.new('Repeat', c.Repeat, c.none, no) -- for, do, while, etc.
    Group.new('Label', c.Label, c.none, no) -- case, default, etc.
    Group.new('Operator', c.Operator, c.none, no) -- sizeof', '+', '*', etc.
    Group.new('Keyword', c.Keyword, c.none, no) -- any other keyword
    Group.new('Exception', c.Exception, c.none, no) -- try, catch, throw
    Group.new('PreProc', c.PreProc, c.none, no) -- generic Preprocessor
    Group.new('Include', c.Include, c.none, no) -- preprocessor #include
    Group.new('Define', c.Define, c.none, no) -- preprocessor #define
    Group.new('Macro', c.Macro, c.none, no) -- same as Define
    Group.new('PreCondit', c.PreCondit, c.none, no) -- preprocessor #if, #else, #endif, etc.
    Group.new('Type', c.Type, c.none, no) -- int, long, char, etc.
    Group.new('StorageClass', c.StorageClass, c.none, no) -- static, register, volatile, etc.
    Group.new('Structure', c.Structure, c.none, no) -- struct, union, enum, etc.
    Group.new('Typedef', c.Typedef, c.none, no) -- A typedef
    Group.new('Special', c.Special, c.none, i) -- any special symbol
    Group.new('SpecialChar', c.SpecialChar, c.none, no) -- special character in a constant
    Group.new('Tag', c.Tag, c.none, no) -- you can use CTRL-] on this
    Group.new('Delimiter', c.Delimiter, c.none, no) -- character that needs attention
    Group.new('SpecialComment', c.SpecialComment, c.none, no) -- special things inside a comment
    Group.new('Debug', c.Debug, c.none, no) -- debugging statements
    Group.new('Underlined', c.Underlined, c.none, ul) -- text that stands out, HTML links
    Group.new('Ignore', c.disabled, c.none, no) -- left blank, hidden
    Group.new('Error', c.error, c.none) -- any erroneous construct, also -- see: https://github.com/neovim/neovim/issues/13746
    Group.new('Todo', c.Todo, c.none, b + i) -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Highlight groups

    Group.new('ColorColumn', c.fg3, c.bg, no) --  used for the columns set with 'colorcolumn'
    Group.new('Conceal', c.blue, c.bg, no) -- placeholder characters substituted for concealed text (see 'conceallevel')
    Group.new('Cursor', c.bg, c.fg1, b + r) -- the character under the cursor
    Group.new('CursorIM', c.fg1, c.none, r) -- like Cursor, but used when in IME mode
    -- Group.new('InvisibleCursor', c.red, c.red, b) -- like Cursor, but used when in IME mode
    Group.new('Directory', c.blue, c.none, b) -- directory names (and other special names in listings)
    Group.new('DiffAdd', c.green, c.none, no) -- diff mode: Added line
    Group.new('DiffChange', c.orange, c.none, no) --  diff mode: Changed line
    Group.new('DiffDelete', c.red, c.none, no) -- diff mode: Deleted line
    Group.new('DiffText', c.blue, c.none, no) -- diff mode: Changed text within a changed line
    Group.new('EndOfBuffer', c.invisibles, c.none, no) -- filler lines (~) after the last line in the buffer
    Group.new('ErrorMsg', c.fg1, c.bg, no) -- error messages on the command line
    Group.new('VertSplit', c.selection, c.none, no) -- the column separating verti-- cally split windows
    Group.new('Folded', c.purple, c.bg, i) -- line used for closed folds
    Group.new('FoldColumn', c.blue, c.none, no) -- 'foldcolumn'
    Group.new('SignColumn', c.fg1, c.none, no) -- column where signs are displayed
    Group.new('IncSearch', c.selection, c.incsearch, r + b) -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
    Group.new('LineNr', c.line_numbers, c.none, no) -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    Group.new('CursorLineNr', c.accent, c.none, no) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Group.new('MatchParen', c.cyan, c.none, b) -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    Group.new('ModeMsg', c.green, c.none, no) -- 'showmode' message (e.g., '-- INSERT --')
    Group.new('MoreMsg', g.ModeMsg, g.ModeMsg, g.ModeMsg) -- more-prompt
    Group.new('NonText', c.fg1, c.none, no) -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line).
    Group.new('Normal', c.fg1, c.bg, no) -- normal text
    Group.new('Pmenu', c.fg1, c.selection, no) -- Popup menu: normal item.
    Group.new('PmenuSel', c.accent, c.disabled, no) -- Popup menu: selected item.
    Group.new('PmenuSbar', c.fg1, c.bg, no) -- Popup menu: scrollbar.
    Group.new('PmenuThumb', c.fg1, c.accent, no) -- Popup menu: Thumb of the scrollbar.
    Group.new('Question', c.blue, c.none, b) -- hit-enter prompt and yes/no questions
    Group.new('QuickFixLine', g.Search, g.Search, g.Search) -- Current quickfix item in the quickfix window.
    Group.new('qfLineNr', g.Type, g.Type, g.Type)
    Group.new('Search', c.selection, c.search, r + b) -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Group.new('SpecialKey', c.purple, c.none, no) -- Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    Group.new('SpellBad', c.red, c.none, i + uc) -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    Group.new('SpellCap', c.blue, c.none, i + uc) -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    Group.new('SpellLocal', c.cyan, c.none, i + uc) -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    Group.new('SpellRare', c.purple, c.none, i + uc) -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
    Group.new('StatusLine', c.fg1, c.bg, no) -- status line of current window
    Group.new('StatusLineNC', c.comments, c.selection, no) -- status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
    -- Group.new('StatusLineTerm', g.StatusLine, g.StatusLine, g.StatusLine) -- status line of current :terminal window
    Group.new('StatusLineTerm', c.bg, c.green, g.StatusLine) -- status line of current :terminal window
    Group.new('StatusLineTermNC', g.StatusLineNC, g.StatusLineNC, g.StatusLineNC) -- status line of non-current :terminal window
    Group.new('TabLineFill', c.fg1, c.bg, no)
    Group.new('TabLineSel', c.green, c.accent, no)
    Group.new('TabLine', g.TabLineFill, g.TabLineFill, g.TabLineFill)
    Group.new('Title', c.blue, c.none, b) -- titles for output from ':set all', ':autocmd' etc.
    Group.new('Visual', c.none, c.selection, no) -- Visual mode selection
    Group.new('VisualNOS', g.Visual, g.Visual, g.Visual) -- Visual mode selection when vim is 'Not Owning the Selection'. Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    Group.new('WarningMsg', c.red, c.none, no) --  warning messages
    Group.new('WildMenu', c.red, c.selection, b) --  current match in 'wildmenu' completion
    Group.new('CursorColumn', c.none, c.selection, no) -- Current cursor column highlight
    Group.new('CursorLine', c.none, c.selection, no) -- Current cursor line highlight
    Group.new('ToolbarLine', c.fg1, c.disabled, no)
    Group.new('ToolbarButton', c.fg1, c.bg, b)
    Group.new('NormalMode', c.accent, c.none, r)
    Group.new('InsertMode', c.green, c.none, r)
    Group.new('ReplaceMode', c.red, c.none, r)
    Group.new('VisualMode', c.purple, c.none, r)
    Group.new('CommandMode', c.gray, c.none, r)
    Group.new('Warnings', c.orange, c.none, r)

    -- Language-specific highlighting

    -- C
    Group.new('cOperator', c.cyan, c.none, no)
    Group.new('cStructure', c.yellow, c.none, no)
    -- CoffeeScript
    Group.new('coffeeExtendedOp', c.fg1, c.none, no)
    Group.new('coffeeSpecialOp', c.fg2, c.none, no)
    Group.new('coffeeCurly', c.orange, c.none, no)
    Group.new('coffeeParen', c.fg3, c.none, no)
    Group.new('coffeeBracket', c.orange, c.none, no)
    -- Clojure
    -- Note that these won't have an effect if using treesitter
    Group.new('clojureKeyword', c.blue, c.none, no)
    Group.new('clojureCond', c.orange, c.none, no)
    Group.new('clojureSpecial', c.orange, c.none, no)
    Group.new('clojureDefine', c.orange, c.none, no)
    Group.new('clojureFunc', c.purple, c.none, no)
    Group.new('clojureSymbol', c.purple, c.none, no)
    Group.new('clojureRepeat', c.yellow, c.none, no)
    Group.new('clojureCharacter', c.cyan, c.none, no)
    Group.new('clojureStringEscape', c.cyan, c.none, no)
    Group.new('clojureException', c.red, c.none, no)
    Group.new('clojureRegexp', c.cyan, c.none, no)
    Group.new('clojureRegexpEscape', c.cyan, c.none, no)
    Group.new('clojureRegexpCharClass', c.fg3, c.none, b)
    Group.new('clojureRegexpMod', g.clojureRegexpCharClass, g.clojureRegexpCharClass, g.clojureRegexpCharClass)
    Group.new('clojureRegexpQuantifier', g.clojureRegexpCharClass, g.clojureRegexpCharClass, g.clojureRegexpCharClass)
    Group.new('clojureParen', c.fg3, c.none, no)
    Group.new('clojureAnonArg', c.yellow, c.none, no)
    Group.new('clojureVariable', c.blue, c.none, no)
    Group.new('clojureMacro', c.orange, c.none, no)
    Group.new('clojureMeta', c.yellow, c.none, no)
    Group.new('clojureDeref', c.yellow, c.none, no)
    Group.new('clojureQuote', c.yellow, c.none, no)
    Group.new('clojureUnquote', c.yellow, c.none, no)
    -- CSS
    Group.new('cssBraces', c.blue, c.none, no)
    Group.new('cssFunctionName', c.yellow, c.none, no)
    Group.new('cssIdentifier', c.orange, c.none, no)
    Group.new('cssClassName', c.purple, c.none, no)
    Group.new('cssColor', c.blue, c.none, no)
    Group.new('cssSelectorOp', c.blue, c.none, no)
    Group.new('cssSelectorOp2', c.blue, c.none, no)
    Group.new('cssImportant', c.green, c.none, no)
    Group.new('cssVendor', c.fg1, c.none, no)
    Group.new('cssTextProp', c.cyan, c.none, no)
    Group.new('cssAnimationProp', c.cyan, c.none, no)
    Group.new('cssUIProp', c.yellow, c.none, no)
    Group.new('cssTransformProp', c.cyan, c.none, no)
    Group.new('cssTransitionProp', c.cyan, c.none, no)
    Group.new('cssPrintProp', c.cyan, c.none, no)
    Group.new('cssPositioningProp', c.yellow, c.none, no)
    Group.new('cssBoxProp', c.cyan, c.none, no)
    Group.new('cssFontDescriptorProp', c.cyan, c.none, no)
    Group.new('cssFlexibleBoxProp', c.cyan, c.none, no)
    Group.new('cssBorderOutlineProp', c.cyan, c.none, no)
    Group.new('cssBackgroundProp', c.cyan, c.none, no)
    Group.new('cssMarginProp', c.cyan, c.none, no)
    Group.new('cssListProp', c.cyan, c.none, no)
    Group.new('cssTableProp', c.cyan, c.none, no)
    Group.new('cssFontProp', c.cyan, c.none, no)
    Group.new('cssPaddingProp', c.cyan, c.none, no)
    Group.new('cssDimensionProp', c.cyan, c.none, no)
    Group.new('cssRenderProp', c.cyan, c.none, no)
    Group.new('cssColorProp', c.cyan, c.none, no)
    Group.new('cssGeneratedContentProp', c.cyan, c.none, no)
    -- DTD
    Group.new('dtdFunction', c.gray, c.none, no)
    Group.new('dtdTagName', c.purple, c.none, no)
    Group.new('dtdParamEntityPunct', c.gray, c.none, no)
    Group.new('dtdParamEntityDPunct', c.gray, c.none, no)
    -- Diff
    Group.new('diffAdded', c.green, c.none, no)
    Group.new('diffRemoved', c.red, c.none, no)
    Group.new('diffChanged', c.cyan, c.none, no)
    Group.new('diffFile', c.orange, c.none, no)
    Group.new('diffNewFile', c.green, c.none, no)
    Group.new('diffLine', c.blue, c.none, no)
    -- Elixir
    Group.new('elixirDocString', g.Comment, g.Comment, g.Comment)
    Group.new('elixirStringDelimiter', c.green, c.none, no)
    Group.new('elixirInterpolationDelimiter', c.cyan, c.none, no)
    Group.new('elixirModuleDeclaration', c.yellow, c.none, no)
    -- Go
    Group.new('goDirective', c.cyan, c.none, no)
    Group.new('goConstants', c.purple, c.none, no)
    Group.new('goDeclaration', g.Keyword, g.Keyword, g.Keyword)
    Group.new('goDeclType', c.blue, c.none, no)
    Group.new('goBuiltins', c.orange, c.none, no)
    -- Haskell
    Group.new('haskellType', c.fg1, c.none, no)
    Group.new('haskellIdentifier', c.fg1, c.none, no)
    Group.new('haskellSeparator', c.fg1, c.none, no)
    Group.new('haskellDelimiter', c.fg3, c.none, no)
    Group.new('haskellOperators', c.blue, c.none, no)
    Group.new('haskellBacktick', c.orange, c.none, no)
    Group.new('haskellStatement', c.orange, c.none, no)
    Group.new('haskellConditional', c.orange, c.none, no)
    Group.new('haskellLet', c.cyan, c.none, no)
    Group.new('haskellDefault', c.cyan, c.none, no)
    Group.new('haskellWhere', c.cyan, c.none, no)
    Group.new('haskellBottom', c.cyan, c.none, no)
    Group.new('haskellBlockKeywords', c.cyan, c.none, no)
    Group.new('haskellImportKeywords', c.cyan, c.none, no)
    Group.new('haskellDeclKeyword', c.cyan, c.none, no)
    Group.new('haskellDeriving', c.cyan, c.none, no)
    Group.new('haskellAssocType', c.cyan, c.none, no)
    Group.new('haskellNumber', c.purple, c.none, no)
    Group.new('haskellPragma', c.purple, c.none, no)
    Group.new('haskellString', c.green, c.none, no)
    Group.new('haskellChar', c.green, c.none, no)

    -- C# 
    Group.new('csClass', c.yellow, c.none, no)
    Group.new('csAttribute', c.yellow, c.none, no)
    Group.new('csModifier', c.purple, c.none, no)
    Group.new('csType', c.red, c.none, no)
    Group.new('csUnspecifiedStatement', c.blue, c.none, no)
    Group.new('csContextualStatement', c.purple, c.none, no)
    Group.new('csNewDecleration', c.red, c.none, no)

    -- HTML (keep consistent with Markdown, below)
    Group.new('htmlTag', c.blue, c.none, no)
    Group.new('htmlEndTag', c.blue, c.none, no)
    Group.new('htmlTagName', c.purple, c.none, no)
    Group.new('htmlArg', c.cyan, c.none, no)
    Group.new('htmlScriptTag', c.purple, c.none, no)
    Group.new('htmlTagN', c.fg1, c.none, no)
    Group.new('htmlSpecialTagName', c.cyan, c.none, b)
    Group.new('htmlLink', c.link, c.none, ul)
    Group.new('htmlSpecialChar', c.orange, c.none, no)
    Group.new('htmlBold', c.htmlBold, c.none, b)
    Group.new('htmlBoldUnderline', c.fg2, c.none, b, ul)
    Group.new('htmlBoldItalic', c.fg1, c.none, b + i)
    Group.new('htmlBoldUnderlineItalic', c.fg2, c.none, b + i + ul)
    Group.new('htmlUnderline', c.fg1, c.none, ul)
    Group.new('htmlUnderlineItalic', c.fg2, c.none, i + ul)
    Group.new('htmlItalic', c.purple, c.none, i)
    Group.new('htmlH1', c.heading, c.none, b)
    Group.new('htmlH2', c.heading, c.none, b)
    Group.new('htmlH3', c.heading, c.none, b)
    Group.new('htmlH4', c.heading, c.none, b)
    Group.new('htmlH5', c.heading, c.none, no)
    Group.new('htmlH6', c.heading, c.none, no)
    -- Java
    Group.new('javaAnnotation', c.blue, c.none, no)
    Group.new('javaDocTags', c.cyan, c.none, no)
    Group.new('javaCommentTitle', g.vimCommentTitle, g.vimCommentTitle, g.vimCommentTitle)
    Group.new('javaParen', c.fg3, c.none, no)
    Group.new('javaParen1', c.fg3, c.none, no)
    Group.new('javaParen2', c.fg3, c.none, no)
    Group.new('javaParen3', c.fg3, c.none, no)
    Group.new('javaParen4', c.fg3, c.none, no)
    Group.new('javaParen5', c.fg3, c.none, no)
    Group.new('javaOperator', c.orange, c.none, no)
    Group.new('javaVarArg', c.green, c.none, no)
    -- JavaScript
    Group.new('javaScriptBraces', c.fg1, c.none, no)
    Group.new('javaScriptFunction', c.cyan, c.none, no)
    Group.new('javaScriptIdentifier', c.red, c.none, no)
    Group.new('javaScriptMember', c.blue, c.none, no)
    Group.new('javaScriptNumber', c.purple, c.none, no)
    Group.new('javaScriptNull', c.purple, c.none, no)
    Group.new('javaScriptParens', c.fg3, c.none, no)
    Group.new('javascriptImport', c.cyan, c.none, no)
    Group.new('javascriptExport', c.cyan, c.none, no)
    Group.new('javascriptClassKeyword', c.cyan, c.none, no)
    Group.new('javascriptClassExtends', c.cyan, c.none, no)
    Group.new('javascriptDefault', c.cyan, c.none, no)
    Group.new('javascriptClassName', c.yellow, c.none, no)
    Group.new('javascriptClassSuperName', c.yellow, c.none, no)
    Group.new('javascriptGlobal', c.yellow, c.none, no)
    Group.new('javascriptEndColons', c.fg1, c.none, no)
    Group.new('javascriptFuncArg', c.fg1, c.none, no)
    Group.new('javascriptGlobalMethod', c.fg1, c.none, no)
    Group.new('javascriptNodeGlobal', c.fg1, c.none, no)
    Group.new('javascriptBOMWindowProp', c.fg1, c.none, no)
    Group.new('javascriptArrayMethod', c.fg1, c.none, no)
    Group.new('javascriptArrayStaticMethod', c.fg1, c.none, no)
    Group.new('javascriptCacheMethod', c.fg1, c.none, no)
    Group.new('javascriptDateMethod', c.fg1, c.none, no)
    Group.new('javascriptMathStaticMethod', c.fg1, c.none, no)
    Group.new('javascriptURLUtilsProp', c.fg1, c.none, no)
    Group.new('javascriptBOMNavigatorProp', c.fg1, c.none, no)
    Group.new('javascriptDOMDocMethod', c.fg1, c.none, no)
    Group.new('javascriptDOMDocProp', c.fg1, c.none, no)
    Group.new('javascriptBOMLocationMethod', c.fg1, c.none, no)
    Group.new('javascriptBOMWindowMethod', c.fg1, c.none, no)
    Group.new('javascriptStringMethod', c.fg1, c.none, no)
    Group.new('javascriptVariable', c.orange, c.none, no)
    Group.new('javascriptIdentifier', c.orange, c.none, no)
    Group.new('javascriptClassSuper', c.orange, c.none, no)
    Group.new('javascriptFuncKeyword', c.cyan, c.none, no)
    Group.new('javascriptAsyncFunc', c.cyan, c.none, no)
    Group.new('javascriptClassStatic', c.orange, c.none, no)
    Group.new('javascriptOperator', c.red, c.none, no)
    Group.new('javascriptForOperator', c.red, c.none, no)
    Group.new('javascriptYield', c.red, c.none, no)
    Group.new('javascriptExceptions', c.red, c.none, no)
    Group.new('javascriptMessage', c.red, c.none, no)
    Group.new('javascriptTemplateSB', c.cyan, c.none, no)
    Group.new('javascriptTemplateSubstitution', c.fg1, c.none, no)
    Group.new('javascriptLabel', c.fg1, c.none, no)
    Group.new('javascriptObjectLabel', c.fg1, c.none, no)
    Group.new('javascriptPropertyName', c.fg1, c.none, no)
    Group.new('javascriptLogicSymbols', c.fg1, c.none, no)
    Group.new('javascriptArrowFunc', c.yellow, c.none, no)
    Group.new('javascriptDocParamName', c.fg3, c.none, no)
    Group.new('javascriptDocTags', c.fg3, c.none, no)
    Group.new('javascriptDocNotation', c.fg3, c.none, no)
    Group.new('javascriptDocParamType', c.fg3, c.none, no)
    Group.new('javascriptDocNamedParamType', c.fg3, c.none, no)
    Group.new('javascriptBrackets', c.fg1, c.none, no)
    Group.new('javascriptDOMElemAttrs', c.fg1, c.none, no)
    Group.new('javascriptDOMEventMethod', c.fg1, c.none, no)
    Group.new('javascriptDOMNodeMethod', c.fg1, c.none, no)
    Group.new('javascriptDOMStorageMethod', c.fg1, c.none, no)
    Group.new('javascriptHeadersMethod', c.fg1, c.none, no)
    Group.new('javascriptAsyncFuncKeyword', c.red, c.none, b)
    Group.new('javascriptAwaitFuncKeyword', c.red, c.none, b)
    Group.new('jsClassKeyword', g.Keyword, g.Keyword, g.Keyword)
    Group.new('jsExtendsKeyword', g.Keyword, g.Keyword, g.Keyword)
    Group.new('jsExportDefault', c.blue, c.none, b)
    Group.new('jsTemplateBraces', c.cyan, c.none, no)
    Group.new('jsGlobalNodeObjects', g.Keyword, g.Keyword, g.Keyword)
    Group.new('jsGlobalObjects', g.Keyword, g.Keyword, g.Keyword)
    Group.new('jsFunction', g.Function, g.Function, g.Function)
    Group.new('jsFuncParens', c.orange, c.none, no)
    Group.new('jsParens', c.red, c.none, no)
    Group.new('jsNull', c.purple, c.none, no)
    Group.new('jsUndefined', g.ErrorMsg, g.ErrorMsg, g.ErrorMsg)
    Group.new('jsClassDefinition', c.yellow, c.none, no)
    Group.new('jsObjectProp', g.Identifier, g.Identifier, g.Identifier)
    Group.new('jsObjectKey', c.blue, c.none, no)
    Group.new('jsFunctionKey', c.blue, c.none, no)
    Group.new('jsBracket', c.red, c.none, no)
    Group.new('jsObjectColon', c.red, c.none, no)
    Group.new('jsFuncArgs', c.blue, c.none, no)
    Group.new('jsFuncBraces', c.blue, c.none, no)
    Group.new('jsVariableDef', c.fg1, c.none, no)
    Group.new('jsObjectBraces', g.Special, g.Special, g.Special)
    Group.new('jsObjectValue', c.green, c.none, no)
    Group.new('jsClassBlock', c.blue, c.none, no)
    Group.new('jsFutureKeys', c.orange, c.none, b)
    Group.new('jsFuncArgs', c.blue, c.none, no)
    Group.new('jsStorageClass', c.blue, c.none, no)
    Group.new('jsxRegion', c.blue, c.none, no)
    -- JSON
    Group.new('jsonKeyword', c.green, c.none, no)
    Group.new('jsonQuote', c.green, c.none, no)
    Group.new('jsonBraces', c.fg1, c.none, no)
    Group.new('jsonString', c.fg1, c.none, no)
    -- Lua
    Group.new('luaIn', c.purple, c.none, no)
    Group.new('luaFunction', c.purple, c.none, no)
    Group.new('luaTable', c.orange, c.none, no)
    Group.new('luaLabel', c.purple, c.none, no)

    -- Markdown (keep consistent with HTML, above
    Group.new('markdownItalic', c.fg3, c.none, i)
    Group.new('markdownH1', g.htmlH1, g.htmlH1, g.htmlH1)
    Group.new('markdownH2', g.htmlH2, g.htmlH2, g.htmlH2)
    Group.new('markdownH3', g.htmlH3, g.htmlH3, g.htmlH3)
    Group.new('markdownH4', g.htmlH4, g.htmlH4, g.htmlH4)
    Group.new('markdownH5', g.htmlH5, g.htmlH5, g.htmlH5)
    Group.new('markdownH6', g.htmlH6, g.htmlH6, g.htmlH6)
    Group.new('markdownCode', c.fg1, c.none, no)
    Group.new('mkdCode', g.markdownCode, g.markdownCode, g.markdownCode)
    Group.new('markdownCodeBlock', c.purple, c.none, no)
    Group.new('markdownCodeDelimiter', c.codeDelimiter, c.none, no)
    Group.new('mkdCodeDelimiter', g.markdownCodeDelimiter, g.markdownCodeDelimiter, g.markdownCodeDelimiter)
    Group.new('markdownBlockquote', c.gray, c.none, no)
    Group.new('markdownListMarker', c.gray, c.none, no)
    Group.new('markdownOrderedListMarker', c.gray, c.none, no)
    Group.new('markdownRule', c.gray, c.none, no)
    Group.new('markdownHeadingRule', c.gray, c.none, no)
    Group.new('markdownUrlDelimiter', c.fg3, c.none, no)
    Group.new('markdownLinkDelimiter', c.fg3, c.none, no)
    Group.new('markdownLinkTextDelimiter', c.fg3, c.none, no)
    Group.new('markdownHeadingDelimiter', c.blue, c.none, no)
    Group.new('markdownUrl', c.url, c.none, b)
    Group.new('mkdUrl', g.markdownUrl, g.markdownUrl, g.markdownUrl)

    Group.new('markdownUrlTitleDelimiter', c.green, c.none, no)
    Group.new('markdownLinkText', g.htmlLink, g.htmlLink, g.htmlLink)
    -- Group.new('markdownLinkText', c.red, c.none, no)
    Group.new('mkdLink', g.htmlLink, g.htmlLink, g.htmlLink)

    Group.new('markdownIdDeclaration', g.markdownLinkText, g.markdownLinkText, g.markdownLinkText)
    -- MoonScript
    Group.new('moonSpecialOp', c.fg3, c.none, no)
    Group.new('moonExtendedOp', c.fg3, c.none, no)
    Group.new('moonFunction', c.fg3, c.none, no)
    Group.new('moonObject', c.yellow, c.none, no)
    -- Objective-C
    Group.new('objcTypeModifier', c.red, c.none, no)
    Group.new('objcDirective', c.blue, c.none, no)
    -- PureScript
    Group.new('purescriptModuleKeyword', c.cyan, c.none, no)
    Group.new('purescriptModuleName', c.red, c.none, b)
    Group.new('purescriptWhere', c.cyan, c.none, no)
    Group.new('purescriptDelimiter', c.fg2, c.none, no)
    Group.new('purescriptType', g.Type, g.Type, g.Type)
    Group.new('purescriptImportKeyword', g.Keyword, g.Keyword, g.Keyword)
    Group.new('purescriptHidingKeyword', g.Keyword, g.Keyword, g.Keyword)
    Group.new('purescriptAsKeyword', g.Keyword, g.Keyword, g.Keyword)
    Group.new('purescriptStructure', g.Structure, g.Structure, g.Structure)
    Group.new('purescriptOperator', g.Operator, g.Operator, g.Operator)
    Group.new('purescriptTypeVar', g.Type, g.Type, g.Type)
    Group.new('purescriptConstructor', g.Function, g.Function, g.Function)
    Group.new('purescriptFunction', g.Function, g.Function, g.Function)
    Group.new('purescriptConditional', g.Conditional, g.Conditional, g.Conditional)
    Group.new('purescriptBacktick', c.orange, c.none, no)
    -- Python
    Group.new('pythonCoding', g.Comment, g.Comment, g.Comment)
    Group.new('pythonOperator', c.purple, c.none, no)
    Group.new('pythonRepeat', c.purple, c.none, no)
    Group.new('pythonInclude', c.purple, c.none, no)
    Group.new('pythonStatement', c.purple, c.none, no)

    -- Ruby
    Group.new('rubyStringDelimiter', c.green, c.none, no)
    Group.new('rubyInterpolationDelimiter', c.cyan, c.none, no)
    Group.new('rubyConstant', c.cyan, c.none, no)
    Group.new('rubyAttribute', c.cyan, c.none, no)
    Group.new('rubyRegexp', c.cyan, c.none, no)
    Group.new('rubySymbol', c.green, c.none, no)
    Group.new('rubyInterpolationDelimiter', c.cyan, c.none, no)

    -- Rust
    Group.new('rustSelf', c.blue, c.none, b)
    Group.new('rustPanic', c.red, c.none, b)
    Group.new('rustAssert', c.blue, c.none, b)
    -- Scala
    Group.new('scalaNameDefinition', c.fg1, c.none, no)
    Group.new('scalaCaseFollowing', c.fg1, c.none, no)
    Group.new('scalaCapitalWord', c.fg1, c.none, no)
    Group.new('scalaTypeExtension', c.fg1, c.none, no)
    Group.new('scalaKeyword', c.red, c.none, b)
    Group.new('scalaKeywordModifier', c.red, c.none, no)
    Group.new('scalaSpecial', c.cyan, c.none, no)
    Group.new('scalaOperator', c.fg1, c.none, no)
    Group.new('scalaTypeDeclaration', c.yellow, c.none, no)
    Group.new('scalaTypeTypePostDeclaration', c.yellow, c.none, no)
    Group.new('scalaInstanceDeclaration', c.fg1, c.none, no)
    Group.new('scalaInterpolation', c.cyan, c.none, no)
    -- TypeScript
    Group.new('typeScriptReserved', c.cyan, c.none, no)
    Group.new('typeScriptLabel', g.Label, g.Label, g.Label)
    Group.new('typeScriptFuncKeyword', g.Function, g.Function, g.Function)
    Group.new('typeScriptIdentifier', g.Identifier, g.Identifier, g.Identifier)
    Group.new('typeScriptBraces', c.red1, c.none, no)
    Group.new('typeScriptEndColons', c.fg1, c.none, no)
    Group.new('typeScriptDOMObjects', c.fg1, c.none, no)
    Group.new('typeScriptAjaxMethods', g.Function, g.Function, g.Function)
    Group.new('typeScriptLogicSymbols', c.fg1, c.none, no)
    Group.new('typeScriptDocSeeTag', g.Comment, g.Comment, g.Comment)
    Group.new('typeScriptDocParam', g.Comment, g.Comment, g.Comment)
    Group.new('typeScriptDocTags', g.vimCommentTitle, g.vimCommentTitle, g.vimCommentTitle)
    Group.new('typeScriptGlobalObjects', g.Keyword, g.Keyword, g.Keyword)
    Group.new('typeScriptParens', c.blue1, c.none, no)
    Group.new('typeScriptOpSymbols', g.Operator, g.Operator, g.Operator)
    Group.new('typeScriptHtmlElemProperties', g.Special, g.Special, g.Special)
    Group.new('typeScriptNull', c.purple, c.none, b)
    Group.new('typeScriptInterpolationDelimiter', c.cyan, c.none, no)
    -- XML
    Group.new('xmlTag', c.blue, c.none, no)
    Group.new('xmlEndTag', c.blue, c.none, no)
    Group.new('xmlTagName', c.blue, c.none, no)
    Group.new('xmlEqual', c.blue, c.none, no)
    Group.new('docbkKeyword', c.cyan, c.none, b)
    Group.new('xmlDocTypeDecl', c.gray, c.none, no)
    Group.new('xmlDocTypeKeyword', c.purple, c.none, no)
    Group.new('xmlCdataStart', c.gray, c.none, no)
    Group.new('xmlCdataCdata', c.purple, c.none, no)
    Group.new('xmlAttrib', c.cyan, c.none, no)
    Group.new('xmlProcessingDelim', c.gray, c.none, no)
    Group.new('xmlAttribPunct', c.gray, c.none, no)
    Group.new('xmlEntity', c.orange, c.none, no)
    Group.new('xmlEntityPunct', c.orange, c.none, no)
    -- Vim
    Group.new('vimCommentTitle', c.blue, c.none, b)
    Group.new('vimNotation', c.orange, c.none, no)
    Group.new('vimBracket', c.orange, c.none, no)
    Group.new('vimMapModKey', c.orange, c.none, no)
    Group.new('vimCommand', c.accent, c.none, b)
    Group.new('vimLet', c.blue, c.none, no)
    Group.new('vimNorm', c.blue, c.none, no)
    Group.new('vimFuncSID', g.Function, g.Function, g.Function)
    Group.new('vimFunction', g.Function, g.Function, g.Function)
    Group.new('vimGroup', c.blue, c.none, no)
    Group.new('vimHiGroup', g.Type, g.Type, g.Type)
    Group.new('vimSetSep', c.fg3, c.none, no)
    Group.new('vimSep', c.fg3, c.none, no)
    Group.new('vimContinue', c.yellow, c.none, no)

    -- TODO: Cypher
    -- hi link cypherComment              Comment
    -- hi link cypherKeyword              Define
    -- hi link cypherProperty             String
    -- hi link cypherPropertyName         Identifier
    -- hi link cypherRelationship         Identifier
    -- hi link cypherSymbol               Operator
    -- hi link cypherVariable             Identifier

    -- Plugin highlight
    -- Telescope
    local telescope_selection = current_mode == 'dark' and c.purple or c.yellow
    Group.new('TelescopeSelection', telescope_selection, c.none, b) -- selected item
    Group.new('TelescopeSelectionCaret', c.green, c.none) -- selection caret
    -- Group.new('TelescopeMultiSelection', c.brown, c.none) -- multisections
    -- Group.new('TelescopeNormal', g.Normal, c.g.Normal) --  floating windows created by telescope.
    local telescope_matching = current_mode == 'dark' and c.yellow or c.orange
    Group.new('TelescopeMatching', telescope_matching, c.none)
    -- Group.new('TelescopePromptPrefix', c.none, c.none)

    -- --  Telescope Border highlight groups.
    Group.new('TelescopeBorder', c.fg1, c.none, b) -- selected item
    -- Group.new('TelescopePromptBorder', c.orange, c.none, b) -- selected item
    -- Group.new('TelescopeResultsBorder', c.orange, c.none, b) -- selected item
    -- Group.new('TelescopePreviewBorder', c.orange, c.none, b) -- selected item

    -- Scrollview (dstein64/nvim-scrollview)
    Group.new('Scrollview', c.none, c.fg1, no)

    -- Signify (mhinz/vim-signify)
    Group.new('SignifySignAdd', c.green, c.none, no)
    Group.new('SignifySignChange', c.blue, c.none, no)
    Group.new('SignifySignDelete', c.red, c.none, no)

    -- gitsigns (lewis6991/gitsigns.nvim)
    Group.new('GitSignsAdd', c.green, c.none, no)
    Group.new('GitSignsAddNr', c.bg, c.green, no)
    Group.new('GitSignsAddLn', c.red, c.none, no)
    Group.new('GitSignsChange', c.orange, c.none, no)
    Group.new('GitSignsChangeNr', c.bg, c.orange, no)
    Group.new('GitSignsChangeLn', c.orange, c.none, no)
    Group.new('GitSignsDelete', c.red, c.none, no)
    Group.new('GitSignsDeleteNr', c.fg1, c.red, no)
    Group.new('GitSignsDeleteLn', c.red, c.none, no)

    -- Git Commit (tpope/vim-git)
    Group.new('gitcommitSelectedFile', c.green, c.none, no)
    Group.new('gitcommitDiscardedFile', c.red, c.none, no)
    Group.new('gitcommitOverflow', c.red, c.none, no)
    Group.new('gitcommitSummary', c.green, c.none, no)
    Group.new('gitcommitComment', c.gray, c.none, no)
    Group.new('gitcommitUntracked', c.gray, c.none, no)
    Group.new('gitcommitDiscarded', c.gray, c.none, no)
    Group.new('gitcommitSelected', c.gray, c.none, no)
    Group.new('gitcommitHeader', c.purple, c.none, no)
    Group.new('gitcommitSelectedType', c.blue, c.none, no)
    Group.new('gitcommitUnmergedType', c.blue, c.none, no)
    Group.new('gitcommitDiscardedType', c.blue, c.none, no)
    Group.new('gitcommitBranch', c.orange, c.none, no)
    Group.new('gitcommitUntrackedFile', c.yellow, c.none, no)
    Group.new('gitcommitUnmergedFile', c.red, c.none, no)
    Group.new('gitcommitDiscardedFile', c.red, c.none, no)

    -- Gitgutter (airblade/vim-gitgutter)
    Group.new('GitGutterAdd', c.green, c.none, b)
    Group.new('GitGutterChange', c.yellow, c.none, b)
    Group.new('GitGutterDelete', c.red, c.none, b)
    Group.new('GitGutterChangeDelete', c.purple, c.none, b)
    -- Git Messenger (rhysd/git-messenger.vim)
    Group.new('gitmessengerPopupNormal', g.CursorLine, g.CursorLine, g.CursorLine) -- Normal color in popup window
    Group.new('gitmessengerHeader', g.CursorLine, g.CursorLine, g.CursorLine) -- Header such as 'Commit:', 'Author:'
    Group.new('gitmessengerHash', g.CursorLine, g.CursorLine, g.CursorLine) -- Commit hash at 'Commit:' header
    Group.new('gitmessengerHistory', g.CursorLine, g.CursorLine, g.CursorLine) -- History number at 'History:' header
    -- NvimTree (kyazdani42/nvim-tree.lua)
    Group.new('NvimTreeFolderName', c.fg1, c.none, no)
    Group.new('NvimTreeFolderIcon', c.accent, c.none, no)
    Group.new('NvimTreeExecFile', c.green, c.none, no)
    Group.new('NvimTreeImageFile', c.yellow, c.none, no)
    Group.new('NvimTreeEmptyFolderName', c.fg1, c.none, no)
    -- Group.new('NvimTreeIndentMarker', c.white, c.none, no)
    Group.new('NvimTreeMarkdownFile', c.blue, c.none, no)
    Group.new('NvimTreeSpecialFile', c.blue, c.none, no)
    Group.new('NvimTreeRootFolder', c.purple, c.none, no)
    Group.new('NvimTreeGitDirty', c.yellow, c.none, no)
    Group.new('NvimTreeGitStaged', c.blue, c.none, no)
    Group.new('NvimTreeGitDeleted', c.red, c.none, no)
    -- Group.new('NvimTreeGitMerge', c.blue, c.none, no)
    -- Group.new('NvimTreeGitRenamed', c.blue, c.none, no)
    Group.new('NvimTreeGitNew', c.green, c.none, no)
    -- Group.new('NvimTreeSymlink', c.blue, c.none, no)
    -- NerdTree (preservim/nerdtree)
    Group.new('NERDTreeDir', c.blue, c.none, b)
    Group.new('NERDTreeDirSlash', c.fg1, c.none, no)
    Group.new('NERDTreeOpenable', c.blue, c.none, no)
    Group.new('NERDTreeClosable', c.blue, c.none, no)
    Group.new('NERDTreeFile', c.fg1, c.none, no)
    Group.new('NERDTreeExecFile', c.green, c.none, no)
    Group.new('NERDTreeUp', c.red, c.none, no)
    Group.new('NERDTreeCWD', c.purple, c.none, no)
    Group.new('NERDTreeHelp', c.fg1, c.none, no)
    Group.new('NERDTreeToggleOn', c.green, c.none, no)
    Group.new('NERDTreeToggleOff', c.red, c.none, no)
    -- Netrw (vim builtin)
    Group.new('netrwDir', c.blue, c.none, no)
    Group.new('netrwClassify', c.blue, c.none, no)
    Group.new('netrwLink', c.grey, c.none, no)
    Group.new('netrwSymLink', c.fg1, c.none, no)
    Group.new('netrwExe', c.yellow, c.none, no)
    Group.new('netrwComment', c.grey, c.none, no)
    Group.new('netrwList', c.blue, c.none, no)
    Group.new('netrwHelpCmd', c.cyan, c.none, no)
    Group.new('netrwCmdSep', c.fg3, c.none, no)
    Group.new('netrwVersion', c.green, c.none, no)
    -- Which Key (liuchengxu/vim-which-key)
    Group.new('WhichKey', g.Function, g.Function, g.Function)
    Group.new('WhichKeySeperator', c.purple, c.none, no)
    Group.new('WhichKeyGroup', g.Identifier, g.Identifier, g.Identifier)
    Group.new('WhichKeyDesc', g.Operator, g.Operator, g.Operator)

    -- NeoVim built in

    -- +- Neovim Support -+
    Group.new('healthError', c.error, c.fg2)
    Group.new('healthSuccess', c.green, c.bg)
    Group.new('healthWarning', c.yellow, c.bg)
    Group.new('TermCursorNC', c.fg1, c.bg)

    -- LSP Groups ( see `:h lsp-highlight`)
    Group.new('LspDiagnosticsDefaultError', c.error, c.none) -- Base highlight for errors
    Group.new('LspDiagnosticsDefaultWarning', c.yellow, c.none) -- Base highlight for warnings
    Group.new('LSPDiagnosticsDefaultInformation', c.blue, c.none) -- Base highlight for info
    Group.new('LspDiagnosticsDefaultHint', c.purple, c.none) -- Base highlight for hints

    Group.new('LspReferenceText', c.none, c.lsp_background) -- used for highlighting 'text' references
    Group.new('LspReferenceRead', c.none, c.lsp_background) -- used for highlighting 'read' references
    Group.new('LspReferenceWrite', c.none, c.lsp_background) -- used for highlighting 'write' references

    -- LSP Saga
    Group.new('DiagnosticError', c.error, c.none)
    Group.new('DiagnosticWarning', c.yellow, c.none)
    Group.new('DiagnosticInformation', c.blue, c.none)
    Group.new('DiagnosticHint', c.purple, c.none)
    Group.new('LspSagaRenameBorder', c.green, c.none)
    Group.new('LspSagaRenamePromptPrefix', c.green, c.none)
    Group.new('LspSagaHoverBorder', c.accent, c.none)
    Group.new('DefinitionPreviewTitle', c.yellow, c.none)
    Group.new('LspSagaDefPreviewBorder', c.yellow, c.none)
    Group.new('LspFloatWinBorder', c.yellow, c.none)
    Group.new('LspSagaFinderSelection', c.green, c.none)
    -- Group.new('LspSagaLspFinderBorder', c.blue, c.none)
    Group.new('LspSagaDocTruncateLine', c.bg, c.none)
    Group.new('LspSagaShTruncateLine', c.bg, c.none)
    Group.new('LspSagaCodeActionTitle', c.orange, c.none, b)
    -- Group.new('LspSagaCodeActionContent', c.green, c.none, b)
    -- Group.new('LspSagaCodeActionTruncateLine', c.bg, c.none)
    -- Group.new('LspSagaAutoPreview', c.orange, c.none)
    Group.new('LspSagaSignatureHelpBorder', c.green, c.none)
    Group.new('LspSagaDiagnosticBorder', c.purple, c.none)
    Group.new('LspSagaDiagnosticHeader', c.orange, c.none, b)
    Group.new('LspSagaDiagnosticTruncateLine', c.purple, c.none)

    -- Lsp saga lightbulb
    Group.new('LspSagaLightBulb', c.yellow, c.none)

    -- LSP specific groups 
    -- LSP Floating
    -- Group.new('LspDiagnosticsFloatingError', c.error, c.none)
    -- Group.new('LspDiagnosticsFloatingWarn', c.yellow, c.none)
    -- Group.new('LspDiagnosticsFloatingInfor', c.blue, c.none)
    -- Group.new('LspDiagnosticsFloatingHint', c.blue, c.none)

    -- LSP signs
    -- Group.new('LspDiagnosticsSignError', c.error, c.none)
    -- Group.new('LspDiagnosticsSignWarn', c.yellow, c.none)
    -- Group.new('LspDiagnosticsSignInformation', c.blue, c.none)
    -- Group.new('LspDiagnosticsSignHint', c.blue, c.none)

    -- LSP virtual text
    -- Group.new('LspDiagnosticsVirtualTextError', c.error, c.none)
    -- Group.new('LspDiagnosticsVirtualTextWarn', c.yellow, c.none)
    -- Group.new('LspDiagnosticsVirtualTextInformation', c.blue, c.none)
    -- Group.new('LspDiagnosticsVirtualTextHint', c.blue, c.none)

    -- LSP underline
    -- Group.new('LspDiagnosticsUnderlineError', c.error, c.none)
    -- Group.new('LspDiagnosticsUnderlineWarn', c.yellow, c.none)
    -- Group.new('LspDiagnosticsUnderlineInformation', c.blue, c.none)
    -- Group.new('LspDiagnosticsUnderlineHint', c.blue, c.none)

    -- Nvim Treesitter Groups (descriptions and ordering from `:h nvim-treesitter-highlights`)
    -- Treesitter rainbow parentheses (https://github.com/p00f/nvim-ts-rainbow)
    Group.new('rainbowcol1', c.blue, nil)
    Group.new('rainbowcol2', c.orange, nil)
    Group.new('rainbowcol3', c.green, nil)
    Group.new('rainbowcol4', c.red, nil)
    Group.new('rainbowcol5', c.purple, nil)
    Group.new('rainbowcol6', c.cyan, nil)
    Group.new('rainbowcol7', c.brown, nil)

    -- Indentline Groups ( lukas-reineke/indent-blankline.nvim ). To use, you can define g:indent_blankline_char_highlight_list=['SnazzyIndent1', 'SnazzyIndent2',...]
    Group.new('SnazzyIndent1', c.blue, nil)
    Group.new('SnazzyIndent2', c.orange, nil)
    Group.new('SnazzyIndent3', c.green, nil)
    Group.new('SnazzyIndent4', c.red, nil)
    Group.new('SnazzyIndent5', c.purple, nil)
    Group.new('SnazzyIndent6', c.cyan, nil)
    Group.new('SnazzyIndent7', c.brown, nil)

    Group.new('TSError', c.error, c.none, b) -- For syntax/parser errors
    Group.new('TSPunctDelimiter', g.Delimiter, c.none) -- For delimiters ie: `.
    Group.new('TSPunctBracket', c.fg3, nil) -- For brackets and parens
    -- Group.new('TSPunctSpecial'       , c.fg     , nil) -- For special punctutation that does not fall in the catagories before
    Group.new('TSConstant', g.Constant, c.none) -- For constants
    Group.new('TSConstBuiltin', g.Constant, c.none) -- For constant that are built in the language: `nil` in Lua
    Group.new('TSConstMacro', g.Constant, c.none) -- For constants that are defined by macros: `NULL` in C
    Group.new('TSString', g.String, c.none) -- For strings
    Group.new('TSStringRegex', c.red, nil) -- For regexes
    Group.new('TSStringEscape', c.red, nil) -- For escape characters within a string
    Group.new('TSCharacter', g.Character, c.none) -- For characters
    Group.new('TSNumber', g.Number, c.none) -- For integers
    Group.new('TSBoolean', g.Boolean, c.none) -- For booleans
    Group.new('TSFloat', g.Float, c.none) -- For floats
    Group.new('TSFunction', g.Function, c.none) -- For function (calls and definitions
    Group.new('TSFuncBuiltin', g.Function, c.none) -- For builtin functions: `table.insert` in Lua
    Group.new('TSFuncMacro', g.Function, c.none) -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    Group.new('TSParameter', c.TSParameter, c.none, s.none) -- For parameters of a function.
    -- Group.new('TSParameterReference' , g.TSParameter     , nil) -- For references to parameters of a function.
    Group.new('TSMethod', g.Function, c.none) -- For method calls and definitions.
    Group.new('TSField', c.TSField, c.none, s.none) -- For fields.
    Group.new('TSProperty', c.TSProperty, c.none, s.none) -- Same as `TSField`.
    -- Group.new('TSConstructor'        , c.magenta_alt       , c.none)  -- For constructor calls and definitions: `{}` in Lua, and Java constructors
    Group.new('TSConditional', g.Conditional, c.none) -- For keywords related to conditionnals
    Group.new('TSRepeat', g.Repeat, c.none) -- For keywords related to loops
    Group.new('TSLabel', g.Label, c.none) -- For labels: `label:` in C and `:label:` in Lua
    Group.new('TSOperator', g.Operator, c.none) -- For any operator: `+`, but also `->` and `*` in C
    Group.new('TSKeyword', g.Keyword, c.none) -- For keywords that don't fall in previous categories.
    Group.new('TSKeywordOperator', c.TSKeywordOperator, c.none) -- For keywords that don't fall in previous categories.

    -- Group.new('TSKeywordFunction'    , c.magenta_alt       , c.none  , s.none) -- For keywords used to define a fuction.
    Group.new('TSException', g.Exception, c.none) -- For exception related keywords.
    Group.new('TSType', g.Type, c.none, s.none) -- For types.
    Group.new('TSTypeBuiltin', g.Type, c.none, s.none) -- For builtin types (you guessed it, right ?).
    Group.new('TSStructure', g.Structure, c.none) -- This is left as an exercise for the reader.
    Group.new('TSInclude', g.Include, c.none) -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- Group.new('TSAnnotation'         , c.blue_nuanced_bg , c.none) -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- Group.new('TSText'             , c.fg              , c.bg           , b) -- For strings considered text in a markup language.
    -- Group.new('TSStrong'             , c.fg              , c.bg           , b) -- For text to be represented with strong.
    -- Group.new('TSEmphasis'            , c.blue_alt          , c.none  , b) -- For text to be represented with emphasis.
    -- Group.new('TSUnderline'            , c.blue_alt          , c.none  , b) -- TSUnderline
    -- Group.new('TSTitle'              , c.cyan_nuanced    , c.none) -- Text that is part of a title.
    -- Group.new('TSLiteral'            , c.blue_alt          , c.none  , b) -- Literal text.
    -- Group.new('TSURI'           , c.cyan              , c.none  , s.none) -- Any URI like a link or email.
    Group.new('TSVariable', c.TSVariable, c.none, s.none) -- Any URI like a link or email.
    -- Group.new('TSVariableBuiltin' , g.magenta_alt_other     , nil) -- Variable names that are defined by the languages, like `this` or `self`.

    -- Mail highlighting
    Group.new("mailQuoted1", c.yellow, c.none, no)
    Group.new("mailQuoted2", c.green, c.none, no)
    Group.new("mailQuoted3", c.purple, c.none, no)
    Group.new("mailQuoted4", c.cyan, c.none, no)
    Group.new("mailQuoted5", c.blue, c.none, no)
    Group.new("mailQuoted6", c.yellow, c.none, no)
    Group.new("mailURL", c.blue, c.none, no)
    Group.new("mailEmail", c.blue, c.none, no)

    -- Group overrides for light theme
    if get_current_mode() == 'light' then
        -- TODO: incsearch
    end

    -- Load icons for kyazdani42/nvim-web-devicons
    M.icon_load()
end

function M.icon_load()
    if vim.g.colors_name == 'snazzybuddy' and vim.g.snazzybuddy_icons then
        require'snazzybuddy.icons'.setup(Group)
    end
end

-- function M.colorscheme_refresh()
--     if vim.g.colors_name == 'snazzybuddy' then
--         M.icon_load()
--     end
-- end

function M.reload()
    package.loaded.snazzybuddy = nil
    package.loaded.colorbuddy = nil
    require('colorbuddy').colorscheme('snazzybuddy')
end

M.load()
return M
