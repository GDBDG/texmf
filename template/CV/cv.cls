%? utiliser 
%https://www.overleaf.com/gallery/tagged/cv/page/14
%https://www.overleaf.com/gallery/tagged/cv/page/39
%https://www.overleaf.com/gallery/tagged/cv/page/52
\ProvidesClass{cv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\input{packagesCV.tex}
\def\BB{$\bullet$}

\newbool{icon}
\DeclareOption{icon}{%
 \booltrue{icon}
}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\ifbool{icon}{\RequirePackage{fontawesome}}{}


\usetikzlibrary{calc}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}
\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi


\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%


\newcommand{\profilesection}[2]{{\noindent\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt} \vspace{1pt}}}

% Commandes de la sections informations générales (première à gauche)
\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvnationnality}[1]{\renewcommand{\givencvnationnality}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\givencvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}}
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}
\newcommand{\cvadress}[1]{\renewcommand{\givenadress}{#1}}
\newcommand{\cvpermisB}[1]{\renewcommand{\givenpermisB}{#1}}
\newcommand{\cvlangues}[1]{\renewcommand{\givencvlangue}{#1}}
% Valeurs par défaut
% TODO (refaire çà proprement)
\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givencvdate}{}
\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givencvnationnality}{}
\newcommand{\givenaboutme}{}
\newcommand{\givenprofilepic}{}
\newcommand{\givencvsite}{}
\newcommand{\givencvjobtitle}{}
\newcommand{\givenadress}{}
\newcommand{\givenpermisB}{false}
\newcommand{\givencvlangue}{}

\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,minimum size=2.1em,fill=mainblue,mainblue,text=white, label={center:\textcolor{white}{#1}}] (char) {};}}

% \newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw, minimum size=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcommand*\round[2]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm,
    text height=3.6mm,  fill=#2,#2,text=white](char){#1} ;}

\newcommand\skills[1]{

\renewcommand{\givenskill}{
\noindent
\begin{tikzpicture}
\foreach [count=\i] \x/\y in {#1}
{
  \draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
  \draw[fill=white,mainblue](0,-\i) rectangle (1.2*\y,-\i+0.4);
  \node [above right ] at (0,-\i+0.4) {\x};
  \foreach \z in {0,1,2,...,10}
  {
    \coordinate (A\z) at ($(0,-\i)+(1.2*\z*0.5cm,0)$) {};
    \ifodd\z
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
    \else
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
    \fi
  }
}
\end{tikzpicture}
}
}
\newcommand{\givenskill}{}

\newcommand\skillstext[1]{ 

\renewcommand{\giventextskill}{
\begin{flushleft}
\noindent
\foreach [count=\i] \x/\y in {#1}
{ 
\x$ \star $\y
}
\end{flushleft}
}
}


\newcommand{\giventextskill}{}

\newcommand{\makeprofile}
{
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
\end{tikzpicture}

\begin{textblock}{6}(0.5, 0.2)
\begin{flushleft}
\hspace{13pt}



\ifthenelse{\equal{\givenprofilepic}{}}{}{\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
    \clip (600/2, 567/2) circle (567/2);
        \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (-60,0) {\includegraphics[width=6.2cm]{\givenprofilepic}};
\end{tikzpicture}}

{\fontsize{17}{17}\selectfont\color{mainblue}\givencvname}

\begin{flushright}
{\Large\color{black!80}\givencvjobtitle}
\end{flushright}
\renewcommand{\arraystretch}{2}
\setcellgapes{20pt}
\begin{tabular}{p{0.5cm} @{\hskip 0.6cm}p{5cm}}
\ifthenelse{\equal{\givencvdate}{}}{}{{\large\icon{\faBirthdayCake}} & \givencvdate\\}
\ifthenelse{\equal{\givencvnationnality}{}}{}{{\large\icon{\faGlobe}} & \givencvnationnality\\}
\ifthenelse{\equal{\givennumberphone}{}}{}{{\large\icon{\faPhone}} & \givennumberphone\\}
\ifthenelse{\equal{\givencvsite}{}}{}{{\large\icon{\Mundus}} & \href{\givencvsite}{\textcolor{cerulean}\givencvsite}\\}
\ifthenelse{\equal{\givencvmail}{}}{}{{\large\icon{\faEnvelopeO}} & \href{mailto:\givencvmail}{\givencvmail}\\}
\ifthenelse{\equal{\givenadress}{}}{}{{\large\icon{\faMapMarker}} & \givenadress\\}
& 38000, Grenoble, France\\
\ifthenelse{\equal{\givenpermisB}{false}}{}{{\large\icon{\faCar}}& Permis B\\}
\end{tabular}


\profilesection{Langues}{5cm}
\givencvlangue


\profilesection{Skill}{5cm}
\givenskill
\giventextskill
\noindent
% \scriptsize
% \noindent
% (*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]

\end{flushleft}
\end{textblock}
\vspace{-10pt}
 }




%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
   \round{#1#2#3}{
      \ifcase\value{colorCounter}%
        mainblue\or%
        mainblue\or%
        mainblue\or%
        maingray\else%
        maingray\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par%\vspace{\parskip}
  {%
    \LARGE 
    \color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}


\newcommand{\sectionicon}[2]{
  \par%\vspace{\parskip}
  {%
    \LARGE 
    #1 
    \color{headercolor}%
    \@sectioncolor #2%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

% List de hipster cv
\newcommand{\cvevent}[6]{\raggedleft #1 &\textbf{#2}\newline  \textsc{#3} $\cdot$ {#4 \textcolor{lightgray}{\faMapMarker}}\newline{\color{black!70}\footnotesize #5}\vspace{1.5em} & \raisebox{-0.7\height}{\includegraphics[height=1cm]{#6}}}
\newcommand{\cvprojet}[3]{\raggedleft #1 &\textbf{#2}\newline {\color{black!70}\footnotesize #3}\vspace{1.5em} & }
%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%

% \setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitem}[4]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\}

% \setlength{\tabcolsep}{0pt}
\newenvironment{twentyicon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemicon}[5]{%
 \hspace{3pt}\faicon{#1}\hspace{2pt}#2&\parbox[t]{11.2cm}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize#4}\\%
    #5\vspace{\parsep}%
  }\\}
  
%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%
% \setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
  }\\}

% \setlength{\tabcolsep}{0pt}
\newenvironment{twentyshorticon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshorticon}[3]{%
  \hspace{3pt}\faicon{#1}\hspace{3pt}#2&
      \parbox[t]{11.5cm}{%
    \textbf{#3}%
  }\\}

%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%

\RequirePackage[left=7.3cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
