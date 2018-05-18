function varargout = Interface_FCM_GxA(varargin)
% INTERFACE_FCM_GXA MATLAB code for Interface_FCM_GxA.fig
%      INTERFACE_FCM_GXA, by itself, creates a new INTERFACE_FCM_GXA or raises the existing
%      singleton*.
%
%      H = INTERFACE_FCM_GXA returns the handle to a new INTERFACE_FCM_GXA or the handle to
%      the existing singleton*.
%
%      INTERFACE_FCM_GXA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_FCM_GXA.M with the given input arguments.
%
%      INTERFACE_FCM_GXA('Property','Value',...) creates a new INTERFACE_FCM_GXA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interface_FCM_GxA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interface_FCM_GxA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interface_FCM_GxA

% Last Modified by GUIDE v2.5 28-Jun-2017 19:45:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interface_FCM_GxA_OpeningFcn, ...
                   'gui_OutputFcn',  @Interface_FCM_GxA_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Interface_FCM_GxA is made visible.
function Interface_FCM_GxA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interface_FCM_GxA (see VARARGIN)

% Choose default command line output for Interface_FCM_GxA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interface_FCM_GxA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interface_FCM_GxA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

arquivo = handles.arquivo;
pathname = handles.pathname;
% [num texto completo] = xlsread(arquivo);

num = load(arquivo);

indiceSel = get(handles.popupmenu1,'Value');

if (indiceSel == 1)
    num = num;
elseif (indiceSel == 2)
    num = procMedEsp(num);
end



Originais = procCentroides(num);
num = Originais;


% Originais = procFCM_GxA(num);
% num = Originais(:, 2:end);



exp = get(handles.edit6,'String');
exp = str2num(exp);
handles.exp = exp;

expMin = get(handles.edit9,'String');
expMin = str2num(expMin);
handles.expMin = expMin;

varMin = get(handles.edit7,'String');
varMin = str2num(varMin);
handles.varMin = varMin;

iteracoes = get(handles.edit8,'String');
iteracoes = str2num(iteracoes);
handles.iteracoes = iteracoes;

fatorExp = expMin:0.1:exp;
[nl nc] = size(fatorExp);
matrizConf = zeros(nc,5);
nomeRec = [pathname,'RecomendacaoFatores.xlsx'];
delete(nomeRec);



Originais = num;
handles.Originais = Originais;
[linhas colunas] = size(num);
num = num';

for k = 1:1:colunas
    
    dadosNorm1(k,:) = Normatiza(num(k,:),num(k,:),0,1);
    
    
end
num = dadosNorm1';





for j = 1:nc


opcoes = [fatorExp(j),iteracoes,varMin,0];

pertinencias = [NaN];
poss = isnan(pertinencias);
 while (poss~=0)
 [centroides, pertinencias, variacao] = fcm(num,4,opcoes);
poss = isnan(pertinencias);
  end

% pertinencias

handles.pertinencias = pertinencias;
handles.variacao = variacao;
[nlin ncol] = size(pertinencias);

for k = 1:ncol
    classes(k) = find(pertinencias(:,k)==max(pertinencias(:,k)));
end
[nlin ncol] = size(num);
ordem = 1:1:nlin;
matriz = [ordem' num classes'];
matrizPert = [ordem' classes' pertinencias'];

handles.classes = classes;
handles.matriz = matriz;
handles.matrizPert = matrizPert;
handles.centroides = centroides;
handles.nlin = nlin;



[cellPert cellCent] = alterarMatrizPertinencias(matrizPert, centroides);


nomeTabRec = {['Recomendação com valor do Expoente (m) = ' num2str(fatorExp(j))]};
xlswrite(nomeRec,nomeTabRec,j,'A1');
xlswrite(nomeRec,cellPert,j,'A3');




ClassesCent = cellPert(end-3:end,2:5);

ClassesCentMat = cell2mat(ClassesCent);

maximosPert = max(ClassesCentMat);
    

matrizFatores(j,:) = [fatorExp(j) maximosPert];



end

matrizMedias = mean((matrizFatores(:,2:end))');
matrizExp = [matrizFatores matrizMedias'];

cellExp = num2cell(matrizExp);

cabExp = {'Expoente(m)', 'Ampla','Favoravel', 'Desfavoravel','Pouco', 'Média'};

cellExpFinal = [cabExp;cellExp];

nome = [pathname,'TesteExpoente.xlsx'];
delete(nome);
nomeTabExp = {'Variação dos valores do expoente(m)'};
xlswrite(nome,nomeTabExp,1,'A1');
xlswrite(nome,cellExpFinal,1,'A3');



winopen(nome);
winopen(nomeRec);




helpdlg('A fase de treinamento foi processada com sucesso!');

guidata(hObject, handles);





% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.txt'},'File Selector');
handles.filename = filename;
handles.pathname = pathname;
arquivo = [pathname filename];
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');
guidata(hObject,handles);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
pathname = handles.pathname;
filename = handles.filename;
b = strtok(filename,'.');

nomeWord = [b,'_FCM(GxA).doc']
c = [pathname, nomeWord]
if (exist([pathname, nomeWord]))~=0
    delete([pathname, nomeWord]);
else
end

diary on
diary([pathname, nomeWord]);
disp('-------------------------------------------------------------------------');
disp('------------------------------BIOFUZZY-----------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vinícius Quintão Carneiro (vqcarneiro@gmail.com)')
disp(' ')
disp('-----------------------------INFORMAÇÕES---------------------------------');
disp(' ')
disp('- - - - - - - - - - - - - - -Fuzzy C-Means- - - - - - - - - - - - - - - - ')
disp(' ')
disp('---------------------REFERÊNCIAS BIBLIOGRÁFICAS--------------------------')
disp(' ')
disp('1. Bezdec, J.C., Pattern Recognition with Fuzzy Objective Function Algorithms, Plenum Press, New York, 1981.');
disp(' ')
disp('----------------------------CONFIGURAÇÕES--------------------------------');
disp(' ')
disp('Número de classes de genótipos quanto a adaptabilidade e estabilidade: 4');
disp('Classe 1: Ampla Adaptabilidade');
disp('Classe 2: Adaptabilidade a Ambientes Favoráveis');
disp('Classe 3: Adaptabilidade a Ambientes Desfavoráveis');
disp('Classe 4: Pouco Adaptados');
disp(['Fator de Ponderação: ', get(handles.edit3,'String')]);
disp(['Variação Mínima entre iterações: ', get(handles.edit4,'String')]);
disp(['Número de iterações: ', get(handles.edit5,'String')]);
cellVariacao = handles.cellVariacao;
[nlVV ncVV] = size(cellVariacao);
disp(['Número de iterações realizadas: ', num2str(nlVV-1)]);
disp(' ')
disp('---------------------------------DADOS-----------------------------------')
disp(' ')

dadosTeste = handles.Or;
[nl nc] = size(dadosTeste);
disp(['Número Total de Observações: ',num2str(nl)]);
disp(' ')
disp('* Ambientes: ')
[nlT ncT] = size(dadosTeste);
cellCent = handles.cellCent;

for l=1:ncT
    rotulosTeste = cellCent{1,l+1};
    lstr = num2str(l);
    disp([rotulosTeste]);
    disp(['Valor Máximo: ', num2str(max(dadosTeste(:,l)))]);
    disp(['Valor Mínimo: ', num2str(min(dadosTeste(:,l)))]);
    disp(['Média: ', num2str(mean(dadosTeste(:,l)))]);
    disp(['Variância: ', num2str(var(dadosTeste(:,l)))]);
    disp(' ')
end
disp(' ')
disp('---------------------------TRILHA DE DADOS-------------------------------');
disp(' ')
disp(pathname);
disp(' ');
disp('----------------------------ARQUIVOS GERADOS-----------------------------');
disp(' ');
disp(['Resultado (Word): ',nomeWord]);
disp(' ')
disp('-------------------------------------------------------------------------');
disp('------------------------------RESULTADOS---------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ');
disp('Tabela 1. Recomendação dos genótipos avaliados.');
disp(' ');

cellPert = handles.cellPert;

[nlP ncP] = size(cellPert(2:end-4,:));

class = cellPert(2:end,6);
nGenotipos= handles.nGenotipos;

for jj = 1:nGenotipos
    
    if(strcmp(class(jj,1),'Ampla')==1);
        novo(jj,1) = 1;
    elseif (strcmp(class(jj,1),'Favorável'));
        novo(jj,1) =2;
    elseif (strcmp(class(jj,1),'Desfavorável'));
        novo(jj,1) =3;
    elseif (strcmp(class(jj,1),'Pouco Adaptado'));
        novo(jj,1) =4;
    end
end

obsAmpla = find(novo==1);
obsFav = find(novo==2);    
obsDesf = find(novo==3);   
obsPouco = find(novo==4);   
disp('_____________________________________________________________________');
disp(' ');
disp('Ampla Adaptabilidade');
disp(obsAmpla');
disp('_____________________________________________________________________');
disp(' ');
disp('Adaptabilidade Favorável');
disp(obsFav');
disp('_____________________________________________________________________');
disp(' ');
disp('Adaptabilidade Desfavorável');
disp(obsDesf');
disp('_____________________________________________________________________');
disp(' ');
disp('Pouco Adaptado');
disp(obsPouco');
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp(' ');

diary off
winopen([pathname, nomeWord]);
guidata(hObject,handles);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

format bank
pathname = handles.pathname;
cellCent = handles.cellCent;
cellPert = handles.cellPert;
variacao = handles.variacao;


cellPert
CellCent
 

 
%cabTab1 = {'Genotipos', 'Ampla', 'Favoravel', 'Desfavoravel', 'Pouco', 'Recomendacao'};
res1= cellPert;



nome = [pathname,'recomendacao.xlsx'];
delete(nome);
nomeTab1 = {'Tabela 1. Recomendação dos Genótipos'};
xlswrite(nome,nomeTab1,1,'A1');
xlswrite(nome,res1,1,'A3');
 
 nomeTab2 = {'Tabela 2. Fuzzy Centróides'};
 xlswrite(nome,nomeTab2,2,'A1');
% [nlC ncC] = size(cellCent);
%  for j = 1:ncC
%  cab2{j} = ['Ambiente ' num2str(j)];
%  end
%  cab2
%  %cellCent = [cab2; cellCent];
%  
%  rot = {'Centroides'; 'Ampla'; 'Favoravel'; 'Desfavoravel'; 'Pouco Adaptado'};
%  
%  cellCent = [rot cellCent];
 
 
 
xlswrite(nome,cellCent,2,'A3');



 
cellVariacao = num2cell(variacao);

[nlV ncV] = size(variacao);
variacao
seq = 1:1:nlV;
seq = seq'
cellVariacao = [num2cell(seq) cellVariacao]
cabVar = {'Iteracao' 'Variacao'}
cellVariacao = [cabVar; cellVariacao]


nomeTab2 = {'Tabela 3. Variação do Erro ao Longo das Iterações'};
xlswrite(nome,nomeTab2,3,'A1');
xlswrite(nome,cellVariacao,3,'A3');
% 
% nomeTab4 = {'Tabela 4. Centróides padronizados dos neurônios'};
% xlswrite(nome,nomeTab4,4,'A1');
% [nlinCen  ncolCen] = size(centroides);
% cen = 1:1:nlinCen;
% cen = cen';
% tabCen = [cen, centroides];
% tabCen = num2cell(tabCen);
% cabeCen = ['Neurônios', texto];
% tabCentroides = [cabeCen;tabCen];
% xlswrite(nome,tabCentroides,4,'A3');
% 
% 
% matrizPert = handles.matrizPert;
% matrizPert(:,3:4) = 100*matrizPert(:,3:4);
% matrizPert = num2cell(matrizPert)
% nGrupos = handles.nGrupos;
% for l = 1:1:nGrupos
%     grupo = num2str(l);
%     cabPert{l} = ['Grupo ',grupo];
% end
% cab = ['Observações','Classes', cabPert]
% 
% matrizPert = [cab;matrizPert];
% nomeTab5 = {'Tabela 5. Classificação e Pertinências das observações avaliadas'};
% xlswrite(nome,nomeTab5,5,'A1');
% xlswrite(nome,matrizPert,5,'A3');
 winopen(nome);







% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

% Leitura de dados
arquivo = handles.arquivo;
pathname = handles.pathname;
num = load(arquivo);
[nGenotipos cccc] = size(num);
handles.nGenotipos = nGenotipos;
% Seleção de Análise (1 - Por ambiente / 2 = Por Tipos de ambientes)
indiceSel = get(handles.popupmenu1,'Value');
if (indiceSel == 1)
    num = num;
elseif (indiceSel == 2)
    num = procMedEsp(num);
end

handles.Or = num;

% Centroides
Originais = procCentroidesTEste(num);
[nGen nAmb] = size(num);
genotipos = Originais(1:nGen,:);
ideotipos = Originais(nGen+1:end,:);
num = Originais;

% Analise
exp = get(handles.edit3,'String');
exp = str2num(exp);
handles.exp = exp;

varMin = get(handles.edit4,'String');
varMin = str2num(varMin);
handles.varMin = varMin;

iteracoes = get(handles.edit5,'String');
iteracoes = str2num(iteracoes);
handles.iteracoes = iteracoes;

Originais = num;

handles.Originais = Originais;
[linhas colunas] = size(num);

% num = num';
% 
% for k = 1:1:colunas
%     
%     dadosNorm1(k,:) = Normatiza(num(k,:),num(k,:),0,1);
%     
%     
% end
% 
% num = dadosNorm1';

opcoes = [exp,iteracoes,varMin,0];
[centroides, pertinencias, variacao] = fcm(num,4,opcoes);

[nlin ncol] = size(pertinencias);
for k = 1:ncol
    classes(k) = find(pertinencias(:,k)==max(pertinencias(:,k)));
end
[nlin ncol] = size(num);
ordem = 1:1:nlin;
pertinencias = pertinencias*100;
matrizPert = [ordem' classes' pertinencias'];

ordemGen = ordem(:,1:nGen);
classesGen = classes(:,1:nGen);
matrizGenotipos = [ordemGen' genotipos classesGen'];


ordemId = ordem(:,nGen+1:end);
classesId = classes(:,nGen+1:end);
matrizId = [ordemId' ideotipos classesId'];

handles.pertinencias = pertinencias;
handles.variacao = variacao;
handles.classes = classes;


[nlCen ncCen] = size(centroides);
CenNorm = centroides;
% cen = centroides';
% for k = 1:1:ncCen
%     
%     CenNorm(k,:) = DNormatiza(cen(k,:),Originais(:,k),0,1);
%     
%     
% end
% CenNorm = CenNorm';
% handles.CenNorm = CenNorm;
[cellPert cellCent] = alterarMatrizPertinencias(matrizPert, CenNorm);

format bank
matrizCentroides = cell2mat(cellCent);
pertinenciasGen = cell2mat(cellPert(1:nGen,2:5));

cellVariacao = num2cell(variacao);

[nlV ncV] = size(variacao);

seq = 1:1:nlV;
seq = seq';
cellVariacao = [num2cell(seq) cellVariacao];
cabVar = {'Iteracao' 'Variacao'};
cellVariacao = [cabVar; cellVariacao];

[nlC ncC] = size(cellCent);
 for j = 1:ncC
 cab2{j} = ['Ambiente ' num2str(j)];
 end

 cellCent = [cab2; cellCent];
 
 rot = {'Centroides'; 'Ampla'; 'Favoravel'; 'Desfavoravel'; 'Pouco Adaptado'};
 
 cellCent = [rot cellCent];

 cabTab1 = {'Genotipos', 'Ampla', 'Favoravel', 'Desfavoravel', 'Pouco', 'Recomendacao'};
cellPert= [cabTab1;cellPert];


handles.cellCent = cellCent;
handles.cellPert = cellPert;
handles.num = num;
handles.cellVariacao = cellVariacao;
[nlVar ncVar] = size(cellVariacao(2:end,:));

var = cell2mat(cellVariacao(2:end,:));


% Graficos

% axes(handles.axes1);plot(var(:,1),var(:,2),'--rs','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','g',...
%                 'MarkerSize',10);
% ylabel('Erro'); 
% xlabel('Iterações');
% title(['Variação do Erro ao Longo das ' num2str(nlVar)  ' Iterações']);


axes(handles.axes1);h = bar(pertinenciasGen);
xlim([0 nGen+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Ampla Adaptabilidade','Ambientes Favoráveis','Ambientes Desfavoráveis','Mínima Adaptabilidade',...
              'Location','Best');
colormap jet 


matrizCentroides(1, end+1) = matrizId(end-3,end);
matrizCentroides(2, end) = matrizId(end-2,end);
matrizCentroides(3, end) = matrizId(end-1,end);
matrizCentroides(4, end) = matrizId(end,end);


if (indiceSel == 1)
    
elseif (indiceSel == 2)
    

figure('Name', 'Dispersão das médias dos genótipos em ambientes favoráveis e desfavoráveis');

for j = 1:nGen
    if matrizGenotipos(j,end)==1
        plot(matrizGenotipos(j,3),matrizGenotipos(j,2),'bo', 'MarkerSize',5)
    elseif matrizGenotipos(j,end)==2
            plot(matrizGenotipos(j,3),matrizGenotipos(j,2),'go', 'MarkerSize',5)
            elseif matrizGenotipos(j,end)==3
            plot(matrizGenotipos(j,3),matrizGenotipos(j,2),'ko', 'MarkerSize',5)
            elseif matrizGenotipos(j,end)==4
            plot(matrizGenotipos(j,3),matrizGenotipos(j,2),'ro', 'MarkerSize',5)
            else
            
       
    end
hold all    
end

% for j = 1:84
%     if matrizId(j,end)==1
%         plot(matrizId(j,3),matrizId(j,2),'b.', 'MarkerSize',15)
%     elseif matrizId(j,end)==2
%             plot(matrizId(j,3),matrizId(j,2),'g.', 'MarkerSize',15)
%             elseif matrizId(j,end)==3
%             plot(matrizId(j,3),matrizId(j,2),'k.', 'MarkerSize',15)
%             elseif matrizId(j,end)==4
%             plot(matrizId(j,3),matrizId(j,2),'r.', 'MarkerSize',15)
%             else
%             
%        
%     end
% hold all    
% end

for j = 1:4
    if matrizCentroides(j,end)==1
        plot(matrizCentroides(j,2),matrizCentroides(j,1),'b*', 'MarkerSize',10)
    elseif matrizCentroides(j,end)==2
            plot(matrizCentroides(j,2),matrizCentroides(j,1),'g*', 'MarkerSize',10)
            elseif matrizCentroides(j,end)==3
            plot(matrizCentroides(j,2),matrizCentroides(j,1),'k*', 'MarkerSize',10)
            elseif matrizCentroides(j,end)==4
            plot(matrizCentroides(j,2),matrizCentroides(j,1),'r*', 'MarkerSize',10)
            else
            
       
    end
hold all    
end
xlabel('Média em Ambientes Desfavoráveis','fontsize',12,'fontweight','b'); ylabel('Médias em Ambientes Favoráveis','fontsize',12,'fontweight','b');
title('Dispersão dos genótipos em ambientes específicos','fontsize',12,'fontweight','b')
end
helpdlg('A fase de treinamento foi processada com sucesso!');
guidata(hObject, handles);

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
pathname = 'C:\BioFuzzy\Exemplos\prj0002_FCM_GXA\';
handles.pathname = pathname;
filename = 'prj0002.txt';
handles.filename = filename;
arquivo = 'C:\BioFuzzy\Exemplos\prj0002_FCM_GXA\prj0002.txt';
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');
guidata(hObject,handles);
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
