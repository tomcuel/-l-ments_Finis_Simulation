# Éléments Finis Simulation





#### Sommaire 
* [Chemins](#chemins)
* [Liens aux dossiers](#liens-aux-dossiers)
* [Utilisation de gmsh](#utilisation-de-gmsh)

## Chemins 
```
Upgraded_Chess_Engine/
├── Éléments finis P1/
│   ├── Codes/              # les codes Matlab du TP
│   └── Rapport/            # le rapport et les résultats du TP
│
└── Éléments finis P2/
    ├── Codes/              # les codes Matlab du TP
    └── Rapport/            # le rapport et les résultats du TP
```

## Liens aux dossiers
* [Éléments finis P1](./TP1/) 
    * [Codes](./Chess_Engine/Codes/) : les codes Matlab du TP
    * [Rapport](./Chess_Engine/Rapport/) : le rapport et les résultats du TP
* [Éléments finis P2](./TP2/)
    * [Codes](./Chess_Engine/Codes/) : les codes Matlab du TP
    * [Rapport](./Chess_Engine/Rapport/) : le rapport et les résultats du TP

## Utilisation de gmsh
#### télécharger l'outil de ligne de commande 
Voic le lien pour télécharger gmsh et ainsi pouvoir faire, modifier des maillages : http://gmsh.info

J'ai aussi installé l'outil de ligne de commande avec homebrew, étant sur MacOs, la procédure peut changer sur windows
```
brew install gmsh
```
Maintenant, pour l'utiliser, j'ai utilisé une commande Matlab, qui permet d'actualiser le maillage, après avoir par exemple modifier le nombre de noeuds (voir le TP2 et les codes d'automatisation du changement du paramètre h du maillage) (le chemin à l'outil gmsh changera bien sûr sur une machine Windows)
```
system('/opt/homebrew/bin/gmsh geomRectangle_partie3_marche.geo -2 -order 2 -o geomRectangle_partie3_marche.msh');
```


####
