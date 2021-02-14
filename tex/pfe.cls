
% indique que çà créé un package latex, indispensable
\NeedsTeXFormat{LaTeX2e}
% indique le nom du package, et la version
\ProvidesClass{pfe}[12/02/2012 classe pour rapports avec grande page de garde type pfe]
% Modifs : mise en page, et utilisation de fichiers auxiliaires pour factoriser un peu

% classe de base, modifiée
\LoadClass[12pt, a4paper, oneside, draft]{article}
  %book, letter, repport [police, format impression, recto(oneside)/ recto-verso(twoside)]
%  ============================== Packages ==========================
% tous les packages utilisés sont définis dans ce fichier
\input{packages.tex}
%  ============================== Paramètrages ==========================
% les paramètres de mise en page sont définis dans ce fichier
\input{parametres.tex}
%*=================== Redéfinition des styles de chapitres ==============
\input{section.tex}

\graphicspath{{images/}{~/Library/texmf/tex/images/}}

%*============================== Page de garde =============================
% Variables de meta informations
\newcommand{\imageleft}[1]{\renewcommand{\givenimageleft}{#1}} % nom de l'image à gauche
\newcommand{\imageright}[1]{\renewcommand{\givenimageright}{#1}}

\newcommand{\givenimageleft}{undef}
\newcommand{\givenimageright}{undef}

\newcommand{\addrentreprise}[1]{\renewcommand{\givenaddrentreprise}{#1}}
\newcommand{\auteurlist}[1]{\renewcommand{\givenauteurlist}{#1}}
\newcommand{\entreprise}[1]{\renewcommand{\givenentreprise}{Effectué chez  #1}}
\newcommand{\filliere}[1]{\renewcommand{\givenfilliere}{#1}}
\newcommand{\periode}[1]{\renewcommand{\givenperiode}{#1}}
\newcommand{\respostage}[1]{\renewcommand{\givenrespostage}{#1}}
\newcommand{\school}[1]{\renewcommand{\givenschool}{#1}}
\newcommand{\schoolbis}[1]{\renewcommand{\givenschoolbis}{#1}}
\newcommand{\soustitre}[1]{\renewcommand{\givensoutitre}{#1}}
\newcommand{\titre}[1]{\renewcommand{\giventitre}{#1}}
\newcommand{\tuteurstage}[1]{\renewcommand{\giventuteurstage}{#1}}
\newcommand{\villeentreprise}[1]{\renewcommand{\givenvilleentreprise}{#1}}

\newcommand{\givenaddrentreprise}{\white{s}}
\newcommand{\givenauteurlist}{\white{s}}
\newcommand{\givenentreprise}{\white{s}}
\newcommand{\givenfilliere}{\white{s}}
\newcommand{\givenperiode}{\white{s}}
\newcommand{\givenrespostage}{\white{s}}
\newcommand{\givenschool}{\white{s}}
\newcommand{\givenschoolbis}{\white{s}}
\newcommand{\givensoutitre}{\white{s}}
\newcommand{\giventitre}{\red{Titre}}
\newcommand{\giventuteurstage}{\white{s}}
\newcommand{\givenvilleentreprise}{\white{s}}

\newcommand{\sethidden}[1]{
    \renewcommand{\hidden}{#1}
    \IfEq{\hidden}{1}{
        \renewcommand{\givenaddrentreprise}{\white{s}}
        \renewcommand{\givenauteurlist}{\white{s}}
        \renewcommand{\givenentreprise}{\white{s}}
        \renewcommand{\givenfilliere}{\white{s}}
        \renewcommand{\givenperiode}{\white{s}}
        \renewcommand{\givenrespostage}{\white{s}}
        \renewcommand{\givenschool}{\white{s}}
        \renewcommand{\givenschoolbis}{\white{s}}
        \renewcommand{\givensoutitre}{\white{s}}
        \renewcommand{\giventitre}{\red{Titre}}
        \renewcommand{\giventuteurstage}{\white{s}}
        \renewcommand{\givenvilleentreprise}{\white{s}}
    }{
        \renewcommand{\givenaddrentreprise}{\red{rue entreprise}}
        \renewcommand{\givenauteurlist}{\red{auteur}}
        \renewcommand{\givenentreprise}{Effectué chez \red{nom entreprise}}
        \renewcommand{\givenfilliere}{\red{fillière}}
        \renewcommand{\givenperiode}{\red{période du stage}}
        \renewcommand{\givenrespostage}{\red{responsable de stage}}
        \renewcommand{\givenschool}{\red{nom école/institution}}
        \renewcommand{\givenschoolbis}{\red{suite nom école} }
        \renewcommand{\givensoutitre}{\red{sous titre / nature du rapport}}
        \renewcommand{\giventuteurstage}{\red{tuteur de stage}}
        \renewcommand{\givenvilleentreprise}{\red{code postal + ville}}
    }
}
\newcommand{\hidden}{0} % 1 si les champs non renseignés sont cachés, 0 si indications en rouge
\sethidden{0}


\newcommand{\booltoc}[1]{\renewcommand{\givenbooltoc}{#1}}
\newcommand{\booltof}[1]{\renewcommand{\givenbooltof}{#1}}
\newcommand{\booltot}[1]{\renewcommand{\givenbooltot}{#1}}

\newcommand{\givenbooltoc}{0}
\newcommand{\givenbooltof}{0}
\newcommand{\givenbooltot}{0}


% Commande de page de garde + indication des différentes sommaires
\newcommand{\maketitlepage}{
    \begin{titlepage}
        %* Logos of school and firm
        \IfEq{\givenimageleft}{undef}{
            \IfEq{\givenimageright}{undef}{}{
                \begin{center}
                    \includegraphics[width=0.5\textwidth]{\givenimageright}\\[.5cm]
                \end{center}
            }
        }
        {
            \IfEq{\givenimageright}{undef}{
                \begin{center}
                    \includegraphics[width=0.5\textwidth]{\givenimageleft}\\[.5cm]
                \end{center}
            }
            {
                \begin{minipage}{0.47\textwidth}
                    \begin{flushleft}
                        \includegraphics[width=0.8\textwidth]{\givenimageleft}
                    \end{flushleft}
                \end{minipage}
                \begin{minipage}{0.47\textwidth}
                    \begin{flushright}
                        \includegraphics[width=0.8\textwidth]{\givenimageright}
                    \end{flushright}
                \end{minipage}\\[.5cm]
            }
        }

        % Textual elements
        \begin{center}
            %School
            {\Large \givenschool \\[.5cm] \givenschoolbis}\\[1.5cm]
            % Sub title (intership)
            \textsc{{\LARGE \givensoutitre}}\\[.5cm]
            % Where was the internship
            {\large \givenentreprise}\\[.2 cm]
            % Duration of the intership
            \givenperiode\\[1cm]
            \rule{\linewidth}{0.2 mm} \\[1 cm]
                { \huge \bfseries \giventitre}\\[.7 cm]
            \rule{\linewidth}{0.2 mm} \\[1 cm]
            % Author
            {\Large \givenauteurlist}\\[.2cm]
            {\large \givenfilliere}\\
        \end{center}
        %Informations entreprise
        \begin{minipage}{0.47\textwidth}
            \begin{flushleft} \large
                \textbf{\givenentreprise}\\
                \givenaddrentreprise\\
                \givenvilleentreprise\\
            \end{flushleft}
        \end{minipage}
        % Informations tuteurs
        \begin{minipage}{0.47\textwidth}
            \begin{flushright}
                \IfEq{\hidden}{1}{}{
                    \textbf{Encadrant} \\
                    \givenrespostage\\
                }
                \IfEq{\hidden}{1}{}{
                    \textbf{Tuteur académique} \\
                    \giventuteurstage\\
                }
            \end{flushright}
        \end{minipage}\\[0.7cm]
        \begin{center} Version du \today \end{center}
    \end{titlepage}
    % \newpage
}

\newcommandx{\settables}{
    \newcommand{\summary}{0}
    \ifthenelse{\givenbooltoc=1}{\tableofcontents \renewcommand{\summary}{1}}{}
    \ifthenelse{\givenbooltof=1}{\listoffigures \renewcommand{\summary}{1}}{}
    \ifthenelse{\givenbooltot=1}{\listoftables \renewcommand{\summary}{1}}{}
    \IfEq{\summary}{1}
    {\newpage}{}
}