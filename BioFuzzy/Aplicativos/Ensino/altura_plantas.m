%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      __  _                      Desenvolvedor: Vin�cius Quint�o Carneiro   
%      .-.'  `; `-._  __  _       Contato: vqcarneiro@gmail.com
%     (_,         .-:'  `; `-._
%   ,'o"(        (_,           )
%  (__,-'      ,'o"(            )>
%     (       (__,-'            )
%      `-'._.--._(             )
%         |||  |||`-'._.--._.-'
%                    |||  |||
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------Vari�vel Fuzzy Lingu�stica--------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Requer fun��o tabela (tabela.m)
%% Inicializa��o
% clc, clear all, close all;
clc, clear all

%% Vetor de Entradas

% Valores Geradores das Fun��es
val = 20:0.001:100; 
[nlin ncol] = size(val);

% Simula��o de Dados
Dados = 50 + 22.*randn(15,1);

% Valores para Avaliar as Pertin�ncias
vetorAlturas = Dados';
%vetorAlturas = 20:5:100;
[nlinN ncolN] = size(vetorAlturas);



%% Vari�vel: Notas 

% Fun��es lineares - Fun��es Triangular
figure('Name','Altura de Plantas','NumberTitle','on');

fpTrBaixa = trapmf(val, [0 0 20 50]);
pertTrBaixa = trapmf(vetorAlturas, [0 0 20 50]);


fpTrMedia = trimf(val, [20 50 80]);
pertTrMedia = trimf(vetorAlturas, [20 50 80]);

fpTrAlta = trapmf(val, [50 80 inf inf]);
pertTrAlta = trapmf(vetorAlturas, [50 80  inf inf]);

pertinenciasLineares = [pertTrBaixa; pertTrMedia; pertTrAlta];
pertinenciasLineares = pertinenciasLineares';

% Graficos das fun��es lineares - Fun��es Triangulares

subplot(1,2,1);
plot(val, fpTrBaixa, 'LineWidth',2);
hold all
plot(val, fpTrMedia,  'LineWidth',2);
hold all
plot(val, fpTrAlta,  'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Alturas');
title('Fun��es Lineares');
set(gca, 'xtick', [20 35 50 65 80], 'ytick', [0 0.25 0.5 0.75 1]);
grid on

% Fun��es n�o lineares - Fun��es forma de z, Pi e S

fpZBaixa = zmf(val, [20 50]);
pertZBaixa = zmf(vetorAlturas, [20 50]);

fpPiMedia = pimf(val, [20 50 50 80]);
pertPiMedia = pimf(vetorAlturas, [20 50 50 80]);

fpSAlta = smf(val, [50 80]);
pertSAlta = smf(vetorAlturas, [50 80]);

pertinenciasNaoLineares = [pertZBaixa; pertPiMedia; pertSAlta];
pertinenciasNaoLineares = pertinenciasNaoLineares';


% Graficos das fun��es n�o lineares - Fun��es forma de z, Pi e S


subplot(1,2,2);
plot(val, fpZBaixa, 'LineWidth',2);
hold all
plot(val, fpPiMedia,  'LineWidth',2);
hold all
plot(val, fpSAlta,  'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Alturas');
title('Fun��es N�o Lineares');
set(gca, 'xtick', [20 35 50 65 80], 'ytick', [0 0.25 0.5 0.75 1]);
grid on

%% Compara��o
pertinencias1 = [vetorAlturas' pertinenciasLineares];
pertinencias2 = [vetorAlturas' pertinenciasNaoLineares];
cabe1 = {'Altura' 'Baixa' 'Media' 'Alta'};
cabe2 = {'Altura' 'Baixa' 'Media' 'Alta'};

tab1 = tabela(pertinencias1,cabe1);
tab2 = tabela(pertinencias2,cabe2);
%% Resultados

if (exist('C:\BioFuzzy\Word\ex_Altura_Plantas.txt'))~=0
    delete('C:\BioFuzzy\Word\ex_Altura_Plantas.txt');
else
end
diary on;
diary('C:\BioFuzzy\Word\ex_Altura_Plantas.txt');
disp('-------------------------------------------------------------------------');
disp('-----------------------------BIOFUZZY------------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vin�cius Quint�o Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMA��ES---------------------------------');
disp(' ')
disp('- - - - - - - - - - - EXEMPLO - ALTURA DE PLANTAS - - - - - - - -  - - -');
disp(' ')
disp('-------------------------------------------------------------------------')
disp('---------------------------Resultados------------------------------------')
disp('-------------------------------------------------------------------------')
disp(' ')
disp('Pertin�ncias das alturas por fu��es lineares')
disp(' ')
disp(tab1)
disp(' ')
disp('Pertin�ncias das alturas por fu��es n�o lineares')
disp(' ')
disp(tab2)
disp(' ')
diary off;
winopen('C:\BioFuzzy\Word\ex_Altura_Plantas.txt');

