% exo vaut 0 pour l'essai en f = 1, 1 pour l'exo 1,
% 2 pour l'exo 2 homogène, 3 pour l'exo 2 non homogène
% sinon la valeur sera celle par défaut (ie 1)
function val = f(x,y, exo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluation de la fonction second membre.
%
% SYNOPSIS val = f(x,y)
%
% INPUT * x,y : les 2 coordonnees du point ou on veut evaluer la fonction.
%
% OUTPUT - val: valeur de la fonction sur ce point.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exo 1 Vérification :
val = 1;
if exo == 0
  val = 1;
% Exo 1 validation :
elseif exo == 1
    val = (3+15*pi*pi)*cos(pi*x)*cos(2*pi*y);
% Exo 2 validation homogène :
elseif exo == 2
    val = (3+6*pi*pi)*sin(pi*x)*sin(pi*y);
% Exo 2 validation non homogène :
elseif exo == 3
    val = (3+15*pi*pi)*cos(pi*x)*cos(2*pi*y);
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                     fin de la fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%24
