\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sit}[2026/04/15 LaTeX template for SIT2026]

\ProcessOptions\relax

\LoadClass[%
  article, oneside, paper=a4paper,%
  fontsize=10pt, jafontsize=10pt, baselineskip=1.52zh,%
  head_space=28mm, line_length=50zw, number_of_lines=46, %gutter=20mm,%
]{jlreq}%


\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{luatexja-fontspec}
%\RequirePackage[hiragino-pron]{luatexja-preset}
%\setmainfont[Ligatures=TeX]{Times New Roman}
%\setmainjfont[BoldFont=HiraKakuProN-W6]{HiraMinProN-W3}

\frenchspacing
\ltjsetparameter{kanjiskip=0\zw plus 0.15\zw minus 0.05\zw}
\ltjsetparameter{xkanjiskip=0.25\zw plus 0.15\zw minus 0.05\zw}

\RenewBlockHeading{section}{1}{%
  font={\normalfont\bfseries},
  before_space=18pt,
  after_space=12pt,
  align=center,
  label_format={\thesection.},
  format={#1#2}
}

\RenewBlockHeading{subsection}{2}{%
  font={\normalfont\bfseries},
  before_space=18pt,
  after_space=5pt,
  align=left,
  label_format={\thesection・\arabic{subsection}},
  format={\indent#1#2}
}

\SetBlockHeadingSpaces{%
  {_section{before_space=18pt,after_space=12pt},_subsection{before_space=0pt,after_space=5pt}}%
}

\RequirePackage{jlreq-complements}
\jlreqsetup{%
  itemization_beforeafter_space={2pt},
  caption_font=\normalfont,
  caption_label_font=\normalfont,
  caption_align=center,
  thebibliography_heading=\section*{文　　　献},
}
\renewcommand{\figurename}{Fig.~}
\renewcommand{\tablename}{Table~}
\addtolength{\textfloatsep}{10pt}

\RequirePackage{fancyhdr}
\fancypagestyle{sitstyle}{%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.5pt}
  \setlength{\headheight}{15.8pt}
  \fancyhead[LC]{}%
  \fancyhead[R]{%
    \begin{tikzpicture}[remember picture, overlay]%
      \node[anchor=north east, font=\footnotesize] at ([xshift=-13mm, yshift=-15mm]current page.north east) {Copyright\textcircled{c}2026　一般社団法人　日本機械学会};
      \node[anchor=north east, font=\footnotesize] at ([xshift=-13mm, yshift=-19mm]current page.north east) {\textcircled{c}2026 Information Processing Society of Japan};%
    \end{tikzpicture}%
  }%
  \fancyfoot[CR]{}
  \fancyfoot[L]{%
    \begin{tikzpicture}[remember picture, overlay]%
      \node[anchor=south west, font=\footnotesize] at ([xshift=20mm, yshift=9.65mm]current page.south west) {Sports and technology 2026 (2026.7.9--7.10, 東京ビッグサイト)};%
    \end{tikzpicture}%
  }%
}%
\pagestyle{sitstyle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage[hidelinks,colorlinks=false,linkcolor=.]{hyperref}

\makeatletter

% Paper ID
\newcommand{\@paperid}{XXXXX}
\newcommand{\paperid}[1]{\renewcommand{\@paperid}{#1}}

% Japanese title
\renewcommand{\@title}{No title}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
% English title
\newcommand{\@etitle}{No English tittle}
\newcommand{\etitle}[1]{\renewcommand{\@etitle}{#1}}

% Japanese auithor list$
\renewcommand{\@author}{著者名 非公表}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
% English author list
\newcommand{\@eauthor}{Anonymous authors}
\newcommand{\eauthor}[1]{\renewcommand{\@eauthor}{#1}}

% Affiliartion
\newcommand{\@affiliation}{所属 非公開}
\newcommand{\affiliation}[1]{\renewcommand{\@affiliation}{#1}}

% Abstract
\newcommand{\@abstract}{No abstract.}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}

% Keywords
\newcommand{\@keywords}{Nothing}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% title block
\renewcommand{\maketitle}{%
\hypersetup{%
  pdftitle={\@title},%
  pdfsubject={\@abstract},%
  pdfkeywords={\@keywords}%
}

\noindent {\LARGE U\@paperid}
\begin{center}
    {\fontsize{14pt}{14pt}\selectfont \@title}\par
    \vspace{12pt}
    {\fontsize{12pt}{12pt}\selectfont \@etitle}\par
    \vspace{12pt}
    {\fontsize{12pt}{12pt}\selectfont \@author}\par
    \vspace{3pt}
    \begin{spacing}{0.9}
    {\fontsize{12pt}{12pt}\selectfont \@eauthor}\par
    \end{spacing}
    \vspace{3pt}
    {\fontsize{10pt}{12pt}\selectfont \@affiliation}
\end{center}
\vspace{14pt}
\hspace{6mm}\@abstract\par
\vspace{10pt}
\noindent \textit{Key Words}: \@keywords\par
\vspace{20pt}
}
\makeatother

% Helper commands for authors list
\newcommand{\presenter}[1]{○ #1}
\newcommand{\af}[1]{${}^{*#1}$}
\newcommand{\afdef}[3]{\af{#1} #2 #3\par}

% math environment configuration
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
\setlength{\mathindent}{20pt}
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize%
    \setlength\abovedisplayskip{10pt}%
    \setlength\belowdisplayskip{20pt}%
    \setlength\abovedisplayshortskip{-14pt}%
    \setlength\belowdisplayshortskip{4pt}%
    \setlength\jot{8pt}
}

% bibliography
\RequirePackage[semicolon,sort]{natbib}
\makeatletter
  \renewcommand{\@biblabel}[1]{(#1)~}
\makeatother
\makeatletter
\AtBeginDocument{%
  \let\@biblabel\NAT@biblabelnum
  \let\@bibsetup\NAT@bibsetnum}
\makeatother
\renewcommand{\cite}{~\citep}