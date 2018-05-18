% clc, clear all, close all force
% arquivo = 'dados_mga.xlsx';
% [num texto completo] = xlsread(arquivo);
% 
function matriz = procMedEsp(num)

[nlin ncol] = size(num);
amb = 1:1:ncol;
mediaGeral = mean(mean(num));
mediaAmbientes = mean(num);
indiceAmbiental = mediaAmbientes - mediaGeral;
indiceAmbiental = [amb;indiceAmbiental];

ambFav = find(indiceAmbiental(2,:)>0);
ambDesf = find(indiceAmbiental(2,:)<0);

mediasAmbFav = num(:,ambFav);
mediasAmbDesf = num(:,ambDesf);


matriz = [(mean(mediasAmbFav'))' (mean(mediasAmbDesf'))'];


end
