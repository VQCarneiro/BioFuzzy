clc, clear, close all
%% Operador Fuzzy - Adaptabilidade e Estabilidade
%% M�todo - Reta Bissegmentada - Cruz, torres e Venckovsky (1989)
%% 16/08/2015

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-------CONTROLADOR FUZZY--------%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Declarando par�metros

PMFAV = 40; % Ponto de corte da M�dia em ambientes favoraveis
PMDESF = 20; % Ponto de corte da M�dia em ambientes desfavor�veis

%% Dados Originais

Dadoss = load('dadosCE.txt'); % Recebe os dados de M�dia em ambientes Favor�veis, M�dia em ambientes desfavor�veis, B1, B1+B2 e R2
[nlins ncols] = size(Dadoss);

%% Criando o controlador Fuzzy

fis = newfis('newsys','sugeno','prod', 'probor', 'prod','sum','wtaver');


%% Vari�vel: M�dia em ambientes Favor�veis

if PMDESF >= 50;
Parametro1 = 2*PMDESF - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMDESF - 0;
end

% Ambiente Desfavor�vel 1
fis = addvar(fis,'input','AMB1',[0 100]);
fis = addmf(fis,'input',1,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alto','smf',[Parametro1 Parametro2]);

% Ambiente DEsfavor�vel 2

fis = addvar(fis,'input','AMB2',[0 100]);
fis = addmf(fis,'input',2,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',2,'Alto','smf',[Parametro1 Parametro2]);

% Ambiente Desfavor�vel 3

fis = addvar(fis,'input','AMB3',[0 100]);
fis = addmf(fis,'input',3,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',3,'Alto','smf',[Parametro1 Parametro2]);

% Ambiente Desfavor�vel 4

fis = addvar(fis,'input','AMB4',[0 100]);
fis = addmf(fis,'input',4,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',4,'Alto','smf',[Parametro1 Parametro2]);


%% Vari�vel: M�dia em ambientes Desfavor�veis

figure(1)
if PMFAV >= 50;
Parametro3 = 2*PMFAV - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMFAV - 0;
end


% Ambiente Favor�vel 1

fis = addvar(fis,'input','MDESF1',[0 100]);
fis = addmf(fis,'input',5,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',5,'Alto','smf',[Parametro3 Parametro4]);

% Ambiente Favor�vel 2
fis = addvar(fis,'input','MDESF2',[0 100]);
fis = addmf(fis,'input',6,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',6,'Alto','smf',[Parametro3 Parametro4]);


%% Sa�da

fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favoravel','constant',[75]);
fis = addmf(fis,'output',1,'Desfavoravel','constant',[50]);
fis = addmf(fis,'output',1,'Ruim','constant',[25]);

%% Rules
ruleList=[2 2 2 2 2 2 1 1 1
1 1 1 1 2 2 2 1 1
1 1 1 2 2 2 2 1 1
1 1 2 1 2 2 2 1 1
1 1 2 2 2 2 2 1 1
1 2 1 1 2 2 2 1 1
1 2 1 2 2 2 2 1 1
1 2 2 1 2 2 2 1 1
1 2 2 2 2 2 2 1 1
2 1 1 1 2 2 2 1 1
2 1 1 2 2 2 2 1 1
2 1 2 1 2 2 2 1 1
2 1 2 2 2 2 2 1 1
2 2 1 1 2 2 2 1 1
2 2 1 2 2 2 2 1 1
2 2 2 1 2 2 2 1 1
2 2 2 2 1 1 3 1 1
2 2 2 2 1 2 3 1 1
2 2 2 2 2 1 3 1 1
1 1 1 1 1 1 4 1 1
1 1 1 1 1 2 4 1 1
1 1 1 1 2 1 4 1 1
1 1 1 2 1 1 4 1 1
1 1 1 2 1 2 4 1 1
1 1 1 2 2 1 4 1 1
1 1 2 1 1 1 4 1 1
1 1 2 1 1 2 4 1 1
1 1 2 1 2 1 4 1 1
1 1 2 2 1 1 4 1 1
1 1 2 2 1 2 4 1 1
1 1 2 2 2 1 4 1 1
1 2 1 1 1 1 4 1 1
1 2 1 1 1 2 4 1 1
1 2 1 1 2 1 4 1 1
1 2 1 2 1 1 4 1 1
1 2 1 2 1 2 4 1 1
1 2 1 2 2 1 4 1 1
1 2 2 1 1 1 4 1 1
1 2 2 1 1 2 4 1 1
1 2 2 1 2 1 4 1 1
1 2 2 2 1 1 4 1 1
1 2 2 2 1 2 4 1 1
1 2 2 2 2 1 4 1 1
2 1 1 1 1 1 4 1 1
2 1 1 1 1 2 4 1 1
2 1 1 1 2 1 4 1 1
2 1 1 2 1 1 4 1 1
2 1 1 2 1 2 4 1 1
2 1 1 2 2 1 4 1 1
2 1 2 1 1 1 4 1 1
2 1 2 1 1 2 4 1 1
2 1 2 1 2 1 4 1 1
2 1 2 2 1 1 4 1 1
2 1 2 2 1 2 4 1 1
2 1 2 2 2 1 4 1 1
2 2 1 1 1 1 4 1 1
2 2 1 1 1 2 4 1 1
2 2 1 1 2 1 4 1 1
2 2 1 2 1 1 4 1 1
2 2 1 2 1 2 4 1 1
2 2 1 2 2 1 4 1 1
2 2 2 1 1 1 4 1 1
2 2 2 1 1 2 4 1 1
2 2 2 1 2 1 4 1 1
 ];


fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
fuzzy(fis)

%writefis(fis,'Recomendacao');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-----AN�LISE DOS DADOS REAIS----%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados Media em ambientes Favor�veis

% Ambiente Favor�vel 1

MedFAV1 = Dadoss(1:nlins,1);
[nlinMedFAV1 ncolMedFAV1] = size(MedFAV1);


% Padroniza��o das M�dias no ambiente favor�vel 1

MEDGFAV1 = mean(MedFAV1); % M�dia dos valores da m�dia geral
variancia_MedFAV1 = var(MedFAV1); % Vari�ncia dos valores da m�dia geral
DP_MedFAV1 = sqrt(variancia_MedFAV1); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedFAV1; % Valor de 3 vezes o desvio padr�o
minimoMedFAV1 = MEDGFAV1 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedFAV1 = MEDGFAV1 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedFAV1 = [minimoMedFAV1;maximoMedFAV1]; 

entradaMedFAV1 = Normatiza(MedFAV1',matrizMedFAV1',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedFAV1 = entradaMedFAV1';


PifOR_PAD1 = [MedFAV1 entradaMedFAV1]; % Compara��o entre os valores originais e os padronizados

% Ambiente Favor�vel 2

MedFAV2 = Dadoss(1:nlins,2);
[nlinMedFAV2 ncolMedFAV2] = size(MedFAV2);


% Padroniza��o das M�dias no ambiente favor�vel 2

MEDGFAV2 = mean(MedFAV2); % M�dia dos valores da m�dia geral
variancia_MedFAV2 = var(MedFAV2); % Vari�ncia dos valores da m�dia geral
DP_MedFAV2 = sqrt(variancia_MedFAV2); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedFAV2; % Valor de 3 vezes o desvio padr�o
minimoMedFAV2 = MEDGFAV2 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedFAV2 = MEDGFAV2 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedFAV2 = [minimoMedFAV2;maximoMedFAV2]; 

entradaMedFAV2 = Normatiza(MedFAV2',matrizMedFAV2',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedFAV2 = entradaMedFAV2';


PifOR_PAD2 = [MedFAV2 entradaMedFAV2]; % Compara��o entre os valores originais e os padronizados

% Ambiente Favor�vel 3

MedFAV3 = Dadoss(1:nlins,3);
[nlinMedFAV3 ncolMedFAV3] = size(MedFAV3);


% Padroniza��o das M�dias no ambiente favor�vel 3

MEDGFAV3 = mean(MedFAV3); % M�dia dos valores da m�dia geral
variancia_MedFAV3 = var(MedFAV3); % Vari�ncia dos valores da m�dia geral
DP_MedFAV3 = sqrt(variancia_MedFAV3); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedFAV3; % Valor de 3 vezes o desvio padr�o
minimoMedFAV3 = MEDGFAV3 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedFAV3 = MEDGFAV3 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedFAV3 = [minimoMedFAV2;maximoMedFAV2]; 

entradaMedFAV3 = Normatiza(MedFAV3',matrizMedFAV3',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedFAV3 = entradaMedFAV3';


PifOR_PAD3 = [MedFAV3 entradaMedFAV3]; % Compara��o entre os valores originais e os padronizados

% Ambiente Favor�vel 4

MedFAV4 = Dadoss(1:nlins,4);
[nlinMedFAV4 ncolMedFAV4] = size(MedFAV4);


% Padroniza��o das M�dias no ambiente favor�vel 4

MEDGFAV4 = mean(MedFAV4); % M�dia dos valores da m�dia geral
variancia_MedFAV4 = var(MedFAV4); % Vari�ncia dos valores da m�dia geral
DP_MedFAV4 = sqrt(variancia_MedFAV4); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedFAV4; % Valor de 3 vezes o desvio padr�o
minimoMedFAV4 = MEDGFAV4 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedFAV4 = MEDGFAV4 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedFAV4 = [minimoMedFAV4;maximoMedFAV4]; 

entradaMedFAV4 = Normatiza(MedFAV4',matrizMedFAV4',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedFAV4 = entradaMedFAV4';


PifOR_PAD4 = [MedFAV4 entradaMedFAV4]; % Compara��o entre os valores originais e os padronizados

%% Dados Media em ambientes Desfavor�veis

% Ambiente Desfavor�vel 1

MedDESF1 = Dadoss(1:nlins,5);
[nlinMedDESF1 ncolMedDESF1] = size(MedDESF1);

% Padroniza��o das M�dias no ambiente desfavor�vel 2

MEDGDESF1 = mean(MedDESF1); % M�dia dos valores da m�dia geral
variancia_MedDESF1 = var(MedDESF1); % Vari�ncia dos valores da m�dia geral
DP_MedDESF1 = sqrt(variancia_MedDESF1); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedDESF1; % Valor de 3 vezes o desvio padr�o
minimoMedDESF1 = MEDGDESF1 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedDESF1 = MEDGDESF1 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedDESF1 = [minimoMedDESF1;maximoMedDESF1]; 

entradaMedDESF1 = Normatiza(MedDESF1',matrizMedDESF1',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedDESF1 = entradaMedDESF1';


PifOR_PADDESF1 = [MedDESF1 entradaMedDESF1]; % Compara��o entre os valores originais e os padronizados

% Ambiente Desfavor�vel 2

MedDESF2 = Dadoss(1:nlins,6);
[nlinMedDESF2 ncolMedDESF2] = size(MedDESF2);

% Padroniza��o das M�dias no ambiente desfavor�vel 2

MEDGDESF2 = mean(MedDESF2); % M�dia dos valores da m�dia geral
variancia_MedDESF2 = var(MedDESF2); % Vari�ncia dos valores da m�dia geral
DP_MedDESF2 = sqrt(variancia_MedDESF2); % Desvio padr�o dos valores da m�dia geral
sigX3 = 3*DP_MedDESF2; % Valor de 3 vezes o desvio padr�o
minimoMedDESF2 = MEDGDESF2 - sigX3; % Valor m�nimo igual a media menos 3 vezes o desvio padr�o
maximoMedDESF2 = MEDGDESF2 + sigX3; % Valor m�ximo igual a media mais 3 vezes o desvio padr�o

matrizMedDESF2 = [minimoMedDESF2;maximoMedDESF2]; 

entradaMedDESF2 = Normatiza(MedDESF2',matrizMedDESF2',0,100); % Padroniza��o dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedDESF2 = entradaMedDESF2';


PifOR_PADDESF2 = [MedDESF2 entradaMedDESF2]; % Compara��o entre os valores originais e os padronizados


%% Dados

ordem = 1:nlins;
ordem = ordem';
dadosBIS = [ordem entradaMedFAV1 entradaMedFAV2 entradaMedFAV3 entradaMedFAV4 entradaMedDESF1 entradaMedDESF2]; % Dados padronizados de m�dia geral e de B1
[nlindadosBIS ncoldadosBIS] = size(dadosBIS);

%% Recebendo o controlador fuzzy montado

%% Obtendo os valores de saida para o controlador de adaptabilidade (Ebehart e Russel) 

PertRegras = [];

for i = 1:nlins
    [E, ER, ERR, PertPorRegra]= evalfis(dadosBIS(i,1:6),fis,1);
    %[a, Pert_Entrada, b, c]= evalfis(dados(i,:),fisSOM ,10000); 

    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';

cab3BIS = {'Regra1', 'Regra2', 'Regra3', 'Regra4' , 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12', 'Regra13', 'Regra14', 'Regra15', 'Regra16', 'Regra17', 'Regra18', 'Regra19' , 'Regra20', 'Regra21', 'Regra22', 'Regra23', 'Regra24' 'Regra25', 'Regra26', 'Regra27', 'Regra28' , 'Regra29', 'Regra30', 'Regra31', 'Regra32', 'Regra33', 'Regra34', 'Regra35', 'Regra36', 'Regra37', 'Regra38', 'Regra39', 'Regra40', 'Regra41', 'Regra42', 'Regra43' , 'Regra44', 'Regra45', 'Regra46', 'Regra47', 'Regra48' 'Regra49', 'Regra50', 'Regra51', 'Regra52' , 'Regra53', 'Regra54', 'Regra55', 'Regra56', 'Regra57', 'Regra58', 'Regra59', 'Regra60', 'Regra61', 'Regra62', 'Regra63', 'Regra64'};
MatrizPertsSaidaBIS2 = tabela(PertRegras2,cab3BIS); % Tabela dos dados padronizados de m�dia geral , B1 e R2 e suas pertin�ncias


%% Primeira Saida - Cinco grupos (Ruim-Desfavoravel, Desfavoravel, Geral, Favoravel e Ruim-Favoravel) - Disjuntos
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(20:64,k));
PertGeral = max(PertRegras(1,k));
PertFavoravel = max(PertRegras(2:16,k));
PertDesfavoravel = max(PertRegras(17:19,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
%Pert_Output_ER2 = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
DadosOutput2ER = [dadosBIS(1:nlins,:) pertinencias]; % Dados padronizados de m�dia geral, B1 e R2 e suas pertin�ncias

cab3BIS = {'Gen�tipos', 'MEDFAV1' , 'MEDFAV2' , 'MEDFAV3' , 'MEDFAV4', 'MEDESF1', 'MEDESF2', 'Geral', 'Pouco Adap','Favoravel','Desfavoravel'};
MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cab3BIS); % Tabela dos dados padronizados de m�dia geral , B1 e R2 e suas pertin�ncias


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%--------Resultados-------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matriz = cell(nlins,5);
cabecalho = {'Gen�tipos' 'Classifica��o' 'Comportamento' ' ' 'Pertinencia'};
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

%filename = 'Pertinenciashib.xlsx';
%xlswrite(filename,MatrizPertsSaidaER2)

%filename = 'Recomendacaohhib.xlsx';
%xlswrite(filename,matrizcomp)

%% Imprimir Resultados


disp('------------------------------------------------------------------------------------------------')
disp('---------------------------------------Resultados-----------------------------------------------')
disp('------------------------------------------------------------------------------------------------')
disp('Classifica��o dos gen�tipos quanto a seu comportamento')
matrizcomp
MatrizPertsSaidaER2