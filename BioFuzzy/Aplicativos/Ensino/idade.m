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
% -------------------Vari�vel Fuzzy Lingu�stica----------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Requer fun��o tabela (tabela.m)
%% Inicializa��o
% clc, clear all, close all;
clc, clear all
%% Vetor de Entradas
val = 0:0.1:100; 
[nlin ncol] = size(val);
vetorIdades = 10:10:100;
[nlinVI ncolVI] = size(vetorIdades);
%% Teoria de Conjuntos cl�ssicos

vetor = zeros(1,ncol);
vetorPertinencias =  zeros(1,ncolVI);

% Fun��o Bivalente

for i = 1:ncol 
if val(1,i) >= 60
    
    vetor(1,i) = 1;
   
else
    vetor(1,i) = 0;
   
end
end
figure('Name','Vari�veis Lingu�sticas','NumberTitle','off');

subplot(1,2,1);
plot(val, vetor,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncias'); 
xlabel('Idades');
title('Fun��o Bivalente (Crisp)');
set(gca, 'xtick', [0 20 40 60 80 100]);
grid on


% Exemplo

for j = 1:ncolVI 
if vetorIdades(1,j) >= 60
    
   
    vetorPertinencias(1,j) = 1;
else
    
    vetorPertinencias(1,j) = 0;
end
end



%% Teoria de Conjuntos Fuzzy 

% Fun��o forma de S


fpSmf = smf(val, [20 100]);
subplot(1,2,2);
plot(val, fpSmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncias'); 
xlabel('Idades');
title('Fun��o Forma de S');
set(gca, 'xtick', [0 20 40 60 70 80 100]);
grid on

fpSmf = smf(vetorIdades, [20 100]);
vetorPossibilidades = fpSmf;
%% Compara��o
cabe = {'Idades' 'Pertin�ncias Bivalentes' 'Pertin�ncias Fuzzy'};
matrizPertinencias = [vetorIdades' vetorPertinencias' fpSmf'];
tab = tabela(matrizPertinencias,cabe);


%% Resultados
if (exist('C:\BioFuzzy\Word\ex_Idades.txt'))~=0
    delete('C:\BioFuzzy\Word\ex_Idades.txt');
else
end
diary on;

diary('C:\BioFuzzy\Word\ex_Idades.txt');
disp('-------------------------------------------------------------------------');
disp('-----------------------------BIOFUZZY------------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vin�cius Quint�o Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMA��ES---------------------------------');
disp(' ')
disp('- - - - - - - - -  - - - - EXEMPLO - IDADES - - - - - - - - - - - - - - -');
disp(' ')
disp('-------------------------------------------------------------------------')
disp('---------------------------Resultados------------------------------------')
disp('-------------------------------------------------------------------------')
disp(' ')
disp('Pertin�ncias das pessoas quanto a idade por conjuntos bivalentes e por conjuntos Fuzzy')
disp(' ')
disp(tab)
disp(' ')
diary off;
winopen('C:\BioFuzzy\Word\ex_Idades.txt');


