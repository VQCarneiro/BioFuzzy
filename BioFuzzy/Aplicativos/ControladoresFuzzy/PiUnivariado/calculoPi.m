%clc, clear all, close all force

%% Entradas
function [matrizPi matrizPigOrdenada matrizPifOrdenada matrizPidOrdenada] = calculoPi(mga)
%[numerico texto completo] = xlsread('dadosGirassolProd_mga.xlsx');
format bank
numerico = mga;
dados = numerico(:,2:end);
mediasAmbientais = mean(dados);
mediaGeral = mean(mediasAmbientais);
indice = mediasAmbientais - mediaGeral;

dadosInf = [indice; dados];
dadosOrdenado = sortrows(dadosInf',1);
dadosNovos = dadosOrdenado';
ideotipo = max(dados);
[nlin ncol] = size(dados);
contDesf = 1;
contFav = 1;
dadosDesf = [];
dadosFav = [];

for j = 1:ncol
   
    if dadosNovos(1,j)<0
        
        dadosDesf(:,contDesf) = dadosNovos(2:end,j);
        contDesf = contDesf + 1;
    else
        dadosFav(:,contFav) = dadosNovos(2:end,j);
        contFav = contFav + 1;
    
end
end


ideotipoFavoravel = max(dadosFav);

[nlinF ncolF] = size(dadosDesf);
 for i = 1:nlinF
 difF = dadosFav(i,:) - ideotipoFavoravel;
 difAoQuadF = difF.^2;
 Pif(i,1) = sum(difAoQuadF);
 end
Pif = Pif/(2*ncolF);
 
 
ideotipoDesfavoravel = max(dadosDesf);

[nlinD ncolD] = size(dadosDesf);
 for i = 1:nlinD
 difD = dadosDesf(i,:) - ideotipoDesfavoravel;
 difAoQuadD = difD.^2;
 Pid(i,1) = sum(difAoQuadD);
end
Pid = Pid/(2*ncolD);

[nlin ncol] = size(dados);
for i = 1:nlin
dif = dados(i,:) - ideotipo;
difAoQuad = dif.^2;
Pig(i,1) = sum(difAoQuad);
end
Pig = Pig/(2*ncol);
matrizPi = [numerico(:,1) Pig Pif Pid];
matrizPi = num2cell(matrizPi);
rotulos1 = {'Genótipos', 'Pi', 'Pif', 'Pid'};
matrizPi = [rotulos1; matrizPi];

matrizPig = [numerico(:,1) Pig];
matrizPigOrdenada = sortrows(matrizPig,2);
matrizPigOrdenada = num2cell(matrizPigOrdenada);
rotulos2 = {'Genótipos', 'Pi'};
matrizPigOrdenada = [rotulos2; matrizPigOrdenada];

matrizPif = [numerico(:,1) Pif];
matrizPifOrdenada = sortrows(matrizPif,2);
matrizPifOrdenada = num2cell(matrizPifOrdenada);
rotulos3 = {'Genótipos', 'Pif'};
matrizPifOrdenada = [rotulos3; matrizPifOrdenada];

matrizPid = [numerico(:,1) Pid];
matrizPidOrdenada = sortrows(matrizPid,2);
matrizPidOrdenada = num2cell(matrizPidOrdenada);
rotulos4 = {'Genótipos', 'Pid'};
matrizPidOrdenada = [rotulos4; matrizPidOrdenada];

