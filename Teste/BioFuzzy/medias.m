%function [medAmb,tabelaMediasGenotipos] = medias(dados)
function [medAmb,tabelaMediasGenotipos,tabMga, inf] = medias(dados)
%clc, clear all, close all
%[dados texto comp] = xlsread('dados.xlsx');
[nlin ncol] = size(dados);
nAmb =  max(dados(:,1));
nGen = max(dados(:,2));
nRep = max(dados(:,3));
nOb = nGen*nRep;
total = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% M�dias Ambientes

vetorA = [];
soma = 0;


for nAe = 1:nAmb
    
    for l = 1:nlin
        
        if dados(l,1) == nAe
            
            vetorA(nAe,1) = nAe;
            soma = soma+dados(l,4);
            vetorA(nAe,2) = soma;
            
            
        else
        end
        
        
    end
    soma = 0;
    
end


mediaAmbientes = [vetorA(:,1), vetorA(:,2)/(nRep*nGen)];
mediaGeral = mean(mediaAmbientes);
indice = mediaAmbientes(:,2) - mediaGeral(:,2);
tabMedAmb = [mediaAmbientes indice];
rotulo = {'Ambientes', 'M�dia', '�ndice'};
medAmb = tabela(tabMedAmb,rotulo);

[nls nca] = size(tabMedAmb);

classe = {};

for l = 1:nls
    if tabMedAmb(l,3)>=0
        classe{l,1} = 'Favor�vel';
    else
        classe{l,1} = 'Desfavor�vel';
    end
end

classe = ['Classifica��o';classe];
medAmb = [medAmb classe];

% Dados em Ambientes Favor�veis
linha_F = 1;
linha_D = 1;
dadosAmbFavoraveis = [];
dadosAmbDesfavoraveis = [];
for nAF = 1:nAmb
    for l = 1:nlin
        
        if indice(nAF,1) >=0 & dados(l,1) == nAF
            dadosAmbFavoraveis(linha_F,:) = dados(l,:);
            dadosAmbFavoraveis(linha_F,:) = dados(l,:);
            dadosAmbFavoraveis(linha_F,:) = dados(l,:);
            linha_F = linha_F + 1;
            linha_D = linha_D;
        else if indice(nAF,1) < 0 & dados(l,1) == nAF
                dadosAmbDesfavoraveis(linha_D,:) = dados(l,:);
                dadosAmbDesfavoraveis(linha_D,:) = dados(l,:);
                dadosAmbDesfavoraveis(linha_D,:) = dados(l,:);
                linha_F  = linha_F;
                linha_D = linha_D + 1;
            end
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% M�dias Gen�tipos

vetorG = [];
somaG = 0;


for nGe = 1:nGen
    
    for l = 1:nlin
        
        if dados(l,2) == nGe
            
            vetorG(nGe,1) = nGe;
            somaG = somaG+dados(l,4);
            vetorG(nGe,2) = somaG;
            
            
        else
        end
        
        
    end
    somaG = 0;
    
end


mediaGenotipos = [vetorG(:,1), vetorG(:,2)/(nRep*nAmb)];
rotuloG = {'Gen�tipos', 'M�dia'};
medGen = tabela(mediaGenotipos,rotuloG);


% M�dia em Ambientes Favor�veis

[nlF ncF] = size(dadosAmbFavoraveis);

vetorG_AF = [];
somaG_AF = 0;


for nGe = 1:nGen
    
    for l = 1:nlF
        
        if dadosAmbFavoraveis(l,2) == nGe
            
            vetorG_AF(nGe,1) = nGe;
            somaG_AF = somaG_AF+dadosAmbFavoraveis(l,4);
            vetorG_AF(nGe,2) = somaG_AF;
            
            
        else
        end
        
        
    end
    somaG_AF = 0;
    
end


