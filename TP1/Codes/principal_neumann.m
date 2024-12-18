% =====================================================
%
%
% une routine pour la mise en oeuvre des EF P1 Lagrange
% pour l'equation de Laplace suivante, avec conditions de
% Neumann sur le maillage nom_maillage.msh
%
% | -\Delta u + u= f,   dans \Omega
% |         du/dn = 0,   sur le bord
%
% =====================================================


% lecture du maillage et affichage
% ---------------------------------
nom_maillage = 'geomCarre.msh';
[Nbpt,Nbtri,Coorneu,Refneu,Numtri,Reftri,Nbaretes,Numaretes,Refaretes]=lecture_msh(nom_maillage);

% ----------------------
% calcul des matrices EF
% ----------------------

% declarations
% ------------
KK = sparse(Nbpt,Nbpt); % matrice de rigidite
MM = sparse(Nbpt,Nbpt); % matrice de masse
LL = zeros(Nbpt,1);     % vecteur second membre

% boucle sur les triangles
% ------------------------
for l=1:Nbtri
  % Coordonnees des sommets du triangles
  % A COMPLETER
  S1 = Coorneu(Numtri(l,1),:);
  S2 = Coorneu(Numtri(l,2),:);
  S3 = Coorneu(Numtri(l,3),:);
  % calcul des matrices elementaires du triangle l 
  
  Kel=matK_elem(S1, S2, S3);
           
  Mel=matM_elem(S1, S2, S3);
    
  % On fait l'assemmblage de la matrice globale et du second membre
  for i=1:3
      I=Numtri(l,i);
      for j=1:3
          J=Numtri(l,j);
          MM(I,J)=MM(I,J)+Mel(i,j);
          KK(I,J)=KK(I,J)+Kel(i,j);
      end 
  end 

end % for l

% Calcul du second membre L
% -------------------------

% utiliser la routine f.m
FF = zeros(Nbpt,1);
for i=1:Nbpt
    FF(i) = f(Coorneu(i,1), Coorneu(i,2));
end 
LL = MM * FF;

% inversion
% ----------
UU = (MM+KK)\LL;

% visualisation
% -------------
affiche(UU, Numtri, Coorneu, sprintf('Neumann - %s', nom_maillage));

validation = 'oui';
% validation
% ----------
if strcmp(validation,'oui')
    UU_exact = cos(pi*Coorneu(:,1)).*cos(2*pi*Coorneu(:,2));
    affiche(UU_exact, Numtri, Coorneu, "Exacte");
    % Calcul de l erreur L2
    erreur_L2 = sqrt((UU_exact-UU)'*MM*(UU_exact-UU))
    % Calcul de l'erreur relative L2
    erreur_relative_L2 = sqrt((UU_exact-UU)'*MM*(UU_exact-UU)) / sqrt((UU_exact)'*MM*(UU_exact))
    % Calcul de l erreur semi H1
    erreur_semi_H1 = sqrt((UU_exact-UU)'*KK*(UU_exact-UU))
    % Calcul de l'erreur relative semi H1
    erreur_relative_semi_H1 = sqrt((UU_exact-UU)'*KK*(UU_exact-UU)) / sqrt((UU_exact)'*KK*(UU_exact))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        fin de la routine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24

