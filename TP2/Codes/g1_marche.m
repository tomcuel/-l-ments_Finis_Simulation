function g1_value = g1_marche(Refneu, Coorneu, i)

    g1_value=0;
    % Bord où les conditions de Dirichlet sont appliquées
    % on enlève les points (0,1) et (0,2) ici
    if Coorneu(i,1)==0 && 1<Coorneu(i,2)<2
        g1_value=(2-Coorneu(i,2))*Coorneu(i,2);
    end

end
