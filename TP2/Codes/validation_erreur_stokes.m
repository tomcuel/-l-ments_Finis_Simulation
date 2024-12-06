% Les 4 tailles de maillage que je souhaite tester
h = [0.5, 0.2, 0.1, 0.05];
Diff_U1 = [0, 0, 0, 0];
Diff_U2 = [0, 0, 0, 0];
Diff_P = [0, 0, 0, 0];
for i=1:4
    [Diff_U1_tested, Diff_U2_tested, Diff_P_tested] = principal_stokes(1, h(i), 0, 'oui', 0, 0, 0, 0);
    Diff_U1(i) = sqrt(sum(Diff_U1_tested.^2));;
    Diff_U2(i) = sqrt(sum(Diff_U2_tested.^2));;
    Diff_P(i) = sqrt(sum(Diff_P_tested.^2));;
end

% Abscisses en log(1/x)
log_x = log(1 ./ h);
% Ordonnées en log
log_y_U1 = log(Diff_U1);
log_y_U2 = log(Diff_U2);
log_y_P = log(Diff_P);

% Créer la figure
figure;

% Graphique pour Diff_U1
plot(log_x, log_y_U1, 'bo-', 'LineWidth', 1, 'MarkerSize', 8);
hold on;
% Graphique pour Diff_U2
plot(log_x, log_y_U2, 'ro-', 'LineWidth', 1, 'MarkerSize', 8);
hold on;
% Graphique pour Diff_P
plot(log_x, log_y_P, 'go-', 'LineWidth', 1, 'MarkerSize', 8);

% Régressions linéaires
% U1
p_U1 = polyfit(log_x, log_y_U1, 1);
y_fit_U1 = polyval(p_U1, log_x);
plot(log_x, y_fit_U1, 'b--', 'LineWidth', 2);
% U2
p_U2 = polyfit(log_x, log_y_U2, 1);
y_fit_U2 = polyval(p_U2, log_x);
plot(log_x, y_fit_U2, 'r--', 'LineWidth', 2);
% U1
p_P = polyfit(log_x, log_y_P, 1);
y_fit_P = polyval(p_P, log_x);
plot(log_x, y_fit_P, 'g--', 'LineWidth', 2);

% Titre et étiquettes
xlabel('log(1/h)');
ylabel('log(erreur)');
title('Graph of log(1/h) vs. log(erreur)');
grid on;

% Ajouter une légende pour distinguer les courbes avec les coefficients
legend_str_U1 = sprintf('u1-uh1 (Coef: %.4f)', p_U1(1));
legend_str_U2 = sprintf('u2-uh2 (Coef: %.4f)', p_U2(1));
legend_str_P = sprintf('p-ph (Coef: %.4f)', p_P(1));
legend(legend_str_U1, legend_str_U2, legend_str_P, 'Location', 'northeast');
hold off;
