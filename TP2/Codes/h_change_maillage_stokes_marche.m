function h_change_maillage_stokes_marche(new_h_value)
% Lire le fichier .geo
filename = 'geomRectangle_partie3_marche.geo';
fileContents = fileread(filename);

% Remplacer la valeur de h par la nouvelle valeur souhaitée
pattern = 'h = [0-9]*\.?[0-9]*'; % Correspond à la ligne définissant h
replacement = sprintf('h = %.2f', new_h_value); % Remplace par la nouvelle valeur de h

% Modifier le contenu du fichier
newFileContents = regexprep(fileContents, pattern, replacement);

% Écrire les modifications dans le fichier
fid = fopen(filename, 'w');
fwrite(fid, newFileContents);
fclose(fid);

% Exécuter Gmsh pour générer le maillage du geo au msh
% J'ai téléchargé par homebrew, le path est à changer selon la localisation
% de l'outil dans le système
system('/opt/homebrew/bin/gmsh geomRectangle_partie3_marche.geo -2 -order 2 -o geomRectangle_partie3_marche.msh');
end
