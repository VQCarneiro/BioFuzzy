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
% -------------------Funções de Pertinências-------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicialização
 clc, clear all


%% Vetor de valores
 val = 0:0.01:10;
%% Função Triangular
figure('Name','Funções de Pertinências','NumberTitle','off');
   
fpTri = trimf(val, [3, 6, 8]);
subplot(2,3,1);
plot(val, fpTri,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Triangular');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função Trapezoidal

fpTrap = trapmf(val, [1, 5, 7, 8]);
subplot(2,3,2);
plot(val, fpTrap,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Trapezoidal');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on
%% Função Gaussiana


fpGauss = gaussmf(val, [2, 5]);
subplot(2,3,3);
plot(val, fpGauss,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Gaussiana');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função Gaussiana


fpGauss2 = gauss2mf(val, [1, 3, 3, 4]);
subplot(2,3,4);
plot(val, fpGauss2,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Gaussiana');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função Sino


fpGbell = gbellmf(val, [2, 4, 6]);
subplot(2,3,5);
plot(val, fpGbell,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Sino');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função Sigmoide


fpSig = sigmf(val, [2, 4]);
subplot(2,3,6);
plot(val, fpSig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Sigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on


%% Função DSigmoide

figure('Name','Funções de Pertinências','NumberTitle','off');
fpDsig = dsigmf(val, [5, 2, 5, 7]);
subplot(2,3,1:2);
plot(val, fpDsig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função DSigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função PSigmoide

% figure(2);
fpPsig = psigmf(val, [2, 3, -5, 8]);
subplot(2,3,3);
plot(val, fpPsig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função PSigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função forma de Z


fpZmf = zmf(val, [3, 7]);
subplot(2,3,4);
plot(val, fpZmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Forma de Z');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função forma de Pi


fpPimf = pimf(val, [1 4 5 10]);
subplot(2,3,5);
plot(val, fpPimf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Forma de Pi');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Função forma de S


fpSmf = smf(val, [1 8]);
subplot(2,3,6);
plot(val, fpSmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertinência'); 
xlabel('Valores');
title('Função Forma de S');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on
