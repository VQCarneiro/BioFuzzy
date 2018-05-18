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
% -------------------Variável Fuzzy Linguística----------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Requer função tabela (tabela.m)
%% Inicialização
% clc, clear all, close all;
clc, clear all
%% Vetor de Entradas
val = 0:0.1:100; 
[nlin ncol] = size(val);
vetorIdades = 10:10:100;
[nlinVI ncolVI] = size(vetorIdades);
%% Teoria de Conjuntos clássicos

vetor = zeros(1,ncol);
vetorPertinencias =  zeros(1,ncolVI);

% Função Bivalente

for i = 1:ncol 
if val(1,i) >= 60
    
    vetor(1,i) = 1;
   
else
    vetor(1,i) = 0;
   
end
end
figure('Name','Variáveis Linguísticas','NumberTitle','off');

subplot(1,2,1);
plot(val, vetor,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinências'); 
xlabel('Idades');
title('Função Bivalente (Crisp)');
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

% Função forma de S


fpSmf = smf(val, [20 100]);
subplot(1,2,2);
plot(val, fpSmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinências'); 
xlabel('Idades');
title('Função Forma de S');
set(gca, 'xtick', [0 20 40 60 70 80 100]);
grid on

fpSmf = smf(vetorIdades, [20 100]);
vetorPossibilidades = fpSmf;
%% Comparação
cabe = {'Idades' 'Pertinências Bivalentes' 'Pertinências Fuzzy'};
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
disp('Desenvolvedor: Vinícius Quintão Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMAÇÕES---------------------------------');
disp(' ')
disp('- - - - - - - - -  - - - - EXEMPLO - IDADES - - - - - - - - - - - - - - -');
disp(' ')
disp('-------------------------------------------------------------------------')
disp('---------------------------Resultados------------------------------------')
disp('-------------------------------------------------------------------------')
disp(' ')
disp('Pertinências das pessoas quanto a idade por conjuntos bivalentes e por conjuntos Fuzzy')
disp(' ')
disp(tab)
disp(' ')
diary off;
winopen('C:\BioFuzzy\Word\ex_Idades.txt');