%% Achar o n�mero de ambientes desfavor�vies
valorF = dadosAmbFavoraveis(1,1) ;
numeroF = 1;
for t = 1:nlF
    if dadosAmbFavoraveis(t,1) ~= valorF;
        valorF = dadosAmbFavoraveis(t,1);
        numeroF = numeroF + 1;
    else
        valorF = valorF;
        numeroF = numeroF;
        
    end
end
nA_Fav = numeroF;

%%
mediaGenotipos_AF = [vetorG_AF(:,1), vetorG_AF(:,2)/(nRep*nA_Fav)];
rotuloG_AF = {'Ambientes', 'Ambientes Favor�veis'};
medGen_AF = tabela(mediaGenotipos_AF,rotuloG_AF);


%% M�dia em Ambientes Desfavor�veis

[nlD ncD] = size(dadosAmbDesfavoraveis);

vetorG_AD = [];
somaG_AD = 0;


for nGe = 1:nGen
    
    for l = 1:nlD
        
        if dadosAmbDesfavoraveis(l,2) == nGe
            
            vetorG_AD(nGe,1) = nGe;
            somaG_AD = somaG_AD+dadosAmbDesfavoraveis(l,4);
            vetorG_AD(nGe,2) = somaG_AD;
            
            
        else
        end
        
        
    end
    somaG_AD = 0;
    
end

nA_Desf = max(dadosAmbDesfavoraveis(:,1)) - min(dadosAmbDesfavoraveis(:,1)) + 1;
%% Achar o n�mero de ambientes desfavor�vies
valor = dadosAmbDesfavoraveis(1,1) ;
numero = 1;
for t = 1:nlD
    if dadosAmbDesfavoraveis(t,1) ~= valor;
        valor = dadosAmbDesfavoraveis(t,1);
        numero = numero + 1;
    else
        valor = valor;
        numero = numero;
        
    end
end
nA_Desf = numero;
%%
mediaGenotipos_AD = [vetorG_AD(:,1), vetorG_AD(:,2)/(nRep*nA_Desf)];
rotuloG_AD = {'Ambientes', 'Ambientes Desfavor�veis'};
medGen_AD = tabela(mediaGenotipos_AD,rotuloG_AD);

tabelaMediasGenotipos = [medGen medGen_AF(:,2) medGen_AD(:,2)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% M�dia dos Gen�tipos em cada ambiente

matrizIndividual = [];

for nA = 1:nAmb
    posi = find(dados(:,1) == nA);
    [nlp ncp] = size(posi);
    matrizIndividual{nA}(:,1:3) = dados(posi(1,1):posi(nlp,1),2:4);
    
    
end

matrizIndividual;
[nlm ncm] = size(matrizIndividual);
matrizGen_Exp = {};

for i = 1:ncm
    for nG = 1:nGen
    posi = find(matrizIndividual{i}(:,1) == nG);
    [nlp ncp] = size(posi);
    matrizGen_Exp{i}(1,nG) = sum(matrizIndividual{i}(posi(1,1):posi(nlp,1),3));
    end
end

[nlGen ncGen] = size(matrizGen_Exp);

tga = [];
conCol = 1;
for i = 1:ncGen

    tga(:,i) = matrizGen_Exp{i}';
    

end

tga;
mga = tga/nRep;

nome = 'Ambiente ';
Str = [];
for i = 1:nAmb
    texto = num2str(i);
    nomeStr{i} = [nome texto];
    
end
rotulo1 = {'Gen�tipos'};
rotulos_mga = [rotulo1,nomeStr];
ordem_Gen = 1:1:nGen;
mga=[ordem_Gen' mga];
tabMga = tabela(mga,rotulos_mga);

% mambientes = mean(mga,1);
% mgenotipos = mean(mga,2);

inf = [nGen;nAmb;nRep;mediaGeral(1,2)];
inf = num2cell(inf);
rotulos_inf = {'Gen�tipos';'Ambientes';'Repeti��es'; 'M�dia Geral'}
inf = [rotulos_inf inf];


