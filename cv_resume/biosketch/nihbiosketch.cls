%% nihbiosketch.cls
%% NIH Biographical Sketch (Common Form + Supplement), format v.2026-1
%%
%% Originally based on nihbiosketch.cls, Copyright 2015 Paul M. Magwene,
%% distributed under the LaTeX Project Public License v1.3c or later
%% (http://www.latex-project.org/lppl.txt). Rewritten to match the
%% SciENcv-generated NIH Biographical Sketch Common Form / Supplement layout.
%%
%% Requires XeLaTeX or LuaLaTeX (uses fontspec).
%%
%% Usage overview
%% --------------
%%   \name{Last, First Middle}
%%   \pid{https://orcid.org/0000-0000-0000-0000}
%%   \position{Position Title}
%%   \organization{Department, Institution, City, State, Country}
%%
%%   \begin{document}
%%   \commonform                     % Common Form header block
%%   \begin{preparation}             % Professional Preparation table
%%     Institution & Degree & MM/YYYY & MM/YYYY & Field \\
%%   \end{preparation}
%%   \bsheading{Appointments and Positions}
%%   \begin{datelist} 2022 - present & Text \\ \end{datelist}
%%   \bsheading{Products}
%%   \bssubheading{Products Closely Related to the Proposed Project}
%%   \begin{products} \item ... \end{products}
%%   \bssubheading{Other Significant Products Highlighting Contributions to Science}
%%   \begin{products} \item ... \end{products}
%%   \certification
%%
%%   \supplement                     % new page + Supplement header block
%%   \bsheading*{Personal Statement} ...
%%   \bsheading*{Honors}
%%   \begin{datelist} 2023 & Text \\ \end{datelist}
%%   \bsheading*{Contributions to Science}
%%   \begin{contributions} \contribution{Title} Text ... \end{contributions}
%%   \certification
%%
%% \bsheading{...} is bold + underlined (Common Form style);
%% \bsheading*{...} is bold only (Supplement style).
%% \certifiedby{...} optionally adds the "Certified by ..." line.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nihbiosketch}[2026/11/12 NIH Biosketch Class (v.2026-1 format)]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt,letterpaper]{article}

%------------------------------------------------------------------------------
% Packages

\RequirePackage[letterpaper,left=0.7in,right=0.7in,top=0.75in,bottom=0.9in,
                footskip=0.45in]{geometry}
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{Times New Roman}
\newfontfamily\footerfont{Arial}
\RequirePackage{microtype}

\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}

\PassOptionsToPackage{urlcolor=blue,colorlinks=true,linkcolor=black,breaklinks=true}{hyperref}
\RequirePackage{hyperref}
\urlstyle{same}

%------------------------------------------------------------------------------
% Base layout

\setlength\parindent{0pt}
\setlength\parskip{0.6\baselineskip}
\renewcommand{\arraystretch}{1.0}

% Footer: "NIH Biographical Sketch v.2026-1" in a sans face, no page numbers
\newcommand{\@bsversion}{NIH Biographical Sketch v.2026-1}
\fancypagestyle{biosketch}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyfoot[L]{\footerfont\small\@bsversion}}
\pagestyle{biosketch}
\AtBeginDocument{\thispagestyle{biosketch}}

%------------------------------------------------------------------------------
% Personal information

\newcommand{\@name}{}
\newcommand{\@pid}{}
\newcommand{\@position}{}
\newcommand{\@organization}{}
\newcommand{\@certifiedby}{}

