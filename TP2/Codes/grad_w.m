% q : pour savoir la fonction que l'on doit considérer 
% (S_x, S_y) = le point en lequel on doit évaluer 
% (x1,y1), (x2,y2), (x3,y3) : les coordonnées des trois sommets du triangle
% (pas forcément de référence ici)
function [w_vecteur] = grad_w(q, Sx, Sy, x1, y1, x2, y2, x3, y3)
    
    D = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);
    grad_lamdba_1 = [(y2 - y3)/D ; (x3 - x2)/D];
    grad_lamdba_2 = [(y3 - y1)/D ; (x1 - x3)/D];
    grad_lamdba_3 = [(y1 - y2)/D ; (x2 - x1)/D];
    w_vecteur = [0 ; 0];
    if q == 1 
        w_vecteur = (4*lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)-1)*grad_lamdba_1;
    elseif q == 2 
        w_vecteur = (4*lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)-1)*grad_lamdba_2;
    elseif q == 3
        w_vecteur = (4*lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)-1)*grad_lamdba_3;
    elseif q == 4 
        w_vecteur = 4*(lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_1 + lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_2);
    elseif q == 5 
        w_vecteur = 4*(lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_2 + lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_3);
    elseif q == 6 
        w_vecteur = 4*(lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_3 + lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)*grad_lamdba_1);
    end 
    
end 