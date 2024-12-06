% q : pour savoir la fonction que l'on doit considérer 
% (S_x, S_y) = le point en lequel on doit évaluer 
% (x1,y1), (x2,y2), (x3,y3) : les coordonnées des trois sommets du triangle
% (pas forcément de référence ici)
function [w_value] = w(q, Sx, Sy, x1, y1, x2, y2, x3, y3)
    
    w_value = 0;
    if q == 1 
        w_value = lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)*(2*lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)-1);
    elseif q == 2 
        w_value = lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)*(2*lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)-1);
    elseif q == 3
        w_value = lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)*(2*lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)-1);
    elseif q == 4 
        w_value = 4*lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3)*lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3);
    elseif q == 5 
        w_value = 4*lambda(2, Sx, Sy, x1, y1, x2, y2, x3, y3)*lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3);
    elseif q == 6 
        w_value = 4*lambda(3, Sx, Sy, x1, y1, x2, y2, x3, y3)*lambda(1, Sx, Sy, x1, y1, x2, y2, x3, y3);
    end 
    
end