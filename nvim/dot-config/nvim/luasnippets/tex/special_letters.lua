local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local helpers = require 'helper_functions.luasnip'
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils

return {
  -- Lower case greek letters
  s({ trig = ';a', snippetType = 'autosnippet' }, { t '\\alpha' }),
  s({ trig = ';b', snippetType = 'autosnippet' }, { t '\\beta' }),
  s({ trig = ';g', snippetType = 'autosnippet' }, { t '\\gamma' }),
  s({ trig = ';ph', snippetType = 'autosnippet' }, { t '\\phi' }),
  s({ trig = ';th', snippetType = 'autosnippet' }, { t '\\theta' }),
  s({ trig = ';ta', snippetType = 'autosnippet' }, { t '\\tau' }),
  s({ trig = ';d', snippetType = 'autosnippet' }, { t '\\delta' }),
  s({ trig = ';ep', snippetType = 'autosnippet' }, { t '\\epsilon' }),
  s({ trig = ';et', snippetType = 'autosnippet' }, { t '\\eta' }),
  s({ trig = ';z', snippetType = 'autosnippet' }, { t '\\zeta' }),
  s({ trig = ';s', snippetType = 'autosnippet' }, { t '\\sigma' }),
  s({ trig = ';i', snippetType = 'autosnippet' }, { t '\\iota' }),
  s({ trig = ';k', snippetType = 'autosnippet' }, { t '\\kappa' }),
  s({ trig = ';l', snippetType = 'autosnippet' }, { t '\\lambda' }),
  s({ trig = ';m', snippetType = 'autosnippet' }, { t '\\mu' }),
  s({ trig = ';n', snippetType = 'autosnippet' }, { t '\\nabla' }),
  s({ trig = ';x', snippetType = 'autosnippet' }, { t '\\xi' }),
  s({ trig = ';ps', snippetType = 'autosnippet' }, { t '\\psi' }),
  s({ trig = ';pi', snippetType = 'autosnippet' }, { t '\\pi' }),
  s({ trig = ';r', snippetType = 'autosnippet' }, { t '\\rho' }),
  s({ trig = ';u', snippetType = 'autosnippet' }, { t '\\upsilon' }),
  s({ trig = ';c', snippetType = 'autosnippet' }, { t '\\chi' }),
  s({ trig = ';o', snippetType = 'autosnippet' }, { t '\\omega' }),

  -- Uppercase greek letters
  s({ trig = ';A', snippetType = 'autosnippet' }, { t '\\Alpha' }),
  s({ trig = ';B', snippetType = 'autosnippet' }, { t '\\Beta' }),
  s({ trig = ';G', snippetType = 'autosnippet' }, { t '\\Gamma' }),
  s({ trig = ';Ph', snippetType = 'autosnippet' }, { t '\\Phi' }),
  s({ trig = ';Th', snippetType = 'autosnippet' }, { t '\\Theta' }),
  s({ trig = ';Ta', snippetType = 'autosnippet' }, { t '\\Tau' }),
  s({ trig = ';D', snippetType = 'autosnippet' }, { t '\\Delta' }),
  s({ trig = ';Ep', snippetType = 'autosnippet' }, { t '\\Epsilon' }),
  s({ trig = ';Et', snippetType = 'autosnippet' }, { t '\\Eta' }),
  s({ trig = ';Z', snippetType = 'autosnippet' }, { t '\\Zeta' }),
  s({ trig = ';S', snippetType = 'autosnippet' }, { t '\\Sigma' }),
  s({ trig = ';I', snippetType = 'autosnippet' }, { t '\\Iota' }),
  s({ trig = ';K', snippetType = 'autosnippet' }, { t '\\Kappa' }),
  s({ trig = ';Lm', snippetType = 'autosnippet' }, { t '\\Lambda' }),
  s({ trig = ';M', snippetType = 'autosnippet' }, { t '\\Mu' }),
  s({ trig = ';X', snippetType = 'autosnippet' }, { t '\\Xi' }),
  s({ trig = ';Ps', snippetType = 'autosnippet' }, { t '\\Psi' }),
  s({ trig = ';Pi', snippetType = 'autosnippet' }, { t '\\Pi' }),
  s({ trig = ';U', snippetType = 'autosnippet' }, { t '\\Upsilon' }),
  s({ trig = ';C', snippetType = 'autosnippet' }, { t '\\Chi' }),
  s({ trig = ';O', snippetType = 'autosnippet' }, { t '\\Omega' }),

  s(
    { trig = 'cc', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\mathcal{<>}<>]], { i(1, 'L'), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  -- Sets
  s({ trig = ';R', snippetType = 'autosnippet' }, { t '\\mathbb R' }),

  -- Logorithm
  s({ trig = 'ln', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' }, fmta([[\ln{\left(<>\right)}<>]], { i(1), i(0) }), {
    condition = function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local char_before = line:sub(col - 2, col - 2)
      return char_before ~= '\\' and tex_utils.in_mathzone()
    end,
  }),

  -- Sums and the like
  s(
    { trig = 'ss', wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\sum_{<>=<>}^{<>}<>]], {
      i(1, 'i'),
      i(2, '1'),
      i(3, '\\infty'),
      c(4, {
        fmta([[{<>}<>]], { i(1), i(0) }),
        fmta([[{\biggl(<>\biggr)}<>]], { i(1), i(0) }),
      }),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = 'norm', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\norm{<>}<>]], { i(1, 'A'), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '2norm', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\norm{<>}_{2}<>]], { i(1, 'A'), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '22norm', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\norm{<>}_{2}^{2}<>]], { i(1, 'A'), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Optimizationstuffs
  s({ trig = 'minimize', show_condition = tex_utils.in_mathzone, wordTrig = true }, fmta([[\minn <>]], { i(0) }), { condition = tex_utils.in_mathzone }),
  s({ trig = 'subjectto', show_condition = tex_utils.in_mathzone, wordTrig = true }, fmta([[\subto <>]], { i(0) }), { condition = tex_utils.in_mathzone }),

  -- Hats
  s({ trig = 'ht', wordTrig = true, snippetType = 'autosnippet' }, fmta([[\tilde{<>}<>]], { i(1, 'x'), i(0) }), { condition = tex_utils.in_mathzone }),

  -- Derivatives
  s(
    { trig = '{pr', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    { t '{\\prime' },
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '{ppr', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    { t '{\\prime\\prime' },
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '{pppr', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    { t '{\\prime\\prime\\prime' },
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '{ppppr', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    { t '{\\prime\\prime\\prime\\prime' },
    { condition = tex_utils.in_mathzone }
  ),

  s(
    { trig = 'pp', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\frac{\partial}{\partial <>}<>]], { i(1, 'x'), i(0) }),
    {
      condition = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local char_before = line:sub(col - 2, col - 2)
        return char_before ~= '{' and tex_utils.in_mathzone()
      end,
    }
  ),

  s({ trig = 'oo', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' }, fmta([[\frac{d}{d <>}<>]], { i(1, 'x'), i(0) }), {
    condition = function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local char_before = line:sub(col - 2, col - 2)
      return char_before ~= '{' and tex_utils.in_mathzone()
    end,
  }),

  -- Subscript superscript
  s(
    { trig = '_', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[_{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = '^', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[^{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = 'jj', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[_{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = 'kk', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[^{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),

  -- Fraction
  s(
    { trig = 'ff', show_condition = tex_utils.in_mathzone, wordTrig = true, snippetType = 'autosnippet' },
    fmta([[\frac{<>}{<>}<>]], { i(1, '1'), i(2, '2'), i(0) }),
    {
      condition = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local char_before = line:sub(col - 1, col - 1)
        return char_before ~= '{' and tex_utils.in_mathzone()
      end,
    }
  ),

  -- Usefull symbols
  s(
    { trig = '\\ra', show_condition = tex_utils.in_mathzone, wordTrig = false, snippetType = 'autosnippet' },
    { t '\\rightarrow' },
    { condition = tex_utils.in_mathzone }
  ),
}
