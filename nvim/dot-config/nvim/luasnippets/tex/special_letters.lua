local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
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
  s({ trig = ';n', snippetType = 'autosnippet' }, { t '\\nu' }),
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
  s({ trig = ';L', snippetType = 'autosnippet' }, { t '\\Lambda' }),
  s({ trig = ';M', snippetType = 'autosnippet' }, { t '\\Mu' }),
  s({ trig = ';N', snippetType = 'autosnippet' }, { t '\\Nu' }),
  s({ trig = ';X', snippetType = 'autosnippet' }, { t '\\Xi' }),
  s({ trig = ';Ps', snippetType = 'autosnippet' }, { t '\\Psi' }),
  s({ trig = ';Pi', snippetType = 'autosnippet' }, { t '\\Pi' }),
  s({ trig = ';R', snippetType = 'autosnippet' }, { t '\\Rho' }),
  s({ trig = ';U', snippetType = 'autosnippet' }, { t '\\Upsilon' }),
  s({ trig = ';C', snippetType = 'autosnippet' }, { t '\\Chi' }),
  s({ trig = ';O', snippetType = 'autosnippet' }, { t '\\Omega' }),

  -- Derivatives
  s({ trig = '^prime', show_condition = tex_utils.in_mathzone, wordTrig = false }, { t '^{\\prime}' }),
  s({ trig = '^pprime', show_condition = tex_utils.in_mathzone, wordTrig = false }, { t '^{\\prime\\prime}' }),
  s({ trig = '^ppprime', show_condition = tex_utils.in_mathzone, wordTrig = false }, { t '^{\\prime\\prime\\prime}' }),
  s({ trig = '^pppprime', show_condition = tex_utils.in_mathzone, wordTrig = false }, { t '^{\\prime\\prime\\prime\\prime}' }),

  -- Subscript superscript
  s({ trig = '_', show_condition = tex_utils.in_mathzone, wordTrig = false }, fmta([[_{<>}<>]], { i(1), i(0) })),
  s({ trig = '^', show_condition = tex_utils.in_mathzone, wordTrig = false }, fmta([[^{<>}<>]], { i(1), i(0) })),
}
