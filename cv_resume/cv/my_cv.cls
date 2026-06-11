\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[2020-07-27 Tony CV class]
\LoadClass[10pt]{article}

\usepackage{geometry}
\geometry{
	top=0.5in,
	bottom=1in,
	left=0.5in,
	right=0.5in
}
\usepackage{graphicx}
\graphicspath{{pubfigures}}

\usepackage{titlesec}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{bibentry}
\usepackage[numbers, nonamebreak, sort]{natbib}
\usepackage{etaremune}
\usepackage{longtable}
\usepackage{hanging}
\usepackage{array}
\urlstyle{same}




\colorlet{urlcolor}{blue!40!black}


\hypersetup{colorlinks=true,
			urlcolor=urlcolor}

\titleformat{\section}
{\Large\scshape\raggedright} 
{}{0em}                     
{}                          
%[\titlerule]        

\titleformat{\subsection}
{\large\raggedright}
{}{0em}
{}

\newcommand{\datedsection}[2]{%
	\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}%
}

\newcommand{\name}[1]{%
	{\textbf{\Large{#1}}}
}

\newcommand\contact[4]{%
	\centerline{%
		\makebox[0pt][c]{%
			#1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3
			\ #4 \ \ %
		}%
	}%
}

\newcommand{\cvsection}[1]{%
	{\large\scshape\raggedright{#1}} 
}

\providecommand{\tightlist}{%
	\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}%
}

\newcolumntype{g}[1]{%
	>{\raggedright\arraybackslash}%
	p{#1}%
}

\newcommand{\pubgraphic}[1]{%

	\begin{minipage}{0.15\textwidth}
		\includegraphics[width=\textwidth]{#1}
	\end{minipage}
}

\newcommand{\pubentry}[2]{%
	\begin{minipage}{0.725\textwidth}
		\textbf{#1}. \bibentry{#2}
	\end{minipage}
	\\ \\
}


