# TP2 : écoulement d'un fluide visqueux incompressible et stationnaire dans un canal bidimensionnel
Voici une rapide description des différentes fonctions du dossier (classées par ordre alphabétique)
```
TP2/
├── affiche_ordre1.m : affiche la solution d'ordre 1 (que des points aux sommets des triangles)
│   
├── affiche_ordre2.m : affiche la solution d'ordre 2 (des points aux sommets et au milieu des arêtes des triangles)
│   
├── affichemaillage_ordre2 : affiche la solution d'ordre 2 (des points aux sommets et au milieu des arêtes des triangles)
│   
├── elimine_stokes_marche.m : routine de pseudo-élimination dans le cas du canal avec une marche
│   
├── elimine_stokes.m : routine de pseudo-élimination dans le cas du canal sans marche
│   
├── elimine.m : routine de pseudo-élimination pour les équations de Dirichlet
│   
├── f.m : implémentation de la fonction f
│   
├── g.m : implémentation de la fonction g pour Dirichlet avec des conditions non homogènes
│   
├── g1.m : implémentation de la fonction g1 pour Stockes
│   
├── g2.m : implémentation de la fonction g2 pour Stockes
│   
├── g1_marche.m : implémentation de la fonction g1 pour Stockes avec une marche
│   
├── g2_marche.m : implémentation de la fonction g2 pour Stockes avec une marche
│   
├── grad_w.m : renvoie la valeur du gradient d'une fonction de base en un point 
│   
├── h_change_maillage_stokes_marche.m : change la taille du marche dans le cas de l'écoulement dans un canal avec une marche
│   
├── h_change_maillage_stokes.m : change la taille du marche pour l'équation de Neumann 
│   
├── h_change_maillage.m : change la taille du marche dans l'équation de Dirichlet
│   
├── lambda.m : renvoie la valeur d'une fonction barycentrique en un point 
│   
├── lecture_msh_ordre2.m : 
│   
├── matE_elem.m : création d'une matrice élementaire liée à la pression sur un triangle de référence 
│   
├── matF_elem.m : création d'une matrice élementaire liée à la pression sur un triangle de référence 
│   
├── matK_elem_p2.m : création de matrice élementaire de rigidité sur un triangle de référence 
│   
├── matM_elem_p2.m : création de matrice élementaire de masse sur un triangle de référence 
│   
├── principal_dirichlet_p2.m : pour un h donné, "main" qui renvoie les solutions exactes, approchées, les erreurs et des graphiques pour le problème de Dirichlet
│   
├── principal_neumann_p2.m : pour un h donné, "main" qui renvoie les solutions exactes, approchées, les erreurs et des graphiques pour le problème de Neumann
|
├── principal_stokes.m : pour un h donné, "main" qui renvoie les solutions exactes, approchées, les erreurs et des graphiques pour l'écoulement dans un canal avec ou sans marche
|
├── validation_dirichlet_homogene.m : création de graphiques pour étudier l'erreur selon différents paramètres de maillage pour le problème de Dirichlet avec des conditions à la limite homogènes
│   
├── validation_dirichlet_non_homogene.m : création de graphiques pour étudier l'erreur selon différents paramètres de maillage pour le problème de Dirichlet avec des conditions à la limite non homogènes
│   
├── validation_erreur_stokes.m : création de graphiques pour étudier l'erreur selon différents paramètres de maillage pour l'écoulement dans un canal avec ou sans marche
│   
├── validation_neumann.m : création de graphiques pour étudier l'erreur selon différents paramètres de maillage pour les équations de Neumann
│   
└── w.m : renvoie la valeur d'une fonction de base en un point 
```
Pour lancer les fichiers principaux, il faut bien regarder les arguments et leurs nombres, en effet, on peut choisir ce que l'on veut afficher, calculer (pour les équations de Dirichlet, on peut choisir si on les veut homogènes ou non, pour Stockes, si l'on veut la marche ou pas, la valeur de la viscosité, …), …