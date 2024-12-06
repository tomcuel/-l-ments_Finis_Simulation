% Mes 4 points
h = [0.2, 0.1, 0.05, 0.025]; 
erreur_relative_L2 = [0.1117, 0.0267, 0.0065, 0.0016]; 
erreur_relative_semi_H1 = [0.0906, 0.0257, 0.0081, 0.0025];

% Abscisses en log(1/x)
log_x = log(1 ./ h);
% Ordonnées en log 
log_y_L2 = log(erreur_relative_L2);
log_y_semi_H1 = log(erreur_relative_semi_H1);

% Créer la figure 
figure;

% Graphique pour erreur_relative_L2
plot(log_x, log_y_L2, 'bo-', 'LineWidth', 1, 'MarkerSize', 8);
hold on;

% Graphique pour erreur_relative_semi_H1
plot(log_x, log_y_semi_H1, 'ro-', 'LineWidth', 1, 'MarkerSize', 8); 

% Régressions linéaires
% L2
p_L2 = polyfit(log_x, log_y_L2, 1); 
y_fit_L2 = polyval(p_L2, log_x); 
plot(log_x, y_fit_L2, 'b--', 'LineWidth', 2); 
% Semi H1
p_semi_H1 = polyfit(log_x, log_y_semi_H1, 1); 
y_fit_semi_H1 = polyval(p_semi_H1, log_x);
plot(log_x, y_fit_semi_H1, 'r--', 'LineWidth', 2);

% Titre et étiquettes
xlabel('log(1/h)');
ylabel('log(erreur)');
title('Graph of log(1/h) vs. log(erreur)'); 
grid on;

% Ajouter une légende pour distinguer les courbes avec les coefficients
legend_str_L2 = sprintf('erreur\\_relative\\_L2 (Coef: %.4f)', p_L2(1));
legend_str_semi_H1 = sprintf('erreur\\_relative\\_semi\\_H1 (Coef: %.4f)', p_semi_H1(1));
legend(legend_str_L2, legend_str_semi_H1, 'Location', 'northeast');
hold off;
