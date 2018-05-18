
function [cellPert, cellCentroides] = alterarMatrizPertinencias(matrizPert, centroides)

idAmpla = matrizPert(end-3,2);
idFav = matrizPert(end-2,2);
idDesf = matrizPert(end-1,2);
idPouco = matrizPert(end,2);

cellPert = num2cell(matrizPert);

cent = centroides;
cent(1,:) = centroides(idAmpla,:);
cent(2,:) = centroides(idFav,:);
cent(3,:) = centroides(idDesf,:);
cent(4,:) = centroides(idPouco,:);

cellCentroides = num2cell(cent);

[nl nc] = size(matrizPert);
for j = 1:nl
    if(matrizPert(j,2)==idAmpla);
    cellPert{j,end} = 'Ampla';
    
    
    
    
    elseif(matrizPert(j,2)==idFav);
    cellPert{j,end} = 'Favorável';
    elseif(matrizPert(j,2)==idDesf);
    cellPert{j,end} = 'Desfavorável';
    else(matrizPert(j,2)==idPouco);
    cellPert{j,end} = 'Pouco Adaptado';

    end
    cellPert{j,2} = matrizPert(j,idAmpla+2);
    cellPert{j,3} = matrizPert(j,idFav+2);
    cellPert{j,4} = matrizPert(j,idDesf+2);
    cellPert{j,5} = matrizPert(j,idPouco+2);
end

end