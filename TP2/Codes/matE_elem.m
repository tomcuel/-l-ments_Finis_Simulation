function [Eel] = matE_elem(S1, S2, S3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul de la matrice elementaire du bloc rectangulaire (p, dv1/dx)
%
% SYNOPSIS [Eel] = matE_elem(S1, S2, S3)
%
% INPUT * S1, S2, S3 : les 2 coordonnees des 3 sommets du triangle
%                      (vecteurs reels 1x2)
%
% OUTPUT - Eel matrice elementaire rectangulaire (matrice 6x3)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preliminaires, pour faciliter la lecture:
x1 = S1(1); y1 = S1(2);
x2 = S2(1); y2 = S2(2);
x3 = S3(1); y3 = S3(2);

% Matrice B_l inversée et transposée
Bl = [x2 - x1, x3 - x1;
      y2 - y1, y3 - y1];
Bl_invtranspose = inv(Bl');
% Det Bl = D donc on a seulement besoin de D
D = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);

% On se place sur le triangle de référence :
% ------------------------------------------
x1 = 0;
y1 = 0; 
x2 = 1;
y2 = 0;
x3 = 0;
y3 = 1;

% Points et poids de quadrature (ordre 2)
% ---------------------------------------
S_hat = [1/6, 1/6;
         2/3, 1/6;
         1/6, 2/3];
poids = 1/6;

% Calcul de la matrice elementaire du bloc rectangulaire (p, dv1/dx)
% ------------------------------------------------------------------
Eel = zeros(6,3);

% Calcul des contributions via quadrature
% ---------------------------------------
for i=1:6
    for j=1:6
        G= 0;
        for k=1:3 
            G = G - poids * abs(D) * lambda(j, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3) * Bl_invtranspose(1, :) * grad_w(i, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3); 
        end 
        Eel(i,j) = G;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        fin de la routine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24
