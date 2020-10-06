%% ****************************************************
%% **     Template modified by Cris P. Using:        **
%% **              University of Malta               **
%% **    LaTeX Template for Thesis/Dissertation/FYP  **
%% **              Dr Jean-Paul Ebejer               **
%% **            jean.p.ebejer@um.edu.mt             **
%% **     "Build something which will outlast you"   **
%% **          (... amongst other things)            **
%% ****************************************************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umCris}[2018/05/01-2020/02/15 v2.0.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[11pt, letterpaper, final]{memoir}

%% **************** Packages (Start) *********************

\RequirePackage[utf8]{inputenc}      % Required for inputting international characters
\RequirePackage[T1]{fontenc}         % Output font encoding for international characters
\RequirePackage{mathpazo}            % Use the Palatino font by default
%\RequirePackage{tgpagella}
\usepackage[spanish, english]{babel}          % Load babel if you're unsure about the default language - mostly to be safe
%\usepackage{hyphen-spanish}
\RequirePackage{xcolor}              % For named colors
\RequirePackage{eso-pic}                 % required to place huge uni logo at the back - on title page
\RequirePackage[pdftex]{graphicx}    % For pictures
\RequirePackage{amssymb}             % At least, for black squares in bullet list
\RequirePackage[pdfusetitle]{hyperref}             % For hyperreferences

\usepackage[final]{pdfpages} %\includepdf[pages=-]{file.pdf}

%\RequirePackage[authoryear,semicolon,sort&compress]{natbib} % for (Ebejer, 2012; Alba, 2013) kind of references; removed 'square' option after viva examination comments
\usepackage[authoryear, round, sort&compress, sectionbib]{natbib}  %
\usepackage{chapterbib} 

\RequirePackage{longtable}           % For very long tables
\RequirePackage{pdflscape}			 % For landscape tables (instead of portrait)

\usepackage[defaultsans]{lato}		 % Sans font to use
\usepackage{acronym}

%% ****************** Packages (End) *********************


%% ************ UM Definitions (Start) *****************

\definecolor{OxfordBlue}{rgb}{0,0.106,0.329}   % Color
\definecolor{UMRed}{rgb}{0.73,0.09,0.19}   % UM Logo Color

% Setup choosen University of Malta crest/logo
\def\logo{{\includegraphics[width=49mm]{images/UNAM1.png}}}

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your supervisor
\def\supervisor#1{\gdef\@supervisor{#1}}
% The name of your co-supervisor
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
% The name of your juries
\def\president#1{\gdef\@president{#1}}
\def\vocala#1{\gdef\@vocala{#1}}
\def\vocalb#1{\gdef\@vocalb{#1}}
\def\vocalc#1{\gdef\@vocalc{#1}}
\def\secretary#1{\gdef\@secretary{#1}}
% The place in which the work was carried
\def\workplace#1{\gdef\@workplace{#1}}
% The name of your department (e.g. Computer Science, Statistics, Biochemistry, AI)
\def\department#1{\gdef\@department{#1}}
% The name of your faculty
\def\faculty#1{\gdef\@faculty{#1}}
% The name of your faculty
\def\subjectcode#1{\gdef\@subjectcode{#1}}
% The tagline
\def\tagline#1{\gdef\@tagline{#1}}
% The document type, e.g. a dissertation or a thesis
\def\doctype#1{\gdef\@doctype{#1}}
\def\authorID#1{\gdef\@authorID{#1}}

%% ************* UM Definitions (End) ******************


%% ************ Document Options (Start) *****************

\OnehalfSpacing                                  % One and a half line spacing

\setlength{\headsep}{0.8cm}                      % Add space between the header and text
%\addtolength{\topmargin}{-1.875in}
\addtolength{\textheight}{1.5in}
\setulmargins{2.8cm}{*}{*}

\nouppercaseheads								 % Don't convert titles to Uppercase
\makepagestyle{umpage}

												 % This travesty is due to a bug in memoir, see https://tex.stackexchange.com/questions/468922/oneside-in-memoir-causing-header-trouble
\makeevenhead{umpage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeoddhead{umpage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeevenfoot{umpage}{}{\thepage}{}  			 % UM pagestyle, put page at bottom
\makeoddfoot{umpage}{}{\thepage}{}
\makeheadfootruleprefix{umpage}{\color{gray}}{}
\makeheadrule{umpage}{\textwidth}{\normalrulethickness}
\makepsmarks{umpage}{%
	\createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
	\createmark{section}{right}{shownumber}{}{. \ }
}


\setlrmarginsandblock{3.2cm}{2cm}{*}            % Set the page margins (for one and two sided docs) 
\checkandfixthelayout                            % Put layout into effect

\graphicspath{{./images/}}                       % Where to look for images (paths) ...
\DeclareGraphicsExtensions{.pdf,.jpeg,.png,.jpg} % Graphics extensions to load

%\chapterstyle{ell} % how to draw the different chapter headings
%Chaptes experimental section
%\usepackage{fourier} % or what ever
%\usepackage[scaled=.92]{helvet}%. Sans serif - Helvetica
\usepackage{color,calc}
\newsavebox{\ChpNumBox}
\definecolor{ChapBlue}{gray}{0.93}%{rgb}{0.00,0.65,0.65}
\makeatletter
\newcommand*{\thickhrulefill}{%
\leavevmode\leaders\hrule height 1\p@ \hfill\hspace{0.3cm}\includegraphics[width=1.5cm]{images/FQ.png} \kern \z@}
\newcommand*\BuildChpNum[2]{%
\begin{tabular}[t]{@{}c@{}}
\makebox[0pt][c]{#1\strut} \\[.5ex]
\colorbox{ChapBlue}{%
\rule[-10em]{0pt}{0pt}%
\rule{1ex}{0pt}\color{black}#2\strut
\rule{1ex}{0pt}}%
\end{tabular}}
\makechapterstyle{BlueBox}{%
\renewcommand{\chapnamefont}{\large\scshape}
%\renewcommand{\chapnumfont}{\Huge\bfseries\scshape}
%\renewcommand{\chaptitlefont}{\raggedright\large\scshape}
\setlength{\beforechapskip}{20pt}
\setlength{\midchapskip}{26pt}
\setlength{\afterchapskip}{40pt}
\renewcommand{\printchaptername}{}
\renewcommand{\chapternamenum}{}
\renewcommand{\printchapternum}{%
\sbox{\ChpNumBox}{%
\BuildChpNum{\chapnamefont\@chapapp}%
{\chapnumfont\thechapter}}}
\renewcommand{\printchapternonum}{%
\sbox{\ChpNumBox}{%
\BuildChpNum{\chapnamefont\vphantom{\@chapapp}}%
{\chapnumfont\hphantom{\thechapter}}}}
\renewcommand{\afterchapternum}{}
\renewcommand{\printchaptertitle}[1]{%
\usebox{\ChpNumBox}\hfill
\parbox[t]{\hsize-\wd\ChpNumBox-1em}{%
\vspace{1\midchapskip}%
\thickhrulefill\par
\chaptitlefont ##1\par}}%
}
\chapterstyle{BlueBox}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand*{\chapnumfont}{\HUGE\bfseries\color{OxfordBlue}}  % Chapter titles should be normal
\renewcommand*{\chaptitlefont}{\raggedright\Huge\bfseries\scshape\color{OxfordBlue}}
\setsecheadstyle{\LARGE\bfseries\color{OxfordBlue}}% Set \section style
\setsubsecheadstyle{\Large\color{OxfordBlue}}% Set \subsection style
\setsubsubsecheadstyle{\large\color{OxfordBlue}}% Set \subsection style
%\setsecnumformat{\csname the#1\endcsname\enskip{\color{gray}\textbar}\enskip}

\newsubfloat{figure} % declares a new subfloat element which allows to use \subbottom commands

\renewcommand{\labelitemi}{\color{OxfordBlue}\scriptsize$\blacksquare$}

% because we are using babel we need this instead of just redefining bibname
\addto{\captionsenglish}{\renewcommand{\bibname}{Referencias}} 
\addto{\captionsenglish}{\renewcommand{\contentsname}{Contenido}}
\addto\captionsenglish{\renewcommand{\chaptername}{Capítulo}}
\addto{\captionsenglish}{\renewcommand{\listfigurename}{Lista de Figuras}}
\addto{\captionsenglish}{\renewcommand{\listtablename}{Lista de Tablas}}
\addto{\captionsenglish}{\renewcommand{\listfigurename}{Lista de figuras}}
\addto\captionsenglish{%
  \renewcommand\appendixname{Anexo}
  \renewcommand\appendixpagename{Anexos}
}
\addto{\captionsenglish}{\renewcommand{\abstractname}{\LARGE\bfseries\sffamily\textcolor{OxfordBlue}{Abstract}}}

\setlength{\bibitemsep}{\onelineskip}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}} % to set array stretch within tables

\hypersetup{%
    colorlinks=false,
%    linkcolor=UMRed,
%    citecolor=UMRed,
%    urlcolor=UMRed,
%    filecolor=magenta, 
    pdfborder={0 0 0},    
}

\feetbelowfloat % we want the footnotes below floats, not wierdly above

\setsecnumdepth{subsubsection}  % three level depth - chapter, section, subsection, subsubsection
\settocdepth{subsubsection}

\renewcommand*{\cftappendixname}{Anexo\space}
\newcommand{\removelinebreaks}[1]{%
	\begingroup\def\\{ }#1\endgroup}

%% ************* Document Options (End) ******************

%% *************** Environments (Start) ******************

%% *** Title Page (Start) ***
% background image
% taken from http://tug.org/pracjourn/2008-1/mori/mori.pdf
\newcommand\AlCentroPagina[1]{%
\AddToShipoutPicture*{\AtPageCenter{%
\makebox(0,-50){\includegraphics[width=0.5\paperwidth]{#1}}}}}

% The front page
\renewcommand{\maketitle}
{\begingroup
\AlCentroPagina{images/UNAMgray.png}
\parbox[b][0.95\textheight][t]{0.23\textwidth}{\raggedleft\logo} %% this 0.95 is important, otherwise page overflows in next page
\hspace*{2ex}
\textcolor{OxfordBlue}{\rule{2pt}{0.95\textheight}}
\hspace*{2ex}
\parbox[b][0.95\textheight][t]{0.8\textwidth}{
    \setlength{\parindent}{0pt}
    %%\fontfamily{pag}\selectfont
    \sffamily
    {\huge\bfseries{\begin{Spacing}{1.15}\textcolor{OxfordBlue}{\@title}\end{Spacing}}}
    \vspace*{2ex}
    {\large\textit{\@tagline}}\\[1in]
    
    {\LARGE\bfseries \textsc{\@author}} \\[1cm]
    {\large Dirigido por: \@supervisor} 
    \@ifundefined{@cosupervisor}{\\[2ex]}{\\[2ex]\large Co-supervised by \@cosupervisor}\\[1cm]
    {\large \@department} \\[1ex]
    {\large \@faculty} \\[1ex]
    {\large Universidad Autónoma Nacional de México} \\
    \vfill
    {\bfseries \@degreedate}\\[\baselineskip]
	\parbox[t]{0.80\linewidth}{\footnotesize\textit{\@doctype\ para optar por el grado de \@degree}.}    
}
\thispagestyle{empty}
\if@openright\cleardoublepage\else\clearpage\fi
\endgroup}
%% *** Title Page (End) ***

\newenvironment{acknowledgements}
{\renewcommand{\abstractname}{\LARGE\bfseries\sffamily\textcolor{OxfordBlue}{Agradecimientos}}\abstract}
{\endabstract\if@openright\cleardoublepage\else\clearpage\fi}

\newenvironment{resumen}
{\renewcommand{\abstractname}{\LARGE\bfseries\sffamily\textcolor{OxfordBlue}{Resumen}}\abstract}
{\endabstract\if@openright\cleardoublepage\else\clearpage\fi}
       
\newenvironment{dedication}
  {\clearpage           % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top 
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
   \textcolor{OxfordBlue}
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
   \if@openright\cleardoublepage\else\clearpage\fi
  }       
       

%%\renewenvironment{abstract}
%%{\begin{alwayssingle} \thispagestyle{empty}
%%\begin{center}
%%\vspace*{0.5cm}
%%{\large \bfseries \textcolor{UMRed}{Abstract}}
%%\end{center}
%%\singlespacing\enlargethispage{\baselineskip}}
%%{\end{alwayssingle}}

%%{\cleardoublepage\newgeometry{right=1.3cm,top=2.4cm,bottom=2cm}\pagestyle{empty}\begin{center}\bfseries\large\textcolor{OxfordBlue}\abstractname\end{center}\normalsize\onehalfspacing\begin{quotation}}{\end{quotation}\restoregeometry\cleardoublepage}


% STATEMENT OF ORIGINALITY
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

%\newenvironment{originality}
%{\clearpage
%\begin{center}
%\vspace*{1.5cm}
%{\Large\bfseries\sffamily\textcolor{UMRed}{Statement of Originality}\par}
%\vspace*{1.5cm}
%{I, the undersigned, declare that this is my own work unless where otherwise acknowledged and referenced. \par}
%\vspace*{1.5cm}
%\renewcommand\arraystretch{1.5}
%\begin{tabular}{ll}
%      {\bfseries Candidate} & \@author \\[15mm]
%      {\bfseries Signed} & \makebox[1.5in]{\hrulefill} \\
%      {\bfseries Date} & \today \\
%\end{tabular}
%\end{center}
%\if@openright\cleardoublepage\else\clearpage\fi}

%% This was updated to the official Statement of Originality (Authentication form)
\newenvironment{originality}
{\clearpage\thispagestyle{empty}
\begin{figure}[h]
	\includegraphics[width=2.5in]{images/unamposgr.jpg}
\end{figure}
\vspace{3mm}
{\noindent\Large\bfseries\sffamily\textcolor{OxfordBlue}{Declaration by Postgraduate Students}}\\ %% FIXME this will have to change if not postgraduate ...

{\setlength{\parindent}{0em}
	
\textbf{(a) Authenticity of Dissertation}\\

\noindent I hereby declare that I am the legitimate author of this Dissertation and that it is my original work.

No portion of this work has been submitted in support of an application for another degree or qualification of this or any other university or institution of higher education.

I hold the University of Malta harmless against any third party claims with regard to copyright violation, breach of confidentiality, defamation and any other third party right infringement.\\

\textbf{(b) Research Code of Practice and Ethics Review Procedures}\\

I declare that I have abided by the University’s Research Ethics Review Procedures.

As a Master’s student, as per Regulation 58 of the General Regulations for University Postgraduate Awards, I accept that should my dissertation be awarded a Grade A, it will be made publicly available on the University of Malta Institutional Repository.}\\[5mm]
%%\newcolumntype{L}{>{\arraybackslash}m{2.5in}}
\bgroup
\def\arraystretch{1.2}%
\begin{tabular}{ll}
{\bfseries Faculty/Institute/Centre/School} & \@faculty \\
{\bfseries Degree} & \@degree \\
{\bfseries Title}  & \removelinebreaks{\@title} \\	
{\bfseries Candidate \@ifundefined{@authorID}{}{(Id.)}} & \@author\ \@ifundefined{@authorID}{}{(\@authorID)} \\[0.7in]	
{\bfseries Signature of Student} & \makebox[2in]{\hrulefill} \\
{\bfseries Date} & \today \\
\end{tabular}\\[1cm]
\egroup
\noindent 08.02.2018
\if@openright\cleardoublepage\else\clearpage\fi}

% COPYRIGHT
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

%\usepackage{setspace}
\newenvironment{copyrightenv}
{\clearpage
	~\vfill
	\thispagestyle{empty}
    \includegraphics[width=2.5in]{images/unamposgr.jpg}\\
	\noindent Propiedad intelectual \textcopyright\the\year\ Universidad Nacional Autónoma de México\\
	\noindent \textsc{www.unam.mx}\\ % URL
	\noindent \textit{Primera edición, 19 de Junio de 2020}\\[2cm] % Printing/edition date
	{\scriptsize\raggedright
	    El formato de la presente tesis se trabajó en el editor \LaTeX\ de \textbf{Overleaf} (\url{https://www.overleaf.com/}) y ha sido inspirado en la plantilla creada por el Prof. Jean-Paul Ebejer de la Universidad de Malta para la presentación de tesis y disertaciones.\\ Las estructuras de las moléculas que se incluyen han sido elaboradas con el paquete \texttt{chemfig} de Christian Tellechea.\\ Los dibujos fueron elaborados en el editor de vectores gráficos de código abierto \textbf{Inkscape} (\url{https://www.inkscape.org/}).\\ Los mapas mentales fueron elaborados en \textbf{Lucidchart} (\url{https://www.lucidchart.com/}).\\[1cm]}
	\if@openright\cleardoublepage\else\clearpage\fi}

\newenvironment{juries}
{\clearpage\thispagestyle{empty}
{\noindent\Large\bfseries\sffamily\textcolor{OxfordBlue}{Jurado Asignado por el Comité Académico}}\\[4ex]
{\begin{tabular}{p{0.1cm}ll}
    &\textbf{PRESIDENTE:} & \@president \\[1.5ex]
    &\textbf{VOCAL:} & \@vocala \\[1.5ex]
    &\textbf{VOCAL:} & \@vocalb \\[1.5ex]
    &\textbf{VOCAL:} & \@vocalc \\[1.5ex]
    &\textbf{SECRETARIO:} & \@secretary\\[1ex]
\end{tabular}}\\[4ex]

\begin{center}
Esta tesis fue desarrollada bajo la dirección del\textbf{\@supervisor},\\en las instalaciones del \@workplace.\\[1ex] Los resultados del presente trabajo se publicaron en el artículo\\ \textit{Desalination}, 487 (2020), 114500. \url{https://doi.org/10.1016/j.desal.2020.114500}

\vspace{10ex}
\begin{tabular}{p{0.25cm}cp{0.25cm}}
    \\\hline\\[-3ex]
    &\textbf{Dr. Eduardo Rodriguez de San Miguel Guerrero}&\\
    &\textit{Tutor}\\[10ex]
    \\\hline\\[-3ex]
    &\textbf{Qco. Cristhian Paredes Cardona}\\
    &\textit{Sustentante}
\end{tabular}
\end{center}

\if@openright\cleardoublepage\else\clearpage\fi}

%% **************** Environments (End) *******************  
%R SHIT THAT I LOVE
\usepackage{listings}
\usepackage{xcolor}
\definecolor{llgray}{gray}{0.97}

\lstset{ %
  language=R,                     % the language of the code
  basicstyle=\ttfamily\scriptsize,       % the size of the fonts that are used for the code
  numbers=left,                   % where to put the line-numbers
  numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
  stepnumber=0,                   % the step between two line-numbers. If it's 1, each line
                                  % will be numbered
  numbersep=5pt,                  % how far the line-numbers are from the code
  backgroundcolor=\color{llgray},  % choose the background color. You must add \usepackage{color}
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=single,                   % adds a frame around the code
  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=b,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  title=\lstname,                 % show the filename of files included with \lstinputlisting;
                                  % also try caption instead of title
  keywordstyle=\color{blue},      % keyword style
  commentstyle=\color{dkgreen},   % comment style
  stringstyle=\color{mauve},      % string literal style
  escapeinside={\%*}{*)},         % if you want to add a comment within your code
  morekeywords={*}               % if you want to add more keywords to the set
} 
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{lgray}{gray}{0.94}

\usepackage{fancyvrb}
\usepackage{mdframed}
\newenvironment{response}%
  {\VerbatimEnvironment
    \begin{mdframed}[backgroundcolor=green]
    \begin{Verbatim}}
  {\end{Verbatim}%
    \end{mdframed}}