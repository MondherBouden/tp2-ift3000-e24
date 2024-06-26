# IFT-3000 -- ÉTÉ 2024 -- Travail pratique 2

## Premières étapes

### Lire l'énoncé

L'[énoncé](./énoncé.pdf) est disponible dans le présent dépôt, à la racine du projet.

### Télécharger le code du projet

Vous pouvez soit cloner le projet avec `git` via `git clone https://github.com/MondherBouden/tp2-ift3000-e24.git`, soit télécharger le projet comme fichier Zip en visitant le même URL.

Considérons que vous travaillez avec la machine virtuelle du cours, que vous avez ouvert un terminal `Linux`, que vous vous situez, au niveau de l'arborescence du disque dur, au niveau `/home/ift-3000` et que vous avez saisi ce qui suit:

```git clone https://github.com/MondherBouden/tp2-ift3000-e24.git```

Ceci aura pour effet de créer un nouveau répertoire nommé `tp2-ift3000-e24` et d'y déposer un clone (une copie) du projet.

### Consulter la documentation

On vous invite à consulter la [Documentation](https://mondherbouden.github.io/tp2/Tp2/index.html) des fonctions à compléter dans ce projet.

## Démarche à suivre

Dans ce qui suit, on suppose que vous utilisez VSCode. Aussi, à moins de mention contraire, toutes les commandes mentionnées dans le présent document sont à exécuter dans un terminal (typiquement, celui que vous aurez ouvert dans VSCode).

### Lancer VScode

Dans un terminal `Linux`, à partir du dossier où vous avez copié (cloné) une copie du projet, soit `/home/ift-3000/tp2-ift3000-e24`, tapez ce qui suit pour lancer VSCode (n'oubliez pas le point):

```code .```

#### Ouvrir un terminal 

Dans la barre de tâche, qui se situe à gauche dans `VSCode`, cliquez sur l'icone représentant un chameau, puis cliquez sur `Open a sandboxed terminal`; par la suite, cliquez sur le premier icone représentant 2 feuilles de papiers superposées pour retrouver l'explorateur de `VSCode`, et les fichiers du projet.

#### Il faudra avant tout compiler le projet dans son ensemble 

```dune build```

### Compléter les fonctions du projet

#### Ouvrir le fichier `tp2.ml` (dossier `lib`)

#### Compléter/programmer une fonction

#### Lancer le testeur

```dune runtest```

#### Faire vos propres tests

En supposant que la compilation du projet n'a pas produit d'erreurs, dans le terminal, lancer l'interpréteur

```dune utop``` ou ```ocaml```

Ouvrir le module du Tp2 (dans l'interpréteur)

```open Tp2;;```

Puis, faites vos tests.

#### Répéter le processus pour compléter tout le projet

### En cas d'erreurs

Si suite à `dune build` ou `dune runtest`, vous avez des erreurs, vous pouvez soit corriger la situation dans le fichier `tp2.ml` et recompiler (`dune build`); soit ouvrir l'interpréteur (`dune utop` ou `ocaml`), copier-coller les parties de code que vous voulez tester, et faire vos tests. 

## Pour votre information - dune

#### Pour compiler

```dune build```

Si vous utilisez VSCode, grâce au typage explicite des fonctions à compléter, l'éditeur devrait vous assister pour éviter plusieurs types d'erreurs.
La phase de compilation du projet, grâce à `dune build`, vous permettra, en plus de produire un code objet, de vous assurer que tout votre code est conforme à la spécification du projet précisée dans le fichier `tp2.mli`.

#### Pour tester

```dune runtest```

Le testeur est conçu pour pouvoir tester une à une vos différentes fonctions; vous pouvez donc compléter la définition d'une fonction, la tester, avant de passer à une autre fonction, la tester, et ainsi de suite jusqu'à compléter tout le projet.

Notez que cette commande, `dune runtest`, lance automatiquement `dune build` si le code n'a pas été compilé ou si un des fichiers du projet a été modifié depuis la compilation ou le dernier test.

Aussi `dune runtest` ne produit aucun effet (aucun affichage de résultat) si aucun fichier du projet n'a été modifié depuis la dernière exécution du testeur.

#### Pour essayer

```dune utop```

ou bien

```ocaml``` 

Il ne vous reste qu'a faire `open Tp2;;` pour ouvrir le module contenant vos fonctions 
(voir le contenu de `.ocamlinit`).

#### Pour effacer

```dune clean```

Cela aura pour effet d'effacer tous les fichiers objets produits suite à la compilation et l'édition de lien. Pour votre information, ces fichiers se trouvent dans le sous-dossier `_build\default`.

#### Pour générer la documentation

```dune build @doc```

Vous n'aurez pas à exécuter cette commande mais sachez que c'est en l'utilisant qu'on a produit la documentation du projet dans son ensemble (puis en la publiant dans GitHub ).