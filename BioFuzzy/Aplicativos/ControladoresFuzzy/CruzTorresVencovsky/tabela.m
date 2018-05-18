function matrizfuncional = tabela(MatrizEntrada,MatrizString)

[nlin ncol] = size(MatrizEntrada);

matrizfuncional = cell(nlin+1,ncol);

for i = 1:nlin
    for j = 1:ncol
    
    matrizfuncional{i+1,j} = MatrizEntrada(i,j);
    end
end


for k = 1:ncol
    
    matrizfuncional{1,k} = MatrizString{1,k};
end

