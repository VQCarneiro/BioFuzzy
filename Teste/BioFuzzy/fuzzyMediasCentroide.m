%  clc, clear all, close all
% 
% %% Entradas
%  [dadosOriginais texto comp] = xlsread('Oleo_mge.xlsx');
%  tipo = 1;
%  dadosOriginais = dadosOriginais(:,2:end);
function [matrizResumo tabelaClassOriginal tabelaClassPadronizado] = fuzzyMediasCentroide(dadosOriginais,tipo)
[nlin ncol] = size(dadosOriginais);
dados = dadosOriginais(:,2:3);
[nlin ncol] = size(dados);
nVariaveis = ncol;
%nVariaveis = 4;

% mediaAmbientes = mean(dadosOriginais);
% mediaGeral = mean(mediaAmbientes);
% indice = mediaAmbientes-mediaGeral;
nAmbientesFavoraveis = 1;
nAmbientesDesfavoraveis = 1;

% ordem = 1:1:nVariaveis;
% dadosIndice = [ordem; indice; dadosOriginais];
% dadosOrdenados = sortrows(dadosIndice',-1);
% dadosOrdenados= dadosOrdenados';
% dados = dadosOrdenados(3:end,:);


for i = 1:ncol
    
dadosAmbientes = dados(1:nlin,i);
% [nlinAmbientes ncolAmbientes] = size(dadosAmbientes);
mediaDados = mean(dadosAmbientes); % Média dos valores da média geral
varianciaDados = var(dadosAmbientes); % Variância dos valores da média geral
DP_Dados = sqrt(varianciaDados); % Desvio padrão dos valores da média geral
sigX3A = 3*DP_Dados; % Valor de 3 vezes o desvio padrão
minimoMed = mediaDados - sigX3A; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoMed = mediaDados + sigX3A; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizExtremos = [minimoMed;maximoMed]; 

dadosAmbientesPad = Normatiza(dadosAmbientes',matrizExtremos',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
dadosAmbientesPad = dadosAmbientesPad';
matrizEntradas(1:nlin,i) = dadosAmbientesPad; % Comparação entre os valores originais e os padronizados
end

%% Controlador
a = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtaver');
nGrupos = 2;
nome = {'Ambientes Favoraveis', 'Ambientes Desfavoráveis'} ;
for i = 1:nVariaveis
    %texto = num2str(i);
    %[nome texto];
    a.input(i).name = nome(i);
    a.input(i).range = [0 100];
    a.input(i).mf(1).name = 'Média Baixa';
    a.input(i).mf(1).type = 'zmf';
    a.input(i).mf(1).params = [0 100];
    a.input(i).mf(2).name = 'Média Alta';
    a.input(i).mf(2).type = 'smf';
    a.input(i).mf(2).params = [0 100];
end
figure('Name','Entradas'); 
subplot(1,2,1)
plotmf(a,'input',1)
subplot(1,2,2)
plotmf(a,'input',2)

a.output(1).name = 'Comprtamento';
a.output(1).range = [0 120];
a.output(1).mf(4).name = 'Pouco Adaptado';
a.output(1).mf(4).type = 'constant';
a.output(1).mf(4).params = 25;
a.output(1).mf(3).name = 'Desfavorável';
a.output(1).mf(3).type = 'constant';
a.output(1).mf(3).params = 50;
a.output(1).mf(2).name = 'Favorável';
a.output(1).mf(2).type = 'constant';
a.output(1).mf(2).params = 75;
a.output(1).mf(1).name = 'Geral';
a.output(1).mf(1).type = 'constant';
a.output(1).mf(1).params = 100;

nRegras = 2^nVariaveis;

vetor = zeros(nRegras,nVariaveis);
v = repmat([1 2], 1,nVariaveis);
%v = [1 2 1 2 1 2 1 2];
C = nchoosek(v,nVariaveis);
vc = 1:1:nVariaveis;
C = sortrows(C,vc);
[nlr ncr] = size(C);
linhaC = C(1,:);
matriz = zeros(nRegras,nVariaveis);
linhaCont = 2;
matriz(1,:) = linhaC;

for i = 1:nlr
    if isequal(C(i,:),linhaC) ~= 1
        matriz(linhaCont,:) = C(i,:);
        linhaC = C(i,:);
        linhaCont = linhaCont +1;
    else
        
        linhaC = linhaC;
        linhaCont = linhaCont;
        
    end
end

vetor = zeros(nRegras,1);
nAmb_Favoraveis = nAmbientesFavoraveis;
nAmb_Desfavoraveis = nAmbientesDesfavoraveis;
interesse = tipo;
%if  strcmp(interesse,'Acrescimo')
if  interesse == 1 % Acrescimo é igual a 1   
    for i = 1:nRegras
    
    if sum(matriz(i,:)) == 2*nVariaveis
        vetor(i,1) = 1;
    else if sum(matriz(i,1:nAmb_Favoraveis)) == 2*nAmb_Favoraveis
            vetor(i,1) = 2;
        else if sum(matriz(i,(nAmb_Favoraveis+1):end)) == 2*nAmb_Desfavoraveis
                vetor(i,1) = 3;
            else
                vetor(i,1) = 4;
            end
        end
    end
    end
else
    for i = 1:nRegras
    
    if sum(matriz(i,:)) == 1*nVariaveis
        vetor(i,1) = 1;
    else if sum(matriz(i,1:nAmb_Favoraveis)) == 1*nAmb_Favoraveis
            vetor(i,1) = 2;
        else if sum(matriz(i,(nAmb_Favoraveis+1):end)) == 1*nAmb_Desfavoraveis
                vetor(i,1) = 3;
            else
                vetor(i,1) = 4;
            end
        end
    end
end
end

vetorPesos = ones(nRegras,1);
vetorOperadores = ones(nRegras,1);
regras = [matriz vetor vetorPesos vetorOperadores];
[nlinRg ncolRg] = size(regras);
regras = sortrows(regras,ncolRg-2);
a = addrule(a,regras);

RegrasGeral = find(regras(:,nVariaveis+1)==1);
RegrasFavoravel = find(regras(:,nVariaveis+1)==2);
RegrasDesfavoravel = find(regras(:,nVariaveis+1)==3);
RegrasPoucoAdaptado = find(regras(:,nVariaveis+1)==4);

%% Obtendo os valores de saida para o controlador de adaptabilidade 

PertRegras = [];
for i = 1:nlin
    [E, ER, ERR, PertPorRegra]= evalfis(matrizEntradas(i,1:end),a,1);
    PertRegras(:,i) = PertPorRegra(:,1);

end
PertRegrasT = PertRegras';
[nlR ncR] = size(regras);
nome = 'Regra ';
for i = 1:nlR
    texto = num2str(i);
    rotulos{i} = [nome texto];
end
PertRegrasCell = num2cell(PertRegrasT);
MatrizPertsSaida = [rotulos; PertRegrasCell];

%% Primeira Saida - Cinco grupos (Ruim-Desfavoravel, Desfavoravel, Geral, Favoravel e Ruim-Favoravel) - Disjuntos
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(RegrasPoucoAdaptado(1,1):RegrasPoucoAdaptado(end,1),k));
PertGeral = max(PertRegras(RegrasGeral,k));
PertFavoravel = max(PertRegras(RegrasFavoravel(1,1):RegrasFavoravel(end,1),k));
PertDesfavoravel = max(PertRegras(RegrasDesfavoravel(1,1):RegrasDesfavoravel(end,1),k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
dadosSaidaOriginal = [dados(1:nlin,:) pertinencias]; % Dados padronizados de média geral, B1 e R2 e suas pertinências
dadosSaidaPadronizada = [matrizEntradas(1:nlin,:) pertinencias]; % Dados padronizados de média geral, B1 e R2 e suas pertinências

[nlR ncR] = size(regras);
% nome = 'Ambiente ';
ncc = ncR-3;
% for i = 1:ncc
%     
%     
%     rotulosEntradas{i} = nome{i};
% end
cabTabelaClass = {'Genotipos', 'Amb_Favoraveis', 'Amb_Desfavoraveis', 'Geral', 'Pouco Adap','Favoravel','Desfavoravel'};


ordemGen = 1:1:nlin;
dadosOutputOriginal = [ordemGen' dadosSaidaOriginal];
dadosOutputPadronizado = [ordemGen' dadosSaidaPadronizada];
dadosOutputOriginalCell = num2cell(dadosOutputOriginal);
dadosOutputPadronizadoCell = num2cell(dadosOutputPadronizado);
tabelaClassOriginal = [cabTabelaClass; dadosOutputOriginalCell];
tabelaClassPadronizado = [cabTabelaClass; dadosOutputPadronizadoCell];
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%--------Resultados-------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matriz = cell(nlin+1,5);
cabecalho = {'Genótipos' 'Classificação' 'Comportamento' ' ' 'Pertinencia'};
[nl nc] = size(cabecalho);

for h = 1:nc
    
    matriz{1,h} = cabecalho{1,h};
end

ordemGen = 1:1:nlin;
for i = 1:nlin
       
    matriz{i+1,1} = ordemGen(1,i);
    
end

    
for j = 1:nlin
  
  rec = pertinencias(j,:);
  posicao = find(rec >= 0.50);
  
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

matrizResumo = matriz(:,1:2:5);

%filename = 'Pertinenciashib.xlsx';
%xlswrite(filename,MatrizPertsSaidaER2)

%filename = 'Recomendacaohhib.xlsx';
%xlswrite(filename,matrizcomp)

%% Imprimir Resultados


disp('------------------------------------------------------------------------------------------------')
disp('---------------------------------------Resultados-----------------------------------------------')
disp('------------------------------------------------------------------------------------------------')
disp('Classificação dos genótipos quanto a seu comportamento')
matrizResumo
tabelaClassOriginal
tabelaClassPadronizado