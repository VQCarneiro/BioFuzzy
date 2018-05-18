function Matrizout= DNormatiza(Matrizin,MatrizinBase,x0,x1)
valMax = max(MatrizinBase');
valMin = min(MatrizinBase');
[nl ncol] =size(Matrizin);

for k = 1:nl
    Matrizout(k,:) = valMax(k) +  ((Matrizin(k,:)-x1)* (valMax(k)-valMin(k)))/(x1-x0);
end
end