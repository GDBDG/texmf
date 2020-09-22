
% indique que çà créé un package latex, indispensable
\NeedsTeXFormat{LaTeX2e}
% indique le nom du package, et la version
\ProvidesClass{template}[16/05/2020 V2 du cls]
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

