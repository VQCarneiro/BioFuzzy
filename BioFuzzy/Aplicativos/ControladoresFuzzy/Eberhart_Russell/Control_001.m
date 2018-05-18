function varargout = Control_001(varargin)
% CONTROL_001 MATLAB code for Control_001.fig
%      CONTROL_001, by itself, creates a new CONTROL_001 or raises the existing
%      singleton*.
%
%      H = CONTROL_001 returns the handle to a new CONTROL_001 or the handle to
%      the existing singleton*.
%
%      CONTROL_001('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_001.M with the given input arguments.
%
%      CONTROL_001('Property','Value',...) creates a new CONTROL_001 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Control_001_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Control_001_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Control_001

% Last Modified by GUIDE v2.5 05-Aug-2017 15:35:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Control_001_OpeningFcn, ...
                   'gui_OutputFcn',  @Control_001_OutputFcn, ...
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


% --- Executes just before Control_001 is made visible.
function Control_001_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Control_001 (see VARARGIN)

% Choose default command line output for Control_001
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Control_001 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Control_001_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% Leitura de dados
arquivo = handles.arquivo;
pathname = handles.pathname;
dados = load(arquivo);

posSel = get(handles.popupmenu6,'Value');
varSel = get(handles.popupmenu6,'String');
varSel = varSel{posSel};
varSel = str2num(varSel);

selecionados =find(dados(:,1) == varSel);
dadosAnalisar = dados(selecionados,2:end);
[nlin ncol] = size(dadosAnalisar);

%% ************************************************************************
% *********** 4. Criando o controlador Fuzzy              *****************
% *************************************************************************
fisSel = get(handles.popupmenu7,'Value');
if (fisSel == 1)
   fis = newfis('newsys','mamdani','min', 'max', 'min','max','mom');
   nomeFis = 'Mamdani';
elseif (fisSel == 2)
   fis = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtaver');
   nomeFis = 'Sugeno';
end

%4.1 Variável: Média Geral
posSel = get(handles.popupmenu1,'Value');
PM = get(handles.popupmenu1,'String');
PM = PM{posSel};
PM = str2num(PM);


figure('Name','Variáveis Fuzzy de Entrada','NumberTitle','off')
if PM >= 50;
Parametro1 = 2*PM - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PM - 0;
end

fis = addvar(fis,'input','Media',[0 100]);
fis = addmf(fis,'input',1,'Baixa','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alta','smf',[Parametro1 Parametro2]);
subplot(131)
plotmf(fis,'input',1)
%grid(gca,'minor')


%4.2  Variável: B1
fis = addvar(fis,'input','B1',[-5 7]);
fis = addmf(fis,'input',2,'Menor1','zmf',[-5 1]);
fis = addmf(fis,'input',2,'1','pimf',[-5 1 1 7]);
fis = addmf(fis,'input',2,'Maior1','smf',[1 7]);

subplot(132)
plotmf(fis,'input',2)
%grid(gca,'minor')

%4.3 Variável: R2

posSel = get(handles.popupmenu5,'Value');
PMR2 = get(handles.popupmenu5,'String');
PMR2 = PMR2{posSel};
PMR2 = str2num(PMR2);


if PMR2 >= 50;
Parametro3 = 2*PMR2 - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMR2 - 0;
end

fis = addvar(fis,'input','R2',[0 100]);
fis = addmf(fis,'input',3,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',3,'Alto','smf',[Parametro3 Parametro4]);
subplot(133)
plotmf(fis,'input',3);
%grid(gca,'minor')

%4.4 Saída fuzzy

if strcmp(nomeFis,'Mamdani')==1
fis = addvar(fis,'output','Comportamento',[-100 100]);
fis = addmf(fis,'output',1,'Desfavoravel','pimf',[-100 -50 -50 0]);
fis = addmf(fis,'output',1,'Pouco Adaptado','pimf',[-50 0 0 50]);
fis = addmf(fis,'output',1,'Favoravel','pimf',[0 50 50 100]);
fis = addmf(fis,'output',1,'Geral Desfavoravel','zmf',[-100 -50]);
fis = addmf(fis,'output',1,'Geral Favoravel','smf',[50 100]);

ruleList=[
 1 1 1 2 1 1 %1
 1 1 2 2 1 1 %2
 1 2 1 2 1 1 %3
 1 2 2 2 1 1 %4
 1 3 1 2 1 1 %5
 1 3 2 2 1 1 %6
 2 1 1 2 1 1 %7
 2 2 1 2 1 1 %8
 2 3 1 2 1 1 %9
 2 1 2 1 1 1 %10
 2 2 2 4 1 1 %11
 2 2 2 5 1 1 %12
 2 3 2 3 1 1 %13
 ];

else
fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favorável','constant',[75]);
fis = addmf(fis,'output',1,'Desfavorável','constant',[25]);
fis = addmf(fis,'output',1,'Pouco Adaptado','constant',[0]);

ruleList=[1 1 1 4 1 1 %1
1 1 2 4 1 1 %2
1 2 1 4 1 1 %3
1 2 2 4 1 1 %4
1 3 1 4 1 1 %5
1 3 2 4 1 1 %6
2 1 1 4 1 1 %7
2 2 1 4 1 1 %8
2 3 1 4 1 1 %9
2 2 2 1 1 1 %10
2 3 2 2 1 1 %11
2 1 2 3 1 1]; %12

end
% subplot(224)
% plotmf(fis,'output',1)
% grid(gca,'minor')

%4.5 Salvando o gráfico
 saveas(gcf,[pathname,'Controle_ER'], 'png')

%% ************************************************************************
% *********** 5. Estabelecimento de Regras                *****************
% *************************************************************************
fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
%fuzzy(fis)
%writefis(fis,'Recomendacao');



%% ************************************************************************
% *********** 6. Processamento de dados                   *****************
% *************************************************************************

% *************************************************************************
% 6.1  Dados Média Geral
% *************************************************************************

%a Estabelecimento do vetor de entrada
MediaGeral = dadosAnalisar(1:nlin-1,1);
[nlinM ncolM] = size(MediaGeral);

%b Padronização das Médias Gerais

MEDMedGeral = mean(MediaGeral); % Média dos valores da média geral
variancia_MER = var(MediaGeral); % Variância dos valores da média geral
DP_ER = sqrt(variancia_MER); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_ER; % Valor de 3 vezes o desvio padrão
minimoMG = MEDMedGeral - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoMG = MEDMedGeral + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizER = [minimoMG;maximoMG]; 

M_ER = MediaGeral;
[nlinMER ncolMER] = size(M_ER);

entradaMED_ER1 = Normatiza(M_ER',matrizER',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradaMED_ER2 = entradaMED_ER1';

dadosMG_ER = [MediaGeral entradaMED_ER2]; % Comparação entre os valores originais e os padronizados

% *************************************************************************
% 6.2  Dados B1
% *************************************************************************

%a Estabelecimento do vetor de entrada
B1_ER = dadosAnalisar(1:nlin-1,2);
[nlinB1_ER ncolB1_ER] = size(B1_ER);

%b Intervalo de confiança IC = 95% Beta 1 = B1

varianciatB1_ER = dadosAnalisar(nlin,1); % Variância B1 da análise de Ebehart e Russeel
tB1_ER = 1.96; % Valor de t a 5 grau de liberdade = 432. Comando R qt(0.95, 432)
ICtB1_ER = tB1_ER * sqrt(varianciatB1_ER); % Intervalo de Confiança para o teste t
menortB1_ER = 1- ICtB1_ER;
maiortB1_ER = 1+ICtB1_ER;

matriz_B1_ER = [menortB1_ER;maiortB1_ER];

entradaB1_ER = Normatiza(B1_ER',matriz_B1_ER',-2,4); % Padronização dos valores de B1 entre -2 e 4 de acordo com o controlador fuzzy
entradaB1_ER = entradaB1_ER';

dadosB1_ER = [B1_ER entradaB1_ER]; % Comparação entre os valoresde B1 originais e os padronizados


% *************************************************************************
% 6.3  Dados R2
% *************************************************************************
% Dados R2 - Unico dado não padronizado, já que ele adequa à escala do controlador fuzzy (0 a 100)

%a Estabelecimento do vetor de entrada
R2_ER = dadosAnalisar(1:nlin-1,3); % Dados originais de R2
[nlinR2_ER ncolR2_ER] = size(R2_ER);
ordem = 1:nlinR2_ER;

% % *************************************************************************
% % 6.4  Dados 
% % *************************************************************************
ordem = 1:nlinMER;
ordem = ordem';
dadosER = [ordem entradaMED_ER2 entradaB1_ER R2_ER]; % Dados padronizados de média geral e de B1
[nlindadosER ncoldadosER] = size(dadosER);


%% ************************************************************************
% *********** 7. Usando o Controlador Fuzzy               *****************
% *************************************************************************

if strcmp(nomeFis,'Mamdani')==1 % Sistema de Inferência Mamdani
combinado = [];
PertRegras = [];
for i = 1:nlin-1
    for g = 1:13
    [E, ER, ERR, PertPorRegra]= evalfis(dadosER(i,2:4),fis,1);
    
    PertRegras(:,g) = max(ERR(:,g));
    end
    combinado(i,:) = PertRegras(1,:);

end

PertRegras = combinado';

    
    cab3ER = {'Regra1', 'Regra2', 'Regra3', 'Regra4', 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12', 'Regra13'};
    MatrizPertsSaidaER2 = tabela(combinado,cab3ER); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências

    
    [nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(1:9,k));
PertGeral = max(PertRegras(11:12,k));
PertFavoravel = max(PertRegras(13,k));
PertDesfavoravel = max(PertRegras(10,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end

    
else % Sistema de Inferência Sugeno
    PertRegras = [];

for i = 1:nlin-1
    [E, ER, ERR, PertPorRegra]= evalfis(dadosER(i,2:4),fis,1);
    
    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';
cab3ER = {'Regra1', 'Regra2', 'Regra3', 'Regra4', 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12'};
MatrizPertsSaidaER2 = tabela(PertRegras2,cab3ER); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências

%7.1 Primeira Saida - Cinco grupos (Geral-Desfavoravel, Desfavoravel, Pouco Adaptado, Favoravel e Geral-Favoravel) 

[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(1:9,k));
PertGeral = max(PertRegras(10,k));
PertFavoravel = max(PertRegras(11,k));
PertDesfavoravel = max(PertRegras(12,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end

end

DadosOutput2ER = [dadosER(1:nlin-1,:) (pertinencias.*100)]; % Dados padronizados de média geral, B1 e R2 e suas pertinências

cab3ER = {'Genótipos', 'Média Geral' , 'B1', 'R²', 'A.G.', 'P.A.','A.A.F','A.A.D'};
MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cab3ER); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências


% Parte Gráfica
axes(handles.axes1);h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Ambientes Favoráveis','Ambientes Desfavoráveis','Mínima Adaptabilidade',...
              'Location','Best');
colormap jet

figura = figure('visible', 'off');
h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Ambientes Favoráveis','Ambientes Desfavoráveis','Mínima Adaptabilidade',...
              'Location','Best');
colormap jet
% saveas(figura,[pathname,'Controle_ER_Saidas'], 'png')
% close(figura)

print (figura, '-dpng', '-r400', [pathname,'Controle_ER_Saidas']);




%7.2 Segunda Saida - Genótipos Classificação Comportamento Pertinencia
matriz = cell(nlin,5);
cabecalho = {'Genótipos' 'Classificação' 'Comportamento' ' ' 'Pertinência'};
[nl nc] = size(cabecalho);

for h = 1:nc
    matriz{1,h} = cabecalho{1,h};
end

for i = 1:nlin-1
    matriz{i+1,1} = ordem(i,1);
 end

    
for j = 1:nlin-1
  rec = pertinencias(j,:);
  posicao = find(rec > 0.50);
  
  matriz{j+1,2} = posicao;
  
end
   
for k = 1:nlin-1
  valor = matriz{k+1,2};  
  
switch valor
    case 1
    matriz{k+1,3} = 'Adaptabilidade Geral';
    
    case 2
    matriz{k+1,3} = 'Pouco Adaptado';
    
    case 3
    matriz{k+1,3} = 'Adaptabilidade Favorável';
    
    case 4
    matriz{k+1,3} = 'Adaptabilidade Desfavorável';
    
       
end
end

for w = 1:nlin-1
  %rec = Pert_Output_ER2(w,:);
  rec = pertinencias(w,:);
    
  posicao = find(rec > 0.50);
  
  %matriz{w+1,5} = Pert_Output_ER2(w, posicao);
  matriz{w+1,5} = pertinencias(w, posicao);
  
end

matrizcomp = matriz(:,1:2:5);



%7.3  Garavação dos resultados
nome = [pathname,'controle_ER.txt'];
handles.nome=nome;
delete(nome)
diary on
diary(nome)
ahora= clock;
fprintf('Resultado FINAL   \n');
fprintf('-----------------------------------------------------------------------------------------------------   \n');
fprintf('dia: %d mes: %d ano: %d\n', ahora(3),ahora(2),ahora(1))
fprintf('%d horas %d minutos %d segundo \n', ahora(4),ahora(5),ahora(6))
fprintf('-----------------------------------------------------------------------------------------------------   \n');
fprintf('Controlador Fuzzy: Eberhart e Russell (1966) \n');
fprintf('Parâmetros Iniciais \n');
disp(['Sistema de Inferência Fuzzy (FIS): ' nomeFis]);
fprintf('Ponto de Corte para Média:  %d\n',PM);
fprintf('Ponto de Corte para R²   :  %d\n',PMR2);
fprintf('Variável Analisada:  %d\n',varSel);
fprintf('Arquivo de dados:   %s\n',arquivo);
fprintf(' \n');
fprintf('-----------------------------------------------------------------------------------------------------   \n');

fprintf('Classificação dos genótipos quanto a adaptabilidade e estabilidade segundo Eberhart e Russell (1966)')
disp(' ')
disp(' ')
disp(matrizcomp)
fprintf(' \n');

fprintf('-----------------------------------------------------------------------------------------------------   \n');

fprintf('Pertinências dos genótipos nas classes de adaptatilidade e estabilidade segundo Eberhart e Russell (1966)')
disp(' ')
disp(' ')
disp(MatrizPertsSaidaER2)
disp('A.G.: Adaptabilidade Geral; P.A.: Pouco Adaptado; A.A.F.: Adaptabilidade a ambientes Favoráveis;')
disp('A.A.D.: Adaptabilidade a ambientes Desfavoráveis');
fprintf('-----------------------------------------------------------------------------------------------------   \n');


diary off


% nomexls = [pathname,'controle_ER.xlsx'];
% handles.nomexls=nomexls;
% delete(nomexls);
% nomeTabExp = {'Classificação dos genótipos quanto a adaptabilidade e estabilidade segundo Eberhart e Russell (1966)'};
% xlswrite(nomexls,nomeTabExp,1,'A1');
% xlswrite(nomexls,matrizcomp,1,'A3');
% 
% nomeTabExp2 = {'Pertinências dos genótipos nas classes de adaptatilidade e estabilidade segundo Eberhart e Russell (1966)'};
% xlswrite(nomexls,nomeTabExp2,2,'A1');
% xlswrite(nomexls,MatrizPertsSaidaER2,2,'A3');

guidata(hObject, handles);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
nome = handles.nome;
winopen(nome);
guidata(hObject, handles);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
nomexls = handles.nomexls;
winopen(nomexls);
guidata(hObject, handles);
% hObject    handle to pushbutton5 (see GCBO)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.txt'},'File Selector');
handles.filename = filename;
handles.pathname = pathname;
arquivo = [pathname filename];
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');

dados = load(arquivo);
numeroVariaveis = max(dados);
vetorVariaveis = 1:1:numeroVariaveis;
vetorVariaveis = num2str(vetorVariaveis');
vetorVariaveis = num2cell(vetorVariaveis);
set(handles.popupmenu6,'String',vetorVariaveis);


guidata(hObject,handles);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
winopen(arquivo);
guidata(hObject,handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
pathname = 'C:\BioFuzzy\Exemplos\control_001\';
handles.pathname = pathname;
filename = 'dados.txt';
handles.filename = filename;
arquivo = 'C:\BioFuzzy\Exemplos\control_001\dados.txt';
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');

dados = load(arquivo);
numeroVariaveis = max(dados);
vetorVariaveis = 1:1:numeroVariaveis;
vetorVariaveis = num2str(vetorVariaveis');
vetorVariaveis = num2cell(vetorVariaveis);
set(handles.popupmenu6,'String',vetorVariaveis);


guidata(hObject,handles);




% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
