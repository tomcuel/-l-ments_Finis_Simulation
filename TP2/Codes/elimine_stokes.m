function [AA_tilde, LL_tilde] = elimine_stokes(AA, LL, Refneu, Coorneu)

    AA_tilde = AA;
    LL_tilde = LL;
    Nbpt=size(Refneu,1);
    for i=1:Nbpt
        % si on est sur la partie du bord concernée par les conditions aux limites de Dirichlet
        % côté gauche, et les deux horizontaux
        if Refneu(i)~=0 && (Coorneu(i,2)==0 || Coorneu(i,2)==2 || Coorneu(i,1)==0)
            AA_tilde(i,:)=0;
            AA_tilde(i+Nbpt,:)=0;
            AA_tilde(i,i)=1;
            AA_tilde(i+Nbpt,i+Nbpt)=1;
            LL_tilde(i)=g1(Refneu, Coorneu, i);
            LL_tilde(i+Nbpt)=g2(Refneu, Coorneu, i);
        end
    end

end
