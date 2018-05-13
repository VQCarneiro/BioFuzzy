%  clc, clear all, close all force
%  num = load('C:\BioFuzzy\Exemplos\prj0002_FCM_GXA\prj0002.txt');

function matriz = procCentroides(num)

[nlin ncol] = size(num);
amb = 1:1:ncol;
mediaGeral = mean(mean(num));
mediaAmbientes = mean(num);
indiceAmbiental = mediaAmbientes - mediaGeral;
indiceAmbiental = [amb;indiceAmbiental];

ambFav = find(indiceAmbiental(2,:)>0);
ambDesf = find(indiceAmbiental(2,:)<0);

% Ideótipos Maxima Adaptabilidade Geral

% fatorInicial = 1.001;
% fatorFinal = 1.05;
% pulo=0.001;
% cont = 1;
% for j = fatorInicial:pulo:fatorFinal;
%     matrizIdeotipoAmpla(cont,:)=(max(num(:,:)))*j;
%     cont = cont+1;
% 
% end
matrizIdeotipos(1,:) = max(num(:,:));
matrizIdeotipoAmpla = repmat(matrizIdeotipos(1,:),250,1);



% Ideótipos Mínima Adaptabilidade

% cont = 1;
% for j = fatorInicial:pulo:fatorFinal;
%     matrizIdeotipoPouco(cont,:)=(min(num(:,:)))*j;
%     cont = cont+1;
% 
% end

matrizIdeotipos(4,:) = min(num(:,:));
matrizIdeotipoPouco = repmat(matrizIdeotipos(4,:),250,1);
% Ideótipos Máxima Adaptabilidade a Ambientes Favoráveis

% cont = 1;
% matrizIdeotipoFavoravel = [];
% for j = fatorInicial:pulo:fatorFinal;
%     matrizIdeotipoFavoravel(cont,ambFav)=(max(num(:,ambFav)))*j;
%     matrizIdeotipoFavoravel(cont,ambDesf)=(min(num(:,ambDesf)))*(1-(j-1));
%     cont = cont+1;
% 
% end

matrizIdeotipos(2,ambFav) = max(num(:,ambFav));
matrizIdeotipos(2,ambDesf) = min(num(:,ambDesf));

matrizIdeotipoFavoravel = repmat(matrizIdeotipos(2,:),250,1);

% Ideótipos Máxima Adaptabilidade a Ambientes Desfavoráveis

% cont = 1;
% matrizIdeotipoDesfavoravel = [];
% for j = fatorInicial:pulo:fatorFinal;
% 
%     matrizIdeotipoDesfavoravel(cont,ambFav)=(min(num(:,ambFav)))*(1-(j-1));
%     matrizIdeotipoDesfavoravel(cont,ambDesf)=(max(num(:,ambDesf)))*j;
%     cont = cont+1;
% 
% end

matrizIdeotipos(3,ambFav) = min(num(:,ambFav));
matrizIdeotipos(3,ambDesf) = max(num(:,ambDesf));
matrizIdeotipoDesfavoravel = repmat(matrizIdeotipos(3,:),250,1);

matriz = [num;matrizIdeotipoAmpla;matrizIdeotipoFavoravel;matrizIdeotipoDesfavoravel;matrizIdeotipoPouco;matrizIdeotipos];



%figure(1)
%plot(matriz(:,2), matriz(:,1), 'r.')

% end

