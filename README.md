# La classe pfe

## Introduction
Cette classe est une classe héritant de la classe ```article```. Les options utilisées sont :
* ```12pt``` : taille de police
* ```a4paper``` : taille de document
* ```oneside``` : format d'impression (à tester pour le twoside, risque de bugs avec le header)
*  ```draft``` : option de la classe article, permet d'ajouter les hyphenation (une barre en gras pour indiquer les dépassements de marge)

Les aventages de cette classe (et des packages fournis avec) sont des paramétrages faciles concernant les points suivants :
* La page de garde : grâce à ses variables de contenu (à compléter dans ```metadata.tex```), permet d'avoir une page de garde complète, en une seule ligne dans le document.
* Les sommaires : en complétant les setters dans ```metadata.tex```, permet d'appeler à la volée les différents sommaires existantes (content, figure, listings, tables).
* Le header (en tête et pied de page) : simple également, permet d'avoir des headers propres, complets simplement

## Les options de compilation
Cette classe rajoute plusieurs options de compilation en plus de celles fournies de base par la classe article.
* La censure :
  * Pas d'option : les éléments censurés sont affichés normalement
  * ```censure``` : cache les passages censurés, en attente de validation
  * ```showscensure``` : met en évidence les passage censurés (mal géré pour du contenu non textuel, mais compile quand même)
* Les titres de section :
  * couleur :
    * pas d'option : titre en noir
    * colorised : permet de mettre les titres de section et sous sections en couleur (différentes de bleu)
  * polices, plus forme
    * sans option : compteur de section en ```Alph``` souligné
    * ```devie``` : change la forme des titres se section... (très chargé, pas forcément conseillé)
    * ```sobre``` : idem, plus léger, option recommandée (section en ```Roman```, sous sections en ```arabic```)
* le mode dev :
  * ```dev```: va afficher les description de ```sectionC```(voir plus bas), et le nombre de page attendu dans les titre de section (utiliser uniquement pendant l'élaboration d'un document, à retirer pour un rendu final)
Il convient de ne pas utiliser plus d'une option par catégorie (compilera, mais résultat non garanti).

## La page de garde
Cette classe fournit une page de garde modulaire (il n'est pas nécessaire d'utiliser tous les champs). Il suffit d'utiliser les setters (se référer à ```metadata.tex```, (est importé dans  ```templatePFE.tex```)).
Les setters sont définis de la manière suivante : \set _nom_variable_.
Les variables à setter : 
* ```hidden```:   
  * 1 : cache les attributs non renseignés (si pas souhaités) 
  * 0 : indique en rouges les attributs manquants, et leur position sur le document

* Les images en haut : il est possible d'en renseigner aucune, une seule (peut importe laquelle, car sera centrée), ou les deux.
* ```imageleft``` :  nom de l'image à gauche
* ```imageright``` :  nom de l'image à droite

* ```addrentreprise``` : adresse de l'entreprise
* ```auteurlist``` :  auteurs (de la forme auteur \\ auteur...)
* ```entreprise``` : nom de l'entreprise
* ```filliere```: fillière 
* ```periode``` : dates + durée
* ```respostage```  : maitre de stage dans l'entreprise
* ```school```  : nom de l'école
* ```schoolbis``` : acronyme détaillé du nom de l'école
* ```soustitre``` : (rapport de pfe)
* ```titre``` : titre du rapport (imposé)(si vous voulez vraiment ne pas en mettre il faut modifier dans ```pfe.cls``` la méthode ```maketitlepage``` : je déconseille d'y toucher sauf si vous savez exactement ce que vous faites)
* ```tuteurstage``` : tuteur au sein de l'école
* ```villeentreprise``` : code postal + ville

Pour afficher la page de garde, il faut utiliser la méthode ```\maketitlepage``` (en début de document).
## Les sections modifiées
Cette classe fournit une ```section```améliorée, la ```sectionC``` (va avoir le même comportement qu'une section, car c'est une section enrichie), peut être utilisée avec des section dans le rapport. (une ```sectionC```aura exactement le même comportement qu'une section normale si l'option ```dev```n'est pas utilisée, et les arguments optionnels ne seront pas pris en compte)
* Usage : ```\sectionC{#1}[#2][#3]```
  * ```#1```: titre de section (comme pour une section normale)
  * ```#2```: (optionnel) nombre de page attendu pour la section (sera affiché dans le titre).
  * ```#3```: 1 : va mettre le titre en rouge, et ajouter la mention ```TODO```

* La description de section : sera affichée en gris en dessous de la ```sectionC```, sera affichée si l'option ```dev```est utilisée. Cette variable est comsommée lors de l'appel de ```\sectionC``` (permet de ne pas à avoir à déclarer une description vide pour les ```sectionsC``` suivantes).
* Usage : ```\setDescriptionSection{#1}``` : va setter la variable ```descriptionSection```, à appeler **AVANT** la section.
  * ```#1``` : description de section

## La censure
Utile si vous devez cacher une partie de vos documents, pour censuré un passage il faut utiliser la commande ```\censure{#1}```, tous les éléments censurés se comporteront selon l'option de censure utilisée.

## Glossaire, bibliographie et sommaires
L'ajout des sommaires se fait avec la methode ```settables``` (à appeler à l'endroit ou vous voulez vos sommaires, recommandé après la page de garde, n'a pas été testé ailleurs). Pour savoir quelles tables afficher, il faut setter à 0 ou 1 les différentes variables d'affichage (via un setter), dans ```metadata.tex```.

* booltoc : 1 si sommaire, 0 sinon
* booltof : 1 si liste des figures 0 sinon
* booltot : 1 si liste de tables 0 sinon
* booltol : 1 si liste des listings 0 sinon

Remarque : certains compilateurs ont des problèmes pour afficher le glosssaire, ce qui peut être corrigé avec le fichier ```.latexmkrc```à ajouter tel quel dans vos projets (attention, si vous avez un glossaire pas appelé, le sera quand même à un endroit non souhaité).

## Packages
### Header.sty
Ce package permet d'ajouter les headers et pieds de page (voué à disparaitre pour passer via des variables dans le cls).

Il ne définir aujourd'hui plus que la méthode ```\header```, qui permet de définir les données à ajouter dans les headers, et fait les configurations.
* Usage : ```\header[#1]{#2}{#3}{#4}[5]```
  * ```#1```: logo en bas à gauche
  * ```#2```: titre affiché en haut au milieu
  * ```#3```: ligne 1 auteur (en haut à droite)
  * ```#4```: ligne 2 auteur (en haut à droite)
  * ```#5```: image en bas à droite

### utilitaire.sty
Contient un certain nombre de méthodes utiles (que je ne définirait pas ici, hormis quelque unes) : 
* ```\userData[#1][#2][#3][#4][#5]``` : défini un tableau contenant des informations personnelles .
  * ```#1``` : Prénom
  * ```#2``` : Nom
  * ```#3``` : Adresse
  * ```#4``` : Téléphone
  * ```#5``` : Mail