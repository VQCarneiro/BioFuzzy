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
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------Vari�veis Fuzzy Lingu�sticas-------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Requer fun��o tabela (tabela.m)
%% Inicializa��o
clc, clear all;
% clc, clear all, close all;

%% Vetor de Entradas
val = 0:0.001:100; 
[nlin ncol] = size(val);
vetorNotas = 20:10:100;
[nlinN ncolN] = size(vetorNotas);

%% Vari�vel: Notas 

% Fun��es lineares - Fun��es Triangular
figure('Name','Vari�veis Fuzzy Lingu�sticas','NumberTitle','off');

fpTrBaixa = trimf(val, [0 0 50]);
pertTrBaixa = trimf(vetorNotas, [0 0 50]);

fpTrMedia = trimf(val, [0 50 100]);
pertTrMedia = trimf(vetorNotas, [0 50 100]);

fpTrAlta = trimf(val, [50 100 100]);
pertTrAlta = trimf(vetorNotas, [50 100 100]);

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
xlabel('Notas');
title('Fun��es Lineares');
set(gca, 'xtick', [0 20 40 60 80 100]);
grid on

% Fun��es n�o lineares - Fun��es forma de z, Pi e S

fpZBaixa = zmf(val, [0 50]);
pertZBaixa = zmf(vetorNotas, [0 50]);

fpPiMedia = pimf(val, [0 50 50 100]);
pertPiMedia = pimf(vetorNotas, [0 50 50 100]);

fpSAlta = smf(val, [50 100]);
pertSAlta = smf(vetorNotas, [50 100]);

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
xlabel('Notas');
title('Fun��es N�o Lineares');
set(gca, 'xtick', [0 20 40 60 80 100]);
grid on

%% Compara��o
pertinenciasLineares = pertinenciasLineares*100;
pertinenciasNaoLineares = pertinenciasNaoLineares*100;
pertinencias1 = [vetorNotas' pertinenciasLineares];
pertinencias2 = [vetorNotas' pertinenciasNaoLineares];
cabe1 = {'Notas' 'Baixa' 'Media' 'Alta'};
cabe2 = {'Notas' 'Baixa' 'Media' 'Alta'};
tab1 = tabela(pertinencias1,cabe1);
tab2 = tabela(pertinencias2,cabe2);
%% Resultados
if (exist('C:\BioFuzzy\Word\ex_Notas.txt'))~=0
    delete('C:\BioFuzzy\Word\ex_Notas.txt');
else
end
diary on;

diary('C:\BioFuzzy\Word\ex_Notas.txt');
disp('-------------------------------------------------------------------------');
disp('-----------------------------BIOFUZZY------------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vin�cius Quint�o Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMA��ES---------------------------------');
disp(' ')
disp('- - - - - - - - - - - EXEMPLO - NOTAS ESCOLARES - - - - - - - - - - - - -');
disp(' ')
disp('-------------------------------------------------------------------------')
disp('---------------------------Resultados------------------------------------')
disp('-------------------------------------------------------------------------')
disp(' ')
disp('Pertin�ncias das notas por fu��es lineares')
disp(' ')
disp(tab1)
disp(' ')
disp('Pertin�ncias das notas por fu��es n�o lineares')
disp(' ')
disp(tab2)
disp(' ')
diary off;
winopen('C:\BioFuzzy\Word\ex_Notas.txt');