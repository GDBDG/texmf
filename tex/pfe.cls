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

% \graphicspath{{./images/}{~/Library/texmf/tex/images/}}

%*============================== Page de garde =============================
% Variables de meta informations
\newcommand{\setimageleft}[1]{\renewcommand{\imageleft}{#1}} % nom de l'image à gauche
\newcommand{\setimageright}[1]{\renewcommand{\imageright}{#1}}

\newcommand{\imageleft}{undef}
\newcommand{\imageright}{undef}

\newcommand{\setaddrentreprise}[1]{\renewcommand{\addrentreprise}{#1}}
\newcommand{\setauteurlist}[1]{\renewcommand{\auteurlist}{#1}}
\newcommand{\setentreprise}[1]{\renewcommand{\entreprise}{Effectué chez  #1}}
\newcommand{\setfilliere}[1]{\renewcommand{\filliere}{#1}}
\newcommand{\setperiode}[1]{\renewcommand{\periode}{#1}}
\newcommand{\setrespostage}[1]{\renewcommand{\respostage}{\textbf{Encadrant} \\  #1}}
\newcommand{\setschool}[1]{\renewcommand{\school}{#1}}
\newcommand{\setschoolbis}[1]{\renewcommand{\schoolbis}{#1}}
\newcommand{\setsoustitre}[1]{\renewcommand{\soutitre}{#1}}
\newcommand{\settitre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\settuteurstage}[1]{\renewcommand{\tuteurstage}{\textbf{Tuteur académique} \\ #1}}
\newcommand{\setvilleentreprise}[1]{\renewcommand{\villeentreprise}{#1}}

\newcommand{\addrentreprise}{\white{s}}
\newcommand{\auteurlist}{\white{s}}
\newcommand{\entreprise}{\white{s}}
\newcommand{\filliere}{\white{s}}
\newcommand{\periode}{\white{s}}
\newcommand{\respostage}{\white{s}}
\newcommand{\school}{\white{s}}
\newcommand{\schoolbis}{\white{s}}
\newcommand{\soutitre}{\white{s}}
\newcommand{\titre}{\red{Titre}}
\newcommand{\tuteurstage}{\white{s}}
\newcommand{\villeentreprise}{\white{s}}

\newcommand{\hidden}{0} % 1 si les champs non renseignés sont cachés, 0 si indications en rouge
\newcommand{\sethidden}[1]{
    \renewcommand{\hidden}{#1}
    \IfEq{\hidden}{1}{
        \renewcommand{\addrentreprise}{\white{s}}
        \renewcommand{\auteurlist}{\white{s}}
        \renewcommand{\entreprise}{\white{s}}
        \renewcommand{\filliere}{\white{s}}
        \renewcommand{\periode}{\white{s}}
        \renewcommand{\respostage}{\white{s}}
        \renewcommand{\school}{\white{s}}
        \renewcommand{\schoolbis}{\white{s}}
        \renewcommand{\soutitre}{\white{s}}
        \renewcommand{\titre}{\red{Titre}}
        \renewcommand{\tuteurstage}{\white{s}}
        \renewcommand{\villeentreprise}{\white{s}}
    }{
        \renewcommand{\addrentreprise}{\red{rue entreprise}}
        \renewcommand{\auteurlist}{\red{auteur}}
        \renewcommand{\entreprise}{Effectué chez \red{nom entreprise}}
        \renewcommand{\filliere}{\red{fillière}}
        \renewcommand{\periode}{\red{période du stage}}
        \renewcommand{\respostage}{ \textbf{Encadrant} \\ \red{responsable de stage}}
        \renewcommand{\school}{\red{nom école/institution}}
        \renewcommand{\schoolbis}{\red{suite nom école} }
        \renewcommand{\soutitre}{\red{sous titre / nature du rapport}}
        \renewcommand{\tuteurstage}{\textbf{Tuteur académique} \\ \red{tuteur de stage}}
        \renewcommand{\villeentreprise}{\red{code postal + ville}}
    }
}
\sethidden{0}


\newcommand{\setbooltoc}[1]{\renewcommand{\booltoc}{#1}}
\newcommand{\setbooltof}[1]{\renewcommand{\booltof}{#1}}
\newcommand{\setbooltot}[1]{\renewcommand{\booltot}{#1}}
\newcommand{\setbooltol}[1]{\renewcommand{\booltol}{#1}}

\newcommand{\booltoc}{0}
\newcommand{\booltof}{0}
\newcommand{\booltot}{0}
\newcommand{\booltol}{0}


% Commande de page de garde + indication des différentes sommaires
\newcommand{\maketitlepage}{
    \begin{titlepage}
        %* Logos of school and firm
        \IfEq{\imageleft}{undef}{
            \IfEq{\imageright}{undef}{}{
                \begin{center}
                    \includegraphics[width=0.5\textwidth]{\imageright}\\[.5cm]
                \end{center}
            }
        }
        {
            \IfEq{\imageright}{undef}{
                \begin{center}
                    \includegraphics[width=0.5\textwidth]{\imageleft}\\[.5cm]
                \end{center}
            }
            {
                \begin{minipage}{0.47\textwidth}
                    \begin{flushleft}
                        \includegraphics[width=0.8\textwidth]{\imageleft}
                    \end{flushleft}
                \end{minipage}
                \begin{minipage}{0.47\textwidth}
                    \begin{flushright}
                        \includegraphics[width=0.8\textwidth]{\imageright}
                    \end{flushright}
                \end{minipage}\\[.5cm]
            }
        }

        % Textual elements
        \begin{center}
            %School
            {\Large \school \\[.5cm] \schoolbis}\\[1.5cm]
            % Sub title (intership)
            \textsc{{\LARGE \soutitre}}\\[.5cm]
            % Where was the internship
            {\large \entreprise}\\[.2 cm]
            % Duration of the intership
            \periode\\[1cm]
            \rule{\linewidth}{0.2 mm} \\[1 cm]
                { \huge \bfseries \titre}\\[.7 cm]
            \rule{\linewidth}{0.2 mm} \\[1 cm]
            % Author
            {\Large \auteurlist}\\[.2cm]
            {\large \filliere}\\
        \end{center}
        % %Informations entreprise
        \begin{minipage}{0.47\textwidth}
            \begin{flushleft} \large
                \textbf{\entreprise}\\
                \addrentreprise\\
                \villeentreprise\\
            \end{flushleft}
        \end{minipage}
        % % Informations tuteurs
        \begin{minipage}{0.47\textwidth}
            \begin{flushright}
                \respostage\\
                \tuteurstage\\
            \end{flushright}
        \end{minipage}\\[0.7cm]
        \begin{center} Version du \today \end{center}
    \end{titlepage}
    \setDescriptionRapport{Rapport en cour d'élaboration. Toutes les annotations en \textcolor{Description}{gris} seront supprimées pour la version finale. 

    Remarque : il est facile de les supprimer, il suffit de compiler le document sans l'option "dev".}
    \showDescriptionRapport
}

\newcommandx{\settables}{
    \newcommand{\summary}{0}
    \ifthenelse{\booltoc=1}{\tableofcontents \renewcommand{\summary}{1}}{}
    \ifthenelse{\booltof=1}{\listoffigures \renewcommand{\summary}{1}}{}
    \ifthenelse{\booltot=1}{\listoftables \renewcommand{\summary}{1}}{}
    \ifthenelse{\booltol=1}{\lstlistoflistings \renewcommand{\summary}{1}}{}
    \IfEq{\summary}{1}
    {\newpage}{}
}

%================================== Autres fonctions utiles ============================
\newcommandx{\userData}[5][1=Prénom ,2=nom, 3=adresse, 4=tel, 5=mail, usedefault]{
    \begin{tabular}{cc}
        \textbf{Nom} & #1 \textsc{#2} \\
        \textbf{Adresse} & #3\\
        \textbf{Téléphone} & #4 \\
        \textbf{Email} & #5 \\
    \end{tabular}

}

%https://tex.stackexchange.com/questions/173025/glossary-not-printed-issue-on-sharelatex