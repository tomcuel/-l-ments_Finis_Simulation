# TP1 : implémentation de la méthode des éléments finis et équation de poisson
Voici une rapide description des différentes fonctions du dossier (classées par ordre alphabétique)
```
TP2/
├── affiche.m : affiche la solution 
│   
├── affichemaillage.m : affiche le maillage
│   
├── erreur.m : simule plusieurs valeurs de h et trace des variations de l'erreur entre solution exacte et approchée
│   
├── f.m : implémentation de la fonction f
│   
├── lecture_msh : fonction pour lire un fichier .msh
│   
├── matK_elem.m : création de matrice élementaire de rigidité sur un triangle de référence 
│   
├── matM_elem.m : création de matrice élementaire de masse sur un triangle de référence 
│   
└── principal_neumann : pour un h donné, "main" qui renvoie les solutions exactes, approchées, les erreurs et des graphiques
```
Pour lancer le fichier principal, il faut bien regarder les arguments et leurs nombres, en effet, on peut choisir ce que l'on veut afficher, calculer, …