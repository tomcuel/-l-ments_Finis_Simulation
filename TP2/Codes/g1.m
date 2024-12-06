function g1_value = g1(Refneu, Coorneu, i)

    if Refneu(i)~=0
          % sur les côtés horizontaux
          if Coorneu(i,2)==0 || Coorneu(i,2)==2
              g1_value=0;
          end
          % sur le côté gauche du rectangle
          if Coorneu(i,1)==0
              g1_value=(2-Coorneu(i,2))*Coorneu(i,2);
          end
      end

end