\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\pid}[1]{\renewcommand{\@pid}{#1}}
\newcommand{\position}[1]{\renewcommand{\@position}{#1}}
\newcommand{\organization}[1]{\renewcommand{\@organization}{#1}}
\newcommand{\certifiedby}[1]{\renewcommand{\@certifiedby}{#1}}

% OMB control lines (override if the form is revised)
\newcommand{\commonformomb}{OMB No. 3145-0279 (Expiration Date 10/31/2026)}
\newcommand{\supplementomb}{OMB No. 0925-0001 (Expiration Date 12/31/2027) and No. 0925-0002 (Expiration Date 11/30/2027)}

%------------------------------------------------------------------------------
% Header blocks

\newcommand{\bsrule}{\par\vspace{-0.2\baselineskip}\noindent\rule{\textwidth}{0.6pt}\par\vspace{-0.4\baselineskip}}

\newcommand{\@infofield}[2]{%
  \bsrule
  \noindent #1: #2\par}

\newcommand{\@pidlink}{%
  \ifx\@pid\@empty\else\href{\@pid}{\@pid}\fi}

% #1 = OMB line, #2 = form title
\newcommand{\@bsheader}[2]{%
  {\setlength\parskip{0pt}%
   \noindent\hfill{\footnotesize #1}\par
   \vspace{2pt}%
   \noindent\rule{\textwidth}{1pt}\par
   \vspace{1pt}%
   {\centering\large\bfseries #2\par}%
   \vspace{1pt}%
   \noindent Name: \@name\par
   \setlength\parskip{0.5\baselineskip}%
   \@infofield{Persistent Identifier (PID) of the Senior/Key Person}{\@pidlink}
   \@infofield{Position Title}{\@position}
   \@infofield{Organization and Location}{\@organization}
   \bsrule}%
  \vspace{0.3\baselineskip}}

\newcommand{\commonform}{\@bsheader{\commonformomb}{NIH BIOGRAPHICAL SKETCH COMMON FORM}}
\newcommand{\supplement}{\clearpage\@bsheader{\supplementomb}{NIH BIOGRAPHICAL SKETCH SUPPLEMENT}}

%------------------------------------------------------------------------------
% Headings

% \bsheading{X}  -> bold, underlined   (Common Form sections)
% \bsheading*{X} -> bold                (Supplement sections)
\newcommand{\bsheading}{\@ifstar\@bsheadingstar\@bsheadingplain}
\newcommand{\@bsheadingplain}[1]{%
  \par\addvspace{0.6\baselineskip}%
  \noindent{\bfseries\uline{#1}}\par\nobreak\vspace{-\parskip}\@afterheading}
\newcommand{\@bsheadingstar}[1]{%
  \par\addvspace{0.6\baselineskip}%
  \noindent{\bfseries #1}\par\nobreak\@afterheading}

% Italic, underlined sub-heading (e.g., Products categories)
\newcommand{\bssubheading}[1]{%
  \par\noindent{\itshape\uline{#1}}\par\nobreak\vspace{-\parskip}\@afterheading}

%------------------------------------------------------------------------------
% Professional Preparation table
%   Columns: Institution and Location | Degree | Start Date | Completion Date | Field of Study

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}

\newenvironment{preparation}
{\par\noindent PROFESSIONAL PREPARATION\par\vspace{-0.5\parskip}%
 \renewcommand{\arraystretch}{1.15}%
 \noindent\tabularx{\textwidth}{@{}Y|C{0.95in}|C{0.62in}|C{0.95in}|C{1.6in}@{}}
 \hline
 INSTITUTION AND LOCATION & DEGREE & Start Date & Completion Date & FIELD OF STUDY \\
 \hline\rule{0pt}{14pt}}
{\endtabularx\par}

%------------------------------------------------------------------------------
% Date / description lists (Appointments and Positions, Honors)

\newenvironment{datelist}
{\setlength\LTpre{0.6\baselineskip}\setlength\LTpost{0pt}%
 \renewcommand{\arraystretch}{1.0}%
 \setlength\LTleft{0pt}%
 \longtable{@{}p{1.15in}@{}p{\dimexpr\textwidth-1.15in\relax}@{}}}
{\endlongtable\vspace{-\parskip}}

%------------------------------------------------------------------------------
% Products (numbered citations)

\newenvironment{products}
{\enumerate[label=\arabic*.,leftmargin=0.45in,labelsep=0.5em,
            topsep=0pt,itemsep=3pt,parsep=0pt,partopsep=0pt]}
{\endenumerate}

%------------------------------------------------------------------------------
% Contributions to Science

\newenvironment{contributions}
{\enumerate[label=\arabic*.,leftmargin=0.45in,labelsep=0.5em,
            topsep=0pt,itemsep=0.6\baselineskip,parsep=0pt,partopsep=0pt]}
{\endenumerate}
\newcommand{\contribution}[1]{\item\textbf{#1}\par\nobreak}

%------------------------------------------------------------------------------
% Certification block

\newcommand{\certification}{%
  \par\addvspace{0.6\baselineskip}%
  \noindent\textbf{Certification:}\par
  I certify that the information provided is current, accurate, and complete.
  This includes, but is not limited to, information related to current,
  pending, and other support (both foreign and domestic) as defined in
  42 U.S.C. \S\ 6605.

  In accordance with Section 10632 of the CHIPS and Science Act of 2022
  (42 U.S.C. \S\ 19232), each individual identified as a senior/key person
  must certify that they are not a party to a malign foreign talent
  recruitment program.

  Research Security Training Requirement for Federal Award Personnel: In
  accordance with Section 10634 of the CHIPS and Science Act of 2022
  (42 U.S.C. \S\ 19234), each individual identified as a senior/key person
  must certify that they have completed the requisite research security
  training that meets the requirements specified in Item 2 of Important
  Notice No. 149 within 12 months prior to proposal submission.

  Misrepresentations and/or omissions may be subject to prosecution and
  liability pursuant to, but not limited to, 18 U.S.C. \S\S 287, 1001, 1031
  and 31 U.S.C. \S\S 3729--3733 and 3802.
  \ifx\@certifiedby\@empty\else\par\@certifiedby\fi
  \par}

%------------------------------------------------------------------------------

\pagenumbering{gobble}
