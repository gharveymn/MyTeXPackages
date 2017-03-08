\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{geneassignment}[2016/12/01 v0.1 Gene's class for making assignments]

% Passes and class options to the underlying article class
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Remove the numbers from all the headings (\section, \subsection, etc.)
\setcounter{secnumdepth}{-1}

% To modify the heading styles more thoroughly use the titlesec package
%\RequirePackage{titlesec}

% Adjust the title page design
% NOTE: This is the default LaTeX title page -- free free to make it look like whatever you want.
% TODO: Add company name and logo somewhere in here.
\newcommand{\maketitlepage}{%
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null%
  \end{titlepage}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small%
  \let\footnoterule\relax%
  \let \footnote \thanks%
  \maketitlepage%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%from latex.ltx
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M \colorbox[rgb]{0,0,0}{\kern0.15em\textcolor{white}{#5}\kern0.15em}\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}

%from article.cls
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {\z@}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}

\endinput