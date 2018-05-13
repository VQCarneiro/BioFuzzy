dadosA = 1:0.1:100;
dadosB = 1:0.1:100;
dadosC = 1:0.1:100;

data = [dadosA' dadosA' dadosC'];
numMFs = [2 2];
mfType = char('trimf','trimf');
fismat = genfis1(data,numMFs,mfType);

fismat = setfis(fismat, 'name', 'Teste'); 
getfis(fismat, 'Name');

getfis(fismat,'input',1,'mf',2,'params')
setfis(fismat,'input',1,'mf',2,'type','smf')
setfis(fismat,'input',1,'mf',2,'params',[0 100])
getfis(fismat,'input',1,'mf',2,'params')

fismat = setfis(fismat,'input',1,'name','help');
getfis(fismat,'input',1,'name')





