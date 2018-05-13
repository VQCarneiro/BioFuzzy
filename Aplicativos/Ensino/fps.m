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
% -------------------Fun��es de Pertin�ncias-------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicializa��o
 clc, clear all


%% Vetor de valores
 val = 0:0.01:10;
%% Fun��o Triangular
figure('Name','Fun��es de Pertin�ncias','NumberTitle','off');
   
fpTri = trimf(val, [3, 6, 8]);
subplot(2,3,1);
plot(val, fpTri,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Triangular');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o Trapezoidal

fpTrap = trapmf(val, [1, 5, 7, 8]);
subplot(2,3,2);
plot(val, fpTrap,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Trapezoidal');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on
%% Fun��o Gaussiana


fpGauss = gaussmf(val, [2, 5]);
subplot(2,3,3);
plot(val, fpGauss,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Gaussiana');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o Gaussiana


fpGauss2 = gauss2mf(val, [1, 3, 3, 4]);
subplot(2,3,4);
plot(val, fpGauss2,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Gaussiana');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o Sino


fpGbell = gbellmf(val, [2, 4, 6]);
subplot(2,3,5);
plot(val, fpGbell,'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Sino');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o Sigmoide


fpSig = sigmf(val, [2, 4]);
subplot(2,3,6);
plot(val, fpSig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Sigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on


%% Fun��o DSigmoide

figure('Name','Fun��es de Pertin�ncias','NumberTitle','off');
fpDsig = dsigmf(val, [5, 2, 5, 7]);
subplot(2,3,1:2);
plot(val, fpDsig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o DSigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o PSigmoide

% figure(2);
fpPsig = psigmf(val, [2, 3, -5, 8]);
subplot(2,3,3);
plot(val, fpPsig, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o PSigmoide');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o forma de Z


fpZmf = zmf(val, [3, 7]);
subplot(2,3,4);
plot(val, fpZmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Forma de Z');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o forma de Pi


fpPimf = pimf(val, [1 4 5 10]);
subplot(2,3,5);
plot(val, fpPimf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Forma de Pi');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on

%% Fun��o forma de S


fpSmf = smf(val, [1 8]);
subplot(2,3,6);
plot(val, fpSmf, 'LineWidth',2);
axis([-inf inf 0 1.2]);
ylabel('Pertin�ncia'); 
xlabel('Valores');
title('Fun��o Forma de S');
set(gca, 'xtick', [0 2 4 6 8 10]);
grid on
