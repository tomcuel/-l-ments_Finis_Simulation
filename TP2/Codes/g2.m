function g2_value = g2(Refneu, Coorneu, i)

    if Refneu(i)~=0
        % nul sur TD
        if Coorneu(i,2)==0 || Coorneu(i,2)==2 || Coorneu(i,1)==0
            g2_value=0;
        end
    end

end
