% p : pour savoir la fonction que l'on doit considérer 
% (S_x, S_y) = le point en lequel on doit évaluer 
% (x1,y1), (x2,y2), (x3,y3) : les coordonnées des trois sommets du triangle
function [lambda_value] = lambda(p, Sx, Sy, x1, y1, x2, y2, x3, y3)
    
    lambda_value = 0;
    D = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);
    if p == 1
        lambda_value = ((y2-y3)*(Sx-x3) - (x2-x3)*(Sy-y3))/D;
    elseif p == 2 
        lambda_value = ((y3-y1)*(Sx-x1) - (x3-x1)*(Sy-y1))/D;
    elseif p == 3
        lambda_value = ((y1-y2)*(Sx-x2) - (x1-x2)*(Sy-y2))/D;
    end 
    
end 