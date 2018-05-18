%function [medAmb,medGen] = medias(dados)
clc, clear all, close all
[dados texto comp] = xlsread('dados.xlsx')
[nlin ncol] = size(dados);
nAmb =  max(dados(:,1));
nGen = max(dados(:,2));
nRep = max(dados(:,3));
nOb = nGen*nRep;
total = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Médias dos Ambientes
% ambientes = zeros(nOb,nAmb);
% nIn = 1;
% nFim = nOb;
% for nA = 1:nAmb
%     
%     
%     
%     
%     ambientes(1:nOb,nA) = dados(nIn:nFim,4);
%     nIn = nFim + 1;
%     nFim = nIn + (nOb-1);
%     
%     
% end
% 
% ambientes
% medias_Ambientes = mean(ambientes)
% mediaGeral = mean(medias_Ambientes)
% ordemAmb = 1:1:nAmb;
% 
% indice = medias_Ambientes - mediaGeral;
% tabMedAmb = [ordemAmb' medias_Ambientes' indice']
% 
% rotulo = {'Ambientes', 'Média', 'Índice'};
% medAmb = tabela(tabMedAmb,rotulo)
% 
% 
% size(ambientes)


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
     soma = 0
    
end


mediaAmbientes = [vetorA(:,1), vetorA(:,2)/(nRep*nGen)];
mediaGeral = mean(mediaAmbientes)
indice = mediaAmbientes(:,2) - mediaGeral(:,2);
tabMedAmb = [mediaAmbientes indice]
rotulo = {'Ambientes', 'Média', 'Índice'};
medAmb = tabela(tabMedAmb,rotulo)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Média Genótipos


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
     somaG = 0
    
    end

mediaGenotipos = [vetorG(:,1), vetorG(:,2)/(nRep*nAmb)];
rotuloG = {'Ambientes', 'Média', 'Índice'};
medGen = tabela(mediaGenotipos,rotuloG)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Média dos Genótipos
%
dadosGen = sortrows(dados,2)
nOb2 = nAmb*nRep;
genotipos = zeros(nOb2,nGen);
nIn2 = 1;
nFim2 = nOb2;
for nG = 1:nGen


    genotipos(1:nOb2,nG) = dados(nIn2:nFim2,4);
    nIn2 = nFim2 + 1;
    nFim2 = nIn2 + (nOb2-1);





end

genotipos
medias_Genotipos = mean(genotipos)
% %mediaGeral = mean(medias_Ambientes)
% ordemGen = 1:1:nGen;
%
% tabMedGen = [ordemGen' medias_Genotipos']
% rotulo2 = {'Genótipos', 'Média',};
% medGen = tabela(tabMedGen,rotulo2)
%
% % dadosGA = [];
% %
% %    for nGeno = 1:nGen
% %     for nAe = 1:nAmb
% %         for l = 1:nlin
% %         if dados(l,1) == nGeno && dados(l,2) == nGeno
% %             dadosGxA(nGeno,1) = nGeno;
% %             dadosGxA(nGeno,nAe+1) = dados(l,4) ;
% %         else
% %             end
% %             end
% %         end
% %     end
% %
% % dadosGxA
%
% % posicao = find(tabMedAmb(:,3)<0)
% % [nl nc] = size(posicao)
% % vetorG = [];
% % for l = 1:nlin
% % soma = 0;
% %  for nGeno = 1:nGen
% %     for nAe = 1:nAmb
% %
% %         if dados(l,1) == nGeno && dados(l,2) == nGeno
% %
% %             soma = soma+dados(l,4);
% %             vetorG(nGeno) = soma;
% %
% %
% %
% %         else
% %             end
% %             end
% %         end
% %     end
% %
% % vetorG
% % mediaGen = vetorG/nRep;
% % mediaGen
%
% % vetorA = [];
% % for l = 1:nlin
% % soma = 0;
% %  for nGeno = 1:nGen
% %     for nAe = 1:nAmb
% %
% %         if dados(l,1) == nAe
% %
% %             soma = soma+dados(l,4);
% %             vetor(nAe) = soma;
% %
% %
% %
% %         else
% %             end
% %             end
% %         end
% %     end
% %
% % vetor
% % mediaAm = vetor/nRep;
% % mediaAm
%
