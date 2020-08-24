
\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]
 % Font size
\LoadClass[11pt,letterpaper]{article}

% Remove paragraph indentation
\usepackage[parfill]{parskip}
% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array} 
\usepackage{ifthen}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}
% Suppress page numbers
\pagestyle{empty}


%	Heading commands
\def \name#1{\def\@name{#1}} 
\def \@name {} 

\def \addressSep {$\diamond$} 

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% print address is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% print name is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% PRINT THE HEADING LINES

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document 
  \printname 
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ 
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{
    \printaddress{\@addressthree}}
}

%	SECTION FORMATTING

% Defines the rSection environment for the large sections within the CV

\newenvironment{rSection}[1]{ 
  \sectionskip
  \MakeUppercase{\bf #1} 
  \sectionlineskip
  \hrule 
  \begin{list}{}{ 
  \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
}

%	WORK EXPERIENCE FORMATTING

\newenvironment{rSubsection}[4]{
 {\bf #1} \hfill {#2} 
 \ifthenelse{\equal{#3}{}}{}{ 
  \\
  {\em #3} \hfill {\em #4} 
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} 
   \itemsep -0.5em \vspace{-0.5em}
  }{
  \end{list}
  \vspace{0.5em} 
}

%  Defins the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} 
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip} 
\def\nameskip{\bigskip} 
\def\sectionskip{\medskip} 
