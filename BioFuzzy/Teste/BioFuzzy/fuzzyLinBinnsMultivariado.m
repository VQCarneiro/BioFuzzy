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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Finalidade: Controlador Fuzzy (SUGENO) para recomendação de cultivares
%    após análise de estabilidade e adaptabilidade pelos métodos de Eberhart 
%    e Russell/Lin e Binns modificado 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inicialização
%clear,  close all force, clc;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-------CONTROLADOR FUZZY--------%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados Originais
function [resumo completa] = fuzzyLinBinnsMultivariado(dados, pmPid_v1,pmPif_v1,pmPid_v2,pmPif_v2)
%Dadoss = load('Pis_fuzzy.txt'); % Recebe os dados de Média em ambientes Favoráveis, Média em ambientes desfavoráveis, B1, B1+B2 e R2
Dadoss = [dados(:,2) dados(:,1) dados(:,4) dados(:,3)];
[nlins ncols] = size(Dadoss);

%% Criando o controlador Fuzzy

fis = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtaver');


%% Declarando Variáveis de Entrada
%% Variável 1
% Pi em ambientes desfavoráveis

% pmPiDesf_Var1 = 50; % Ponto de corte do Pi desfavoravel para a variável 1
pmPiDesf_Var1 = pmPid_v1; % Ponto de corte do Pi desfavoravel para a variável 1

% figure(1)
if pmPiDesf_Var1 >= 50;
Parametro1 = 2*pmPiDesf_Var1 - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*pmPiDesf_Var1 - 0;
end

fis = addvar(fis,'input','Pid-Var-1',[0 100]);
fis = addmf(fis,'input',1,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alto','smf',[Parametro1 Parametro2]);

% figure(1)
% subplot(2,2,1)
% plotmf(fis,'input',1)
% grid(gca,'minor')

% Pi em ambientes favoráveis

% pmPiFav_Var1 = 50; % Ponto de corte do Pi favoravel para a variável 1
pmPiFav_Var1 = pmPif_v1;
if pmPiFav_Var1 >= 50;
Parametro3 = 2*pmPiFav_Var1 - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*pmPiFav_Var1 - 0;
end

fis = addvar(fis,'input','Pif-Var-1',[0 100]);
fis = addmf(fis,'input',2,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',2,'Alto','smf',[Parametro3 Parametro4]);
% subplot(2,2,2)
% plotmf(fis,'input',2);
% grid(gca,'minor')

%% Variável 2
% Pi em ambientes desfavoráveis
% pmPiDesf_Var2 = 50; % Ponto de corte do Pi desfavoravel para a variável 2
pmPiDesf_Var2 = pmPid_v2;
figure(1)
if pmPiDesf_Var2 >= 50;
Parametro1 = 2*pmPiDesf_Var2 - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*pmPiDesf_Var2 - 0;
end

fis = addvar(fis,'input','Pid-Var-2',[0 100]);
fis = addmf(fis,'input',3,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',3,'Alto','smf',[Parametro1 Parametro2]);

% figure(1)
% subplot(2,2,3)
% plotmf(fis,'input',3)
% grid(gca,'minor')

% Pi em ambientes favoráveis

% pmPiFavf_Var1 = 50; % Ponto de corte do Pi favoravel para a variável 2
pmPiFav_Var2 = pmPif_v2;
if pmPiFav_Var2 >= 50;
Parametro3 = 2*pmPiFav_Var2 - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*pmPiFav_Var2 - 0;
end

fis = addvar(fis,'input','Pif-Var-2',[0 100]);
fis = addmf(fis,'input',4,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',4,'Alto','smf',[Parametro3 Parametro4]);
% subplot(2,2,4)
% plotmf(fis,'input',4);
% grid(gca,'minor')


%% Declarando variáveis de saída

fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favoravel','constant',[75]);
fis = addmf(fis,'output',1,'Desfavoravel','constant',[50]);
fis = addmf(fis,'output',1,'Pouco-adaptado','constant',[25]);

% figure(1)
% subplot(3,3,8)
% plotmf(fis,'output',1)
% grid(gca,'minor')

%% Rules
ruleList=[
1 1 1 1 1 1 1
2 1 2 1 2 1 1
2 1 1 1 2 1 1
1 1 2 1 2 1 1
1 2 1 2 3 1 1
1 1 1 2 3 1 1
1 2 1 1 3 1 1
2 2 2 2 4 1 1
1 2 2 2 4 1 1
2 1 2 2 4 1 1
2 2 1 2 4 1 1
2 2 2 1 4 1 1
1 1 2 2 4 1 1
2 2 1 1 4 1 1
1 2 2 1 4 1 1
2 1 1 2 4 1 1
];
fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
% fuzzy(fis)

%writefis(fis,'Recomendacao');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-----ANÁLISE DOS DADOS REAIS----%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados Pi em ambientes desfavoráveis para a variável 1

pidVar1 = Dadoss(1:nlins,1);
[nlinpidVar1 ncolpidVar1] = size(pidVar1);

%% Padronização do Pi em ambientes desfavoráveis para a Variável 1

medPidVar1 = mean(pidVar1); % Média dos valores da média geral
variancia_pidVar1 = var(pidVar1); % Variância dos valores da média geral
DP_pidVar1 = sqrt(variancia_pidVar1); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_pidVar1; % Valor de 3 vezes o desvio padrão
minimopidVar1 = medPidVar1 - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximopidVar1 = medPidVar1 + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizpidVar1 = [minimopidVar1;maximopidVar1]; 

entradapidVar1 = Normatiza(pidVar1',matrizpidVar1',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradapidVar1 = entradapidVar1';


Pid_Original_Padronizado_Var1 = [pidVar1 entradapidVar1]; % Comparação entre os valores originais e os padronizados

%% Dados Pi em ambientes desfavoráveis para a variável 1

pifVar1 = Dadoss(1:nlins,2);
[nlinpifVar1 ncolpifVar1] = size(pifVar1);

%% Padronização do Pi em ambientes favoráveis para a Variável 1

medPifVar1 = mean(pifVar1); % Média dos valores da média geral
variancia_pifVar1 = var(pifVar1); % Variância dos valores da média geral
DP_pifVar1 = sqrt(variancia_pifVar1); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_pifVar1; % Valor de 3 vezes o desvio padrão
minimopifVar1 = medPifVar1 - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximopifVar1 = medPifVar1 + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizpifVar1 = [minimopifVar1;maximopifVar1]; 

entradapifVar1 = Normatiza(pifVar1',matrizpifVar1',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradapifVar1 = entradapifVar1';


Pif_Original_Padronizado_Var1 = [pifVar1 entradapifVar1]; % Comparação entre os valores originais e os padronizados



%% Dados Pi em ambientes desfavoráveis para a variável 2

pidVar2 = Dadoss(1:nlins,3);
[nlinpidVar2 ncolpidVar2] = size(pidVar2);

%% Padronização do Pi em ambientes desfavoráveis para a Variável 1

medPidVar2 = mean(pidVar2); % Média dos valores da média geral
variancia_pidVar2 = var(pidVar2); % Variância dos valores da média geral
DP_pidVar2 = sqrt(variancia_pidVar2); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_pidVar2; % Valor de 3 vezes o desvio padrão
minimopidVar2 = medPidVar2 - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximopidVar2 = medPidVar2 + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizpidVar2 = [minimopidVar2;maximopidVar2]; 

entradapidVar2 = Normatiza(pidVar2',matrizpidVar2',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradapidVar2 = entradapidVar2';


Pid_Original_Padronizado_Var2 = [pidVar2 entradapidVar2]; % Comparação entre os valores originais e os padronizados

%% Dados Pi em ambientes favoráveis para a variável 2

pifVar2 = Dadoss(1:nlins,4);
[nlinpifVar2 ncolpifVar2] = size(pifVar2);

%% Padronização do Pi em ambientes favoráveis para a Variável 1

medPifVar2 = mean(pifVar2); % Média dos valores da média geral
variancia_pifVar2 = var(pifVar2); % Variância dos valores da média geral
DP_pifVar2 = sqrt(variancia_pifVar2); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_pifVar1; % Valor de 3 vezes o desvio padrão
minimopifVar2 = medPifVar2 - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximopifVar2 = medPifVar2 + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizpifVar2 = [minimopifVar2;maximopifVar2]; 

entradapifVar2 = Normatiza(pifVar2',matrizpifVar2',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradapifVar2 = entradapifVar2';


Pif_Original_Padronizado_Var2 = [pifVar2 entradapifVar2]; % Comparação entre os valores originais e os padronizados



%% Parametros

ordem = 1:nlins;
ordem = ordem';
parametros_padronizados = [ordem entradapidVar1 entradapifVar1 entradapidVar2 entradapifVar2]; % Dados padronizados de média geral e de B1
[nlinparametros_padronizados ncolparametros_padronizados] = size(parametros_padronizados);

%% Recebendo o controlador fuzzy montado
%% Obtendo os valores de saida para o controlador multivariado

%[outputs_BIS, ER, ERR, PertPorRegra] = evalfis(parametros_padronizados(1,2:6),fis,1); % Submetendo os genótipos (valores de média geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.
%[outputs_ER, ER, ERR, PertPorRegra]= evalfis( [57.2 2.434 62.72],fis,1); % Submetendo os genótipos (valores de média geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.

PertRegras = [];

for i = 1:nlins
    [E, ER, ERR, PertPorRegra]= evalfis(parametros_padronizados(i,2:5),fis,1);
    %[a, Pert_Entrada, b, c]= evalfis(dados(i,:),fisSOM ,10000); 

    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';
PertRegras2 = num2cell(PertRegras2);
cabRegrasMult = {'Regra1', 'Regra2', 'Regra3', 'Regra4' , 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12', 'Regra13', 'Regra14', 'Regra15', 'Regra16'};
MatrizPertsSaidaMult = [cabRegrasMult; PertRegras2];
% MatrizPertsSaidaMult = tabela(PertRegras2,cabRegrasMult); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências


%% Primeira Saida - Cinco grupos (Ruim-Desfavoravel, Desfavoravel, Geral, Favoravel e Ruim-Favoravel) - Disjuntos
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertPoucoAdaptado = max(PertRegras(8:16,k));
PertGeral = max(PertRegras(1,k));
PertFavoravel = max(PertRegras(2:4,k));
PertDesfavoravel = max(PertRegras(5:7,k));
Perts = [PertGeral PertPoucoAdaptado PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
%Pert_Output_ER2 = [PertGeral PertPoucoAdaptado PertFavoravel PertDesfavoravel]; 
DadosOutput2ER = [parametros_padronizados(1:nlins,:) pertinencias]; % Dados padronizados de média geral, B1 e R2 e suas pertinências
DadosOutput2ER = num2cell(DadosOutput2ER);
cabRegrasMult = {'Genótipos', 'pidVar1' , 'pifVar1','pidVar2', 'pifVar2','Geral' , 'PA','Favorável', 'Desfavorável'};
MatrizPertsSaidaER2 = [cabRegrasMult;DadosOutput2ER];

% MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cabRegrasMult); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%--------Resultados-------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matriz = cell(nlins,5);
cabecalho = {'Genótipos' 'Classificação' 'Comportamento' ' ' 'Pertinencia'};
[nl nc] = size(cabecalho);

for h = 1:nc
    
    matriz{1,h} = cabecalho{1,h};
end

for i = 1:nlins
       
    matriz{i+1,1} = ordem(i,1);
    
end

    
for j = 1:nlins
  %rec = Pert_Output_ER2(j,:);
    rec = pertinencias(j,:);
  posicao = find(rec > 0.50);
  
  matriz{j+1,2} = posicao;
  
end
   
for k = 1:nlins
  valor = matriz{k+1,2};  
  
switch valor
    case 1
    matriz{k+1,3} = 'Ampla Adaptabilidade';
    
    case 2
    matriz{k+1,3} = 'Pouco Adaptado';
    
    case 3
    matriz{k+1,3} = 'Favoravel';
    
    case 4
    matriz{k+1,3} = 'Desfavoravel';
    
       
end
end

for w = 1:nlins
  %rec = Pert_Output_ER2(w,:);
  rec = pertinencias(w,:);
    
  posicao = find(rec > 0.50);
  
  %matriz{w+1,5} = Pert_Output_ER2(w, posicao);
  matriz{w+1,5} = pertinencias(w, posicao);
  
end

matrizcomp = matriz(:,1:2:5);

% filename = 'Pertinencias_Multivariado.xlsx';
% xlswrite(filename,MatrizPertsSaidaER2)

% filename = 'Recomendacao_Multivariada.xlsx';
% xlswrite(filename,matrizcomp)
resumo = matrizcomp;
completa = MatrizPertsSaidaER2;


%% Imprimir Resultados


disp('------------------------------------------------------------------------------------------------')
disp('---------------------------------------Resultados-----------------------------------------------')
disp('------------------------------------------------------------------------------------------------')
disp('Classificação dos genótipos quanto a seu comportamento')
matrizcomp
MatrizPertsSaidaER2