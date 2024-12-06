function [Kel] = matK_elem_p2(S1, S2, S3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul de la matrice de rigidité elementaire en P2 Lagrange
%
% SYNOPSIS [Kel] = matK_elem_p2(S1, S2, S3)
%
% INPUT * S1, S2, S3 : les 2 coordonnees des 3 sommets du triangle
%                      (vecteurs reels 1x2)
%
% OUTPUT - Kel matrice de rigidité elementaire (matrice 6x6)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preliminaires, pour faciliter la lecture:
x1 = S1(1); y1 = S1(2);
x2 = S2(1); y2 = S2(2);
x3 = S3(1); y3 = S3(2);

% calcul de la matrice de rigidité
% -------------------------------
% Initialisation
Kel = zeros(6,6);

% Points et poids de quadrature
S_hat = [1/6, 1/6;
         2/3, 1/6;
         1/6, 2/3];
poids = 1/6;

% Matrice B_l inversée et transposée
Bl = [x2 - x1, x3 - x1;
      y2 - y1, y3 - y1];
Bl_invtranspose = inv(Bl');
% Det Bl = D donc on a seulement besoin de D
D = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);

% On effectue la transformation des points pour passer de w à w^
% On se place sur le triangle de référence : ce sont les points obtenus par la transformation Fl 
x1 = 0;
y1 = 0; 
x2 = 1;
y2 = 0;
x3 = 0;
y3 = 1;

for i=1:6 
    for j=1:6
        G=0;
        for k=1:3
           G = G + poids * abs(D) * dot(Bl_invtranspose*grad_w(i, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3),Bl_invtranspose*grad_w(j, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3));
        end 
        Kel(i,j) = G;
    end 
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        fin de la routine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24
