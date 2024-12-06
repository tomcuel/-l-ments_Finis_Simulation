function [GG] = g(Refneu, Coorneu, Nbpt)

    GG = zeros(Nbpt, 1);
    for i=1:Nbpt
        % si on est sur le bord 
        if Refneu(i) == 1
            if Coorneu(i,1) == 0 || Coorneu(i,1) == 3 
                GG(i) = 3*cos(2*pi*Coorneu(i,2));
            end 
            if Coorneu(i,2) == 0 || Coorneu(i,2) == 2
                GG(i) = 3*cos(pi*Coorneu(i,1));
            end 
        end 
    end 
    
end 