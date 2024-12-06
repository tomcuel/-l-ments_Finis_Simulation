% ===============================================================
%
% une routine pour la mise en oeuvre des EF P2 Lagrange
% pour l'équation de Laplace suivante, avec conditions de Dirichlet
%
% | -\Delta u + u= f,   dans \Omega
% |        u = 0,   sur le bord de \Omega si homogène 
% |        u = g,   sur le bord de \Omega si non homogène
%
% Le script est vu comme une fonction pour calculer les solutions, qui sera
% appelé dans un main pour éviter d'appeler à la main pour faire les
% régressions linéaires sur les erreurs
% ===============================================================
% h_wanted = la taille de maillage voulue 
% validation = 'oui' si on veut regarder les erreurs, 'non' sinon
% init_visualisation = 1 si on veut voir le maillage de départ, 0 sinon 
% result_visualisation = 1 si on veut voir le résultat : en approchée et en Exact
% is_homogene : 1 si on résout le problème homogène, 0 pour le problème non homogène  
function [erreur_L2, erreur_relative_L2, erreur_semi_H1, erreur_relative_semi_H1] = principal_dirichlet_p2(h_wanted, validation, init_visualisation, result_visualisation, is_homogene)

    % Changement de la valeur de h avant de calculer le tout
    % --------------------------------
    h_change_maillage(h_wanted);

    % lecture du maillage et affichage
    % --------------------------------
    nom_maillage = "geomRectangle.msh";
    [Nbpt,Nbtri,Coorneu,Refneu,Numtri,Reftri,Nbaretes,Numaretes,Refaretes]= lecture_msh_ordre2(nom_maillage);
    if init_visualisation == 1
        affichemaillage_ordre2(nom_maillage, "Maillage considéré")
    end

    % calcul des matrices EF
    % ----------------------
    % déclarations
    % ------------
    KK = sparse(Nbpt,Nbpt); % matrice de rigidité
    MM = sparse(Nbpt,Nbpt); % matrice de masse
    LL = zeros(Nbpt,1);     % vecteur second membre

    % boucle sur les triangles
    % ------------------------
    for l=1:Nbtri

      % Coordonnees des sommets du triangles
      S1= Coorneu(Numtri(l,1),:);
      S2= Coorneu(Numtri(l,2),:);
      S3= Coorneu(Numtri(l,3),:);

      % Calcul des matrices elementaires du triangle l
      Kel=matK_elem_p2(S1, S2, S3);
      Mel=matM_elem_p2(S1, S2, S3);

      % On fait l'assemblage des matrices globales
      for i=1:6
          I=Numtri(l,i);
          for j=1:6
              J=Numtri(l,j);
              MM(I,J) = MM(I,J)+ Mel(i,j);
              KK(I,J) = KK(I,J)+ Kel(i,j);
          end 
      end 

    end % for l

    % Calcul du second membre
    % -----------------------
    % utiliser la routine f.m
    FF = zeros(Nbpt,1);
    exo_done = 2; % 2 pour homogène (1)
    if is_homogene == 0 % non homogène (0)
        exo_done = 3;
    end 
    for i=1:Nbpt
        FF(i) = f(Coorneu(i,1), Coorneu(i,2), exo_done);
    end 
    LL = MM * FF;
    
    % Faire la pseudo élimination 
    % ---------------------------
    [AA_tilde, LL_tilde] = elimine(MM+KK, LL, Refneu, Coorneu, is_homogene);

    % Résolution du système linéaire
    % ------------------------------
    UU = AA_tilde\LL_tilde;

    % visualisation
    % -------------
    if result_visualisation == 1
        if is_homogene == 1 % homogène 
            affiche_ordre2(UU, Numtri, Coorneu,sprintf('Dirichlet homogène - %s', nom_maillage));
        elseif is_homogene == 0 % non homogène
            affiche_ordre2(UU, Numtri, Coorneu,sprintf('Dirichlet non homogène - %s', nom_maillage));
        end
    end

    % validation seulement si voulu
    % -----------------------------
    % On initialise quand même les erreurs : 
    erreur_L2 = 0;
    erreur_relative_L2 = 0;
    erreur_semi_H1 = 0;
    erreur_relative_semi_H1 = 0;
    if strcmp(validation,'oui')
        if is_homogene == 1 
            UU_exact = 3*sin(pi*Coorneu(:,1)).*sin(pi*Coorneu(:,2)); 
        elseif is_homogene == 0
            UU_exact = 3*cos(pi*Coorneu(:,1)).*cos(2*pi*Coorneu(:,2));
        end 
        if result_visualisation == 1
            affiche_ordre2(UU_exact, Numtri, Coorneu, "Exacte");
        end 
        % Calcul de l erreur L2
        erreur_L2 = sqrt((UU_exact-UU)'*MM*(UU_exact-UU));
        % Calcul de l'erreur relative L2
        erreur_relative_L2 = sqrt((UU_exact-UU)'*MM*(UU_exact-UU)) / sqrt((UU_exact)'*MM*(UU_exact));
        % Calcul de l erreur semi H1
        erreur_semi_H1 = sqrt((UU_exact-UU)'*KK*(UU_exact-UU));
        % Calcul de l'erreur relative semi H1
        erreur_relative_semi_H1 = sqrt((UU_exact-UU)'*KK*(UU_exact-UU)) / sqrt((UU_exact)'*KK*(UU_exact));
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                        fin de la routine
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24
end 
