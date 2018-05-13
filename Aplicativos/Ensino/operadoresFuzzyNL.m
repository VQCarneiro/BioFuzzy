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
% --------------------------Operadores Fuzzy-------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicialização
% clc, clear all, close all;
clc, clear all
%% Vetor de valores
 val = 0:0.01:10;
fpTri1 = zmf(val, [0, 10]);
fpTri2 = smf(val, [0, 10]);
[nlin ncol] = size(val);

opMin = min(fpTri1,fpTri2);
opProd = fpTri1.*fpTri2;
opMax = max(fpTri1,fpTri2);
opSoma = fpTri1 + fpTri2 - fpTri1.*fpTri2;
opComp1 = 1-fpTri1;
opComp2 = 1-fpTri2;
%% Variável
figure('Name','Operadores Fuzzy - Funções não lineares','NumberTitle','off');
subplot(3,3,1);
plot(val, fpTri1,'LineWidth',2);
hold all
plot(val, fpTri2,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Variável');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on

subplot(3,3,4);
plot(val, fpTri1,'LineWidth',2);
hold all
plot(val, fpTri2,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Variável');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on

subplot(3,3,7);
plot(val, fpTri1,'LineWidth',2);
hold all
plot(val, fpTri2,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Variável');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on

%% Intersecção

%Operador MÍNIMO
subplot(3,3,2);
plot(val, opMin,'LineWidth',2,'Color', 'black');
hold all
area(val, opMin,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Intersecção - Operador Mínimo');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on
%Operador PRODUTO ALGÉBRICO
subplot(3,3,3);
plot(val, opProd,'LineWidth',2,'Color', 'black');
hold all
area(val, opProd,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Intersecção - Operador Produto Algébrico');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on

%% União

%Operador MÁXIMO
subplot(3,3,5);
plot(val, opMax,'LineWidth',2,'Color', 'black');
hold all
area(val, opMax,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('União - Operador Máximo');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on
%Operador SOMA ALGÉBRICA
subplot(3,3,6);
plot(val, opSoma,'LineWidth',2,'Color', 'black');
hold all
area(val, opSoma,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('União - Operador Soma Algébrica');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on


%% Complemento
%Operador MÁXIMO
subplot(3,3,8);
plot(val, opComp1,'LineWidth',2,'Color', 'black');
hold all
area(val, opComp1,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Complemento de A');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on
%Operador SOMA ALGÉBRICA
subplot(3,3,9);
plot(val, opComp2,'LineWidth',2,'Color', 'black');
hold all
area(val, opComp2,'FaceColor',[0 1 1]);
set(gca,'Layer','top')
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Complemento de B');
set(gca, 'xtick', [0 2 4 6 8 10]);
set(gca, 'ytick', [0 0.25 0.5 0.75 1]);
grid on
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       ____         ____          ____         ____          ____    
%    __/_o|_\_    __/_o|_\_     __/_o|_\_    __/_o|_\_     __/_o|_\_  
%   '-o-----o-'  '-o-----o-'   '-o-----o-'  '-o-----o-'   '-o-----o-'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%