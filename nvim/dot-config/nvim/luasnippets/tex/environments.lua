local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local helpers = require 'helper_functions.luasnip'
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils

return {
  s(
    { trig = 'be', desc = 'Start a tex environment.' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
]],
      { i(1), i(0), rep(1) }
    )
  ),
  s(
    { trig = 'align', desc = 'Start align environment.' },
    fmta(
      [[
        \begin{align}
            <>
        \end{align}
]],
      { i(0) }
    )
  ),
  s({ trig = 'mm', desc = 'Start an inline math environment.' }, fmta([[$<>$ <>]], { i(1), i(0) }), { condition = tex_utils.in_text }),
  s(
    { trig = 'fig', desc = 'Add simple figure' },
    fmta(
      [[
      \begin{figure}[H]
        \centering
        \includegraphics[width=\linewidth]{figures/<>}
        \caption{\raggedright <>}
        \label{fig:<>}
      \end{figure}
      <>
]],
      { i(1, 'path'), i(2), i(3, 'figure_label'), i(0) }
    ),
    { condition = tex_utils.in_text }
  ),
  s(
    { trig = 'codemp', desc = 'Add python codeblock.' },
    fmta(
      [[
        \begin{minted}[mathescape,
               linenos,
               numbersep=5pt,
               autogobble=true,
               frame=lines,
               framesep=2mm]{python}
               <>
        \end{minted}
]],
      { i(0) }
    ),
    { condition = tex_utils.in_text }
  ),

  s(
    'mfig',
    c(1, {

      sn(
        nil,
        fmta(
          [[
      \begin{figure}[H]
        \centering
        \includegraphics[width=\linewidth]{figures/<>}
        \caption{\raggedright <>}
        \label{fig:<>}
      \end{figure}
      <>
]],
          { i(1, 'path'), i(2), i(3, 'figure_label'), i(0) }
        )
      ),

      sn(
        nil,
        fmta(
          [[
\begin{figure}[H]
  \centering
  \begin{subfigure}{0.48\textwidth}[t]
    \centering
    \includegraphics[width=\linewidth]{figures/<>}
    \caption{<>}
  \end{subfigure}

  \begin{subfigure}{0.48\textwidth}[t]
    \centering
    \includegraphics[width=\linewidth]{figures/<>}
    \caption{<>}
  \end{subfigure}

  \caption{<>}
  \label{fig:<>}
\end{figure}
]],
          {
            i(1, 'image1'),
            i(2, 'subcaption1'),
            i(3, 'image2'),
            i(4, 'subcaption2'),
            i(5, 'main caption'),
            i(6, 'label'),
          }
        )
      ),

      sn(
        nil,
        fmta(
          [[
\begin{figure}[H]
  \centering

  \begin{subfigure}{0.32\textwidth}[t]
    \centering
    \includegraphics[width=\linewidth]{figures/<>}
    \caption{<>}
  \end{subfigure}
  \begin{subfigure}{0.32\textwidth}[t]
    \centering
    \includegraphics[width=\linewidth]{figures/<>}
    \caption{<>}
  \end{subfigure}
  \begin{subfigure}{0.32\textwidth}[t]
    \centering
    \includegraphics[width=\linewidth]{figures/<>}
    \caption{<>}
  \end{subfigure}

  \caption{<>}
  \label{fig:<>}
\end{figure}
]],
          {
            i(1, 'image1'),
            i(2, 'subcaption1'),
            i(3, 'image2'),
            i(4, 'subcaption2'),
            i(5, 'image3'),
            i(6, 'subcaption3'),
            i(7, 'main caption'),
            i(8, 'label'),
          }
        )
      ),
    }),
    { condition = tex_utils.in_text }
  ),
}
