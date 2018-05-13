%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      __  _                      Desenvolvedor: Vinícius Quintão Carneiro   
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
% --------------------Variáveis Fuzzy Linguísticas-------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Requer função tabela (tabela.m)
%% Inicialização
clc, clear all;
% clc, clear all, close all;

%% Vetor de Entradas
val = 0:0.001:100; 
[nlin ncol] = size(val);
vetorNotas = 20:10:100;
[nlinN ncolN] = size(vetorNotas);

%% Variável: Notas 

% Funções lineares - Funções Triangular
figure('Name','Variáveis Fuzzy Linguísticas','NumberTitle','off');

fpTrBaixa = trimf(val, [0 0 50]);
pertTrBaixa = trimf(vetorNotas, [0 0 50]);

fpTrMedia = trimf(val, [0 50 100]);
pertTrMedia = trimf(vetorNotas, [0 50 100]);

fpTrAlta = trimf(val, [50 100 100]);
pertTrAlta = trimf(vetorNotas, [50 100 100]);

pertinenciasLineares = [pertTrBaixa; pertTrMedia; pertTrAlta];
pertinenciasLineares = pertinenciasLineares';

% Graficos das funções lineares - Funções Triangulares

subplot(1,2,1);
plot(val, fpTrBaixa, 'LineWidth',2);
hold all
plot(val, fpTrMedia,  'LineWidth',2);
hold all
plot(val, fpTrAlta,  'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Notas');
title('Funções Lineares');
set(gca, 'xtick', [0 20 40 60 80 100]);
grid on

% Funções não lineares - Funções forma de z, Pi e S

fpZBaixa = zmf(val, [0 50]);
pertZBaixa = zmf(vetorNotas, [0 50]);

fpPiMedia = pimf(val, [0 50 50 100]);
pertPiMedia = pimf(vetorNotas, [0 50 50 100]);

fpSAlta = smf(val, [50 100]);
pertSAlta = smf(vetorNotas, [50 100]);

pertinenciasNaoLineares = [pertZBaixa; pertPiMedia; pertSAlta];
pertinenciasNaoLineares = pertinenciasNaoLineares';


% Graficos das funções não lineares - Funções forma de z, Pi e S


subplot(1,2,2);
plot(val, fpZBaixa, 'LineWidth',2);
hold all
plot(val, fpPiMedia,  'LineWidth',2);
hold all
plot(val, fpSAlta,  'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Notas');
title('Funções Não Lineares');
set(gca, 'xtick', [0 20 40 60 80 100]);
grid on

%% Comparação
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
disp('Desenvolvedor: Vinícius Quintão Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMAÇÕES---------------------------------');
disp(' ')
disp('- - - - - - - - - - - EXEMPLO - NOTAS ESCOLARES - - - - - - - - - - - - -');
disp(' ')
disp('-------------------------------------------------------------------------')
disp('---------------------------Resultados------------------------------------')
disp('-------------------------------------------------------------------------')
disp(' ')
disp('Pertinências das notas por fuções lineares')
disp(' ')
disp(tab1)
disp(' ')
disp('Pertinências das notas por fuções não lineares')
disp(' ')
disp(tab2)
disp(' ')
diary off;
winopen('C:\BioFuzzy\Word\ex_Notas.txt');