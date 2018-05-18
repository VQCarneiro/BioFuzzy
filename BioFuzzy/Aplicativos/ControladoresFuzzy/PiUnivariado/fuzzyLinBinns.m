%clc, clear, close all
%% Operador Fuzzy - Adaptabilidade e Estabilidade
%% M�todo - lin e Bins
%% 12/06/2015

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-------CONTROLADOR FUZZY--------%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [matrizcomp MatrizPertsSaidaER2] = fuzzyLinBinns(dados,PMFAV,PMDESF)
dados = cell2mat(dados(2:end,3:4));
Dados = dados;
%% Declarando par�metros

%PMFAV = 40; % Ponto de corte do Pi para ambientes favoraveis
%PMDESF = 40; % Ponto de corte do Pi para ambientes desfavor�veis

%% Dados Originais

%Dados = load('pi.txt'); % Recebe os dados de M�dia Geral, B1 e R2
[nlin ncol] = size(Dados);

%% Criando o controlador Fuzzy

fis = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtsum');


%% Vari�vel: M�dia Geral

% figure(1)
if PMFAV >= 50;
Parametro1 = 2*PMFAV - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMFAV - 0;
end

fis = addvar(fis,'input','Pif',[0 100]);
fis = addmf(fis,'input',1,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alto','smf',[Parametro1 Parametro2]);
% subplot(2,1,1)
% plotmf(fis,'input',1)
%grid(gca,'minor')

%% Vari�vel: R2

if PMDESF >= 50;
Parametro3 = 2*PMDESF - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMDESF - 0;
end

fis = addvar(fis,'input','Pid',[0 100]);
fis = addmf(fis,'input',2,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',2,'Alto','smf',[Parametro3 Parametro4]);
% subplot(2,1,2)
% plotmf(fis,'input',2);
%grid(gca,'minor')
%% Sa�da

fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favoravel','constant',[75]);
fis = addmf(fis,'output',1,'Desfavoravel','constant',[50]);
fis = addmf(fis,'output',1,'Pouco Adaptado','constant',[25]);

%subplot(213)
%plotmf(fis,'output',1)
%grid(gca,'minor')
%% Rules
ruleList=[1 1 1 1 1
1 2 2 1 1 
2 1 3 1 1 
2 2 4 1 1
 ];


fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
%fuzzy(fis)

%writefis(fis,'Recomendacao');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-----AN�LISE DOS DADOS REAIS----%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados Pi Favor�vel

Pif = Dados(1:nlin,1);
[nlinPif ncolPif] = size(Pif);

%% Padroniza��o do pif

%minimoPif = min(Pif); % Valor m�nimo do pif
%maximoPif = max(Pif); % Valor m�ximo do pid

%matrizPif = [minimoPif;maximoPif]; 

%entradaPif = Normatiza(Pif',matrizPif',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
%entradaPif = entradaPif';

%% Padroniza��o do pif

MEDPif = mean(Pif); % M�dia dos valores da m�dia geral
variancia_Pif = var(Pif); % Vari�ncia dos valores da m�dia geral
DP_Pif = sqrt(variancia_Pif); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_Pif; % Valor de 3 vezes o desvio padr�o
minimoPif = MEDPif - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoPif = MEDPif + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizPif = [minimoPif;maximoPif]; 

entradaPif = Normatiza(Pif',matrizPif',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaPif = entradaPif';


PifOR_PAD = [Pif entradaPif]; % Compara��o entre os valores originais e os padronizados


%% Dados Pi Desfavor�vel

Pid = Dados(1:nlin,2);
[nlinPid ncolPid] = size(Pid);

%% Padroniza��o das M�dias Gerais

%minimoPid = min(Pid); % Valor m�nimo do pif
%maximoPid = max(Pid); % Valor m�ximo do pid

%matrizPid = [minimoPid;maximoPid]; 

%entradaPid = Normatiza(Pid',matrizPid',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
%entradaPid = entradaPid';


%PidOR_PAD = [Pid entradaPid]; % Compara��o entre os valores originais e os padronizados

%% Padroniza��o do pid
MEDPid = mean(Pid); % M�dia dos valores da m�dia geral
variancia_Pid = var(Pid); % Vari�ncia dos valores da m�dia geral
DP_Pid = sqrt(variancia_Pid); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_Pid; % Valor de 3 vezes o desvio padr�o
minimoPid = MEDPid - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoPid = MEDPid + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizPid = [minimoPid;maximoPid]; 

entradaPid = Normatiza(Pid',matrizPid',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaPid = entradaPid';


PidOR_PAD = [Pid entradaPid]; % Compara��o entre os valores originais e os padronizados
%% Dados

ordem = 1:nlin;
ordem = ordem';
dadosPi = [ordem entradaPif entradaPid]; % Dados padronizados de m�dia geral e de B1
[nlindadosPi ncoldadosPi] = size(dadosPi);

%% Recebendo o controlador fuzzy montado

%% Obtendo os valores de saida para o controlador de adaptabilidade (Ebehart e Russel) 

[outputs_ER, ER, ERR, PertPorRegra]= evalfis(dadosPi(1,2:3),fis,1); % Submetendo os gen�tipos (valores de m�dia geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.
%[outputs_ER, ER, ERR, PertPorRegra]= evalfis( [57.2 2.434 62.72],fis,1); % Submetendo os gen�tipos (valores de m�dia geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.

PertRegras = [];

for i = 1:nlin
    [E, ER, ERR, PertPorRegra]= evalfis(dadosPi(i,2:3),fis,1);
    %[a, Pert_Entrada, b, c]= evalfis(dados(i,:),fisSOM ,10000); 

    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';
PertRegras2 = num2cell(PertRegras2);
cab3ER = {'Regra1', 'Regra2', 'Regra3', 'Regra4'};
MatrizPertsSaidaER2 = [cab3ER;PertRegras2];
%MatrizPertsSaidaER2 = tabela(PertRegras2,cab3ER); % Tabela dos dados padronizados de m�dia geral , B1 e R2 e suas pertin�ncias


%% Primeira Saida - Cinco grupos (Ruim-Desfavoravel, Desfavoravel, Geral, Favoravel e Ruim-Favoravel) - Disjuntos
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(4,k));
PertGeral = max(PertRegras(1,k));
PertFavoravel = max(PertRegras(2,k));
PertDesfavoravel = max(PertRegras(3,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
%Pert_Output_ER2 = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
DadosOutput2ER = [dadosPi(1:nlin,:) pertinencias]; % Dados padronizados de m�dia geral, B1 e R2 e suas pertin�ncias
DadosOutput2ER = num2cell(DadosOutput2ER);
cab3ER = {'Gen�tipos', 'Pif' , 'Pid', 'Geral', 'Pouco Adaptado','Favoravel','Desfavoravel'};
MatrizPertsSaidaER2 = [cab3ER; DadosOutput2ER];
%MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cab3ER); % Tabela dos dados padronizados de m�dia geral , B1 e R2 e suas pertin�ncias


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%--------Resultados-------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matriz = cell(nlin,5);
cabecalho = {'Gen�tipos' 'Classifica��o' 'Comportamento' ' ' 'Pertinencia'};
[nl nc] = size(cabecalho);

for h = 1:nc
    
    matriz{1,h} = cabecalho{1,h};
end

for i = 1:nlin
       
    matriz{i+1,1} = ordem(i,1);
    
end

    
for j = 1:nlin
  %rec = Pert_Output_ER2(j,:);
    rec = pertinencias(j,:);
  posicao = find(rec > 0.50);
  
  matriz{j+1,2} = posicao;
  
end
   
for k = 1:nlin
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

for w = 1:nlin
  %rec = Pert_Output_ER2(w,:);
  rec = pertinencias(w,:);
    
  posicao = find(rec > 0.50);
  
  %matriz{w+1,5} = Pert_Output_ER2(w, posicao);
  matriz{w+1,5} = pertinencias(w, posicao);
  
end

matrizcomp = matriz(:,1:2:5);

%filename = 'Pertinencias.xlsx';
%xlswrite(filename,MatrizPertsSaidaER2)

%filename = 'Recomendacao.xlsx';
%xlswrite(filename,matrizcomp)

%% Imprimir Resultados


disp('------------------------------------------------------------------------------------------------')
disp('---------------------------------------Resultados-----------------------------------------------')
disp('------------------------------------------------------------------------------------------------')
disp('Classifica��o dos gen�tipos quanto a seu comportamento')
matrizcomp
MatrizPertsSaidaER2