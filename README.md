# texmf
***

## Introduction

The ```texmf```directory must be in your ```~\Library\```. It contains a ```tex```directory, tah contains packages that you create, and you want available for all your LaTeX projects. This texmf contains an easy document template to use for article. This project contains also a ```template```directory, it's simply a template of LaTeX file, ot complete.
***
## The options for the class.
This document is set to have the following article options : 
* 11pt : the size of the police
* a4paper : the format of impression
* oneside : format of impression
* draft : draft mode (Setting the draft option will speed up typesetting, because figures are not loaded, just indicated by a frame. LaTeX will also display hyphenation (Overfull hbox warning) and justification problems with a small black square. Delete the draft option or replace it with final in the final document version.)

If you need to change this options, you can, in the ```tex/template.cls``` file.

It provide several options (for now, change only the appearance of the sections title):
* ```colorised``` : add colors to the title (if not, the titles remains black, like the rest of the document)
* ```sobre``` and ```devie``` : two appearances for the titles (don't use both). (some problems, with the devie option, I recommand the sobre option). It will work without option, but I recommand to use one.

***
## The package header.sty
This package provide a few commands, necessary in order to set a document correctly. 
* ```\auteur{first name}{last name}``` : equivalent to ```first name \textsc{last name}```. It's defined in ```tex/header.sty```. 
* ```\listAuteurs``` : contains all the authors of the document (must be initialised), the differents authors must be separated only with a ```space```caracter, the ```auteur``` manage the indentation.
* ```\listEncadrants```: same principe as \listAuteurs, but for the supervisor.
* ```\auteurs```: define the author part ine the main page. Take several arguments : 
  * ```#1``` : contains the list of the authors
  * ```#2``` : contains the list of the supervisors
  * ```#3``` : 1 if supervisors, 0 else (default 0)
  * ```#4``` : 1 if only 1 author, 0 else (default 0)
  * ```#5``` : 1 if full page, 0 else (default 0)
* ```\enteteAuteurs``` : contains \autheurs data, cf the template, should be use only if there are supersivors, else use ```\listAuteurs``` instead.
* ```\header```: define the header for all the pages.
  * ```#1``` : image left below (logo of your school/compagny), optional (defalut value defined in ```tex/header.sty```. )
  * ```#2``` : the middle title, CAN'T stay empty, or leads to error : ```! LaTeX Error: There's no line here to end.```
  * ```#3``` : last name (first line up right)
  * ```#4``` : fisrt name (second line right).

* ```\miniTitlePage```: provide a short title page, usefull for medium reports. (for a very small the header contains already all the necessary information).
  * ```#1``` : fieled of study
  * ```#2``` : title
  * ```#3``` : subtitle 
  * ```#4``` : authors, defined with  ```\listAuteurs``` or ```\enteteAuteurs```.
  * ```#5``` : 1 if table of content, 0 else. (default 1)
  * ```#6``` : 1 if list of figures, 0 else. (default 0)
  * ```#7``` : 1 if list of tables, 0 else. (default 0)

* ```\titlepage```: provide a full title page (contains a cover image). Should be used only for important documents.
  * ```#1``` : cover image (optional)
  * ```#2``` : fieled of study
  * ```#3``` : title
  * ```#4``` : subtitle 
  * ```#5``` : authors, defined with  ```\listAuteurs``` or ```\enteteAuteurs```.
  * ```#6``` : 1 if table of content, 0 else. (default 1)
  * ```#7``` : 1 if list of figures, 0 else. (default 0)
  * ```#8``` : 1 if list of tables, 0 else. (default 0)

All of these commands are provided by the package ```header.sty```.
***

## The package utilitaire.sty
Contains a lot of usefull commands, like the operators in maths,... You should take a look,, the name are quit explicit, and the commands not very complicated to understand.
However, I signal one that is very usefull for me : 
* the environement ```eq``` : a combination of ```equation*``` and ```aligned```environements, usefull for maths equations.

***
## The cls part.
As you may know, a cls provide a class file. The difference with a sty file isn't obvious, because everything could be made with a sty. The easiest way to know what is appropriate, is could you use your file with an other document ?If yes, it's a package (sty), if not, (probably because you set your documents settings), it's a class (cls).

This cls provide: 
* a uge list of packages, almost all with a short description of what they do (contained in ```tex/packages.tex```).
* some parameters for the document : in ```parametres.tex```. I do not give an exhaustive list of them, because if you need to change them (and able to do it), you should be able to understand the file itself.
* options for the section appearence : this class provide 3 options for the apparence of the sections names. It is all specified in ```tex/section.tex```. Unless you want to add a setting, or modify the settings, you don't need to understand this file, and in that case, the file is enought explicit.
  
***
## The different extensions
* .aux : contains data for cross references (for LaTeX and BibTeX)
* .bbl : produced by BibTeX, used by LaTeX for the next compilation (contains bibliographie sources)
* .blg : BibTeX logs
* .bst : for BibTeX
* .brf : for back references (I don't know what it is)
* .dtx : documented source file, generate latex package
* .fdb_latexmk
* fls
* log
* lof : list of figure
* out 
* toc : for the table of content
* synctex.gz