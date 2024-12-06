function [AA_tilde, LL_tilde] = elimine(AA, LL, Refneu, Coorneu, is_homogene)

    AA_tilde = AA;
    LL_tilde = LL;
    Nbpt = size(Refneu,1);
    GG = zeros(Nbpt, 1);
    % LB vaut g pour Dirichlet non homogène, on charge alors g dans ce cas
    if is_homogene == 0
        GG = g(Refneu, Coorneu, Nbpt);
    end 
    for i=1:Nbpt
        % pour un sommet sur le bord 
        if Refneu(i) == 1
            AA_tilde(i,:) = 0;
            % on supprime la colonne pour Dirichlet homogène
            if is_homogene == 1 
                AA_tilde(:,i) = 0;
            end 
            AA_tilde(i,i) = 1;
            % GG vaut 0 si homogène et g sinon 
            LL_tilde(i) = GG(i); 
        end
    end

end 
