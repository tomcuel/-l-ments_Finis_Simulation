function [Mel] = matM_elem_p2(S1, S2, S3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcul de la matrice de masse elementaire en P2 Lagrange
%
% SYNOPSIS [Mel] = matM_elem_p2(S1, S2, S3)
%
% INPUT * S1, S2, S3 : les 2 coordonnees des 3 sommets du triangle
%                      (vecteurs reels 1x2)
%
% OUTPUT - Mel matrice de masse elementaire (matrice 6x6)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% preliminaires, pour faciliter la lecture:
x1 = S1(1); y1 = S1(2);
x2 = S2(1); y2 = S2(2);
x3 = S3(1); y3 = S3(2);

% calcul de la matrice de masse
% -------------------------------
% Initialisation
Mel = zeros(6,6);

% Points et poids de quadrature
S_hat = [0.0915762135098, 0.0915762135098;
         0.8168475729805, 0.0915762135098;
         0.0915762135098, 0.8168475729805;
         0.1081030181681, 0.4459484909160;
         0.4459484909160, 0.1081030181681;
         0.4459484909160, 0.4459484909160];
poids = [0.05497587183, 0.05497587183, 0.05497587183, 0.1116907948, 0.1116907948, 0.1116907948];

% Det Bl = D donc on a seulement besoin de D
D = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);

% On se place sur le triangle de référence :
x1 = 0;
y1 = 0; 
x2 = 1;
y2 = 0;
x3 = 0;
y3 = 1;

for i=1:6 
    for j=1:6
        G=0;
        for k=1:6
           G = G + poids(k) * abs(D) * w(i, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3) * w(j, S_hat(k,1), S_hat(k,2), x1, y1, x2, y2, x3, y3);
        end 
        Mel(i,j) = G;
    end 
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        fin de la routine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24
