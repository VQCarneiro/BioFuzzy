function varargout = control_002(varargin)
% CONTROL_002 MATLAB code for control_002.fig
%      CONTROL_002, by itself, creates a new CONTROL_002 or raises the existing
%      singleton*.
%
%      H = CONTROL_002 returns the handle to a new CONTROL_002 or the handle to
%      the existing singleton*.
%
%      CONTROL_002('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_002.M with the given input arguments.
%
%      CONTROL_002('Property','Value',...) creates a new CONTROL_002 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_002_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_002_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control_002

% Last Modified by GUIDE v2.5 06-Aug-2017 23:36:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_002_OpeningFcn, ...
                   'gui_OutputFcn',  @control_002_OutputFcn, ...
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


% --- Executes just before control_002 is made visible.
function control_002_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control_002 (see VARARGIN)

% Choose default command line output for control_002
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control_002 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_002_OutputFcn(hObject, eventdata, handles) 
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
set(handles.popupmenu1,'String',vetorVariaveis);


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
winopen(arquivo);
guidata(hObject,handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;
dados = load(arquivo);

posSel = get(handles.popupmenu1,'Value');
varSel = get(handles.popupmenu1,'String');
varSel = varSel{posSel};
varSel = str2num(varSel);

selecionados =find(dados(:,1) == varSel);
dadosAnalisar = dados(selecionados,2:end);
[nlin ncol] = size(dadosAnalisar);

%% ************************************************************************
% *********** 4. Criando o controlador Fuzzy              *****************
% *************************************************************************
fis = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtaver');

% 4.1 Variável: Pif (Pi em ambientes favoráveis)
%figure(1)

posSel = get(handles.popupmenu2,'Value');
PMFAV = get(handles.popupmenu2,'String');
PMFAV = PMFAV{posSel};
PMFAV = str2num(PMFAV);

if PMFAV >= 50;
Parametro1 = 2*PMFAV - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMFAV - 0;
end

fis = addvar(fis,'input','Pif',[0 100]);
fis = addmf(fis,'input',1,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alto','smf',[Parametro1 Parametro2]);

figure('Name', 'Variáveis Fuzzy de Entrada','NumberTitle','off')
subplot(2,2,1)
plotmf(fis,'input',1)


% 4.2 Variável: Pif (Pi em ambientes desfavoráveis)
posSel = get(handles.popupmenu5,'Value');
PMDESF = get(handles.popupmenu5,'String');
PMDESF = PMDESF{posSel};
PMDESF = str2num(PMDESF);


if PMDESF >= 50;
Parametro3 = 2*PMDESF - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMDESF - 0;
end

fis = addvar(fis,'input','Pid',[0 100]);
fis = addmf(fis,'input',2,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',2,'Alto','smf',[Parametro3 Parametro4]);
subplot(2,2,2)
plotmf(fis,'input',2);


% 4.3 Variável: B1

fis = addvar(fis,'input','B1',[-5 7]);
fis = addmf(fis,'input',3,'Menor1','zmf',[-5 1]);
fis = addmf(fis,'input',3,'1','pimf',[-5 1 1 7]);
fis = addmf(fis,'input',3,'Maior1','smf',[1 7]);

subplot(2,2,3)
plotmf(fis,'input',3)

% 4.4 Variável: R2

posSel = get(handles.popupmenu6,'Value');
PMR2 = get(handles.popupmenu6,'String');
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
fis = addmf(fis,'input',4,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',4,'Alto','smf',[Parametro3 Parametro4]);
subplot(2,2,4)
plotmf(fis,'input',4);

% 4.5 Saída fuzzy

fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favoravel','constant',[75]);
fis = addmf(fis,'output',1,'Desfavoravel','constant',[50]);
fis = addmf(fis,'output',1,'Pouco Adaptado','constant',[25]);

%figure(2)
%plotmf(fis,'output',1)


% 4.6 Salvando o gráfico
 saveas(gcf,[pathname,'ControlH_ERLB'], 'png')

%% ************************************************************************
% *********** 5. Estabelecimento de Regras                *****************
% *************************************************************************


ruleList=[1 1 1 1 4 1 1 %1
1 1 2 1 4 1 1 %2
1 1 3 1 4 1 1 %3
1 2 1 1 4 1 1 %4
1 2 1 2 4 1 1 %5
1 2 2 1 4 1 1 %6
1 2 2 2 4 1 1 %7
1 2 3 1 4 1 1 %8
2 2 1 1 4 1 1 %9
2 2 1 2 4 1 1 %10
2 2 2 1 4 1 1 %11
2 2 2 2 4 1 1 %12
2 2 3 1 4 1 1 %13
2 2 3 2 4 1 1 %14
2 1 1 1 4 1 1 %15
2 1 3 2 4 1 1 %16
2 1 3 1 4 1 1 %17
2 1 2 1 4 1 1 %18
1 1 1 2 3 1 1 %19
2 1 1 2 3 1 1 %20
2 1 2 2 3 1 1 %21
1 1 2 2 1 1 1 %22
1 1 3 2 2 1 1 %23
1 2 3 2 2 1 1 %24
 ];

fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
%fuzzy(fis)
%writefis(fis,'Recomendacao');



%% ************************************************************************
% *********** 6. Processamento de dados                   *****************
% *************************************************************************

% *************************************************************************
% 6.1  Dados Pif (Pi em ambientes favoráveis)
% *************************************************************************

%a Estabelecimento do vetor de entrada
Pif = dadosAnalisar(1:nlin-1,1);
[nlinPif ncolPif] = size(Pif);

%b Padronização das Pif

MEDPif = mean(Pif); % Média dos valores de Pif
variancia_Pif = var(Pif); % Variância dos valores de Pif
DP_Pif = sqrt(variancia_Pif); % Desvio padrão dos valores de Pif
sigX3 = 3*DP_Pif; % Valor de 3 vezes o desvio padrão
minimoPif = MEDPif - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoPif = MEDPif + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizPif = [minimoPif;maximoPif]; 

entradaPif = Normatiza(Pif',matrizPif',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradaPif = entradaPif';

PifOR_PAD = [Pif entradaPif]; % Comparação entre os valores originais e os padronizados

% *************************************************************************
% 6.1  Dados Pid (Pi em ambientes desfavoráveis)
% *************************************************************************

%a Estabelecimento do vetor de entrada
Pid = dadosAnalisar(1:nlin-1,2);
[nlinPid ncolPid] = size(Pid);

%b Padronização do Pid

MEDPid = mean(Pid); % Média dos valores do Pid
variancia_Pid = var(Pid); % Variância dos valores de Pid
DP_Pid = sqrt(variancia_Pid); % Desvio padrão dos valores de Pid
sigX3 = 3*DP_Pid; % Valor de 3 vezes o desvio padrão
minimoPid = MEDPid - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoPid = MEDPid + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizPid = [minimoPid;maximoPid]; 

entradaPid = Normatiza(Pid',matrizPid',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradaPid = entradaPid';


PidOR_PAD = [Pid entradaPid]; % Comparação entre os valores originais e os padronizados

% *************************************************************************
% 6.2  Dados B1
% *************************************************************************

%a Estabelecimento do vetor de entrada
B1_ER = dadosAnalisar(1:nlin-1,3);
[nlinB1_ER ncolB1_ER] = size(B1_ER);

%b Intervalo de confiança IC = 95% Beta 1 = B1

varianciatB1_ER = dadosAnalisar(nlin,3); % Variância B1 da análise de Ebehart e Russeel
tB1_ER = 1.96; % Valor de t a 5 grau de liberdade = 432. Comando R qt(0.95, 432)
ICtB1_ER = tB1_ER * sqrt(varianciatB1_ER); % Intervalo de Confiança para o teste t
menortB1_ER = 1- ICtB1_ER;
maiortB1_ER = 1+ICtB1_ER;

matriz_B1_ER = [menortB1_ER;maiortB1_ER];

entradaB1_ER = Normatiza(B1_ER',matriz_B1_ER',-2,4); % Padronização dos valores de B1 entre 2 e 4 de acordo com o controlador fuzzy
entradaB1_ER = entradaB1_ER';

dadosB1_ER = [B1_ER entradaB1_ER]; % Comparação entre os valoresde B1 originais e os padronizados


% *************************************************************************
% 6.3  Dados R2
% *************************************************************************
% Dados R2 - Unico dado não padronizado, já que ele adequa à escala do controlador fuzzy (0 a 100)

%a Estabelecimento do vetor de entrada
dadosAnalisar
R2_ER = dadosAnalisar(1:nlin-1,4); % Dados originais de R2
[nlinR2_ER ncolR2_ER] = size(R2_ER);
ordem = 1:nlinR2_ER;


% *************************************************************************
% 6.4  Dados 
% *************************************************************************
nlin = nlin-1;
ordem = 1:nlin;
ordem = ordem';
dadosPi = [ordem entradaPif entradaPid entradaB1_ER R2_ER]; % Dados padronizados do Pif, Pid, B1 e de R2
[nlindadosPi ncoldadosPi] = size(dadosPi);

%% ************************************************************************
% *********** 7. Usando o Controlador Fuzzy               *****************
% *************************************************************************

% Obtendo os valores de saida para o controlador de adaptabilidade (Ebehart e Russel & Lin e Binns) 

PertRegras = [];

for i = 1:nlin
    [E, ER, ERR, PertPorRegra]= evalfis(dadosPi(i,2:5),fis,1);
     

    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';

cab3ER = {'Regra1', 'Regra2', 'Regra3', 'Regra4' , 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12', 'Regra13', 'Regra14', 'Regra15', 'Regra16', 'Regra17', 'Regra18', 'Regra19' , 'Regra20', 'Regra21', 'Regra22', 'Regra23', 'Regra24' };
MatrizPertsSaidaER2 = tabela(PertRegras2,cab3ER); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências


% 7.1 Primeira Saida - Cinco grupos (Ruim, Desfavoravel, Geral e Favoravel)
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(1:18,k));
PertGeral = max(PertRegras(22,k));
PertFavoravel = max(PertRegras(23:24,k));
PertDesfavoravel = max(PertRegras(19:21,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
%Pert_Output_ER2 = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
DadosOutput2ER = [dadosPi(1:nlin,:) pertinencias]; % Dados padronizados de média geral, B1 e R2 e suas pertinências

cab3ER = {'Genótipos', 'Pif' , 'Pid','B1', 'R2', 'A.G.', 'P.A.','A.A.F','A.A.D'};
MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cab3ER); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências

% Parte Gráfica

axes(handles.axes1);h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Ambientes Favoráveis','Ambientes Desfavoráveis','Mínima Adaptabilidade',...
              'Location','Best');
colormap jet

figura = figure('visible', 'off');
h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Ambientes Favoráveis','Ambientes Desfavoráveis','Mínima Adaptabilidade',...
              'Location','Best');
colormap jet
% saveas(figura,[pathname,'ControlH_ERLB_Saidas'], 'png')
% close(figura)
print (figura, '-dpng', '-r400', [pathname,'ControlH_ERLB_Saidas']);



% 7.2 Segunda Saida - Genótipos Classificação Comportamento Pertinencia

matriz = cell(nlin,5);
cabecalho = {'Genótipos' 'Classificação' 'Comportamento' ' ' 'Pertinencia'};
[nl nc] = size(cabecalho);

for h = 1:nc
    
    matriz{1,h} = cabecalho{1,h};
end

for i = 1:nlin
       
    matriz{i+1,1} = ordem(i,1);
    
end

    
for j = 1:nlin
  
    rec = pertinencias(j,:);
  posicao = find(rec > 0.50);
  
  matriz{j+1,2} = posicao;
  
end
   
for k = 1:nlin
  valor = matriz{k+1,2};  
  
switch valor
    case 1
    matriz{k+1,3} = 'Adaptabilidade Geral';
    
    case 2
    matriz{k+1,3} = 'Pouco Adaptado';
    
    case 3
    matriz{k+1,3} = 'Adaptabilidade Favoravel';
    
    case 4
    matriz{k+1,3} = 'Adaptabilidade Desfavoravel';
    
       
end
end

for w = 1:nlin
  
  rec = pertinencias(w,:);
    
  posicao = find(rec > 0.50);
  
  
  matriz{w+1,5} = pertinencias(w, posicao);
  
end

matrizcomp = matriz(:,1:2:5);


%7.3  Garavação dos resultados
nome = [pathname,'controlH_ERLB.txt'];
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
fprintf('Controlador Híbrido: Eberhart e Russell (1966) e Lin e Binns (1988) modificado por Carneiro (1998) \n');
fprintf('Parâmetros Iniciais \n');
fprintf('Sistema de Inferência Fuzzy (FIS): Sugeno \n');
fprintf('Ponto de Corte para Pif:  %d\n',PMFAV);
fprintf('Ponto de Corte para Pid:  %d\n',PMDESF);
fprintf('Ponto de Corte para R²   :  %d\n',PMR2);
fprintf('Variável Analisada:  %d\n',varSel);
fprintf(' \n');
fprintf('-----------------------------------------------------------------------------------------------------   \n');



fprintf('Classificação dos genótipos quanto a adaptabilidade e estabilidade segundo controlador híbrido')
disp(' ')
disp(' ')
disp(matrizcomp)
fprintf(' \n');

fprintf('-----------------------------------------------------------------------------------------------------   \n');

fprintf('Pertinências dos genótipos nas classes de adaptatilidade e estabilidade segundo controlador híbrido')
disp(' ')
disp(' ')
disp(MatrizPertsSaidaER2)
disp('A.G.: Adaptabilidade Geral; P.A.: Pouco Adaptado; A.A.F.: Adaptabilidade a ambientes Favoráveis;')
disp('A.A.D.: Adaptabilidade a ambientes Desfavoráveis');
fprintf('-----------------------------------------------------------------------------------------------------   \n');

diary off
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
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
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


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
pathname = 'C:\BioFuzzy\Exemplos\control_002\';
handles.pathname = pathname;
filename = 'dados.txt';
handles.filename = filename;
arquivo = 'C:\BioFuzzy\Exemplos\control_002\dados.txt';
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');

dados = load(arquivo);
numeroVariaveis = max(dados);
vetorVariaveis = 1:1:numeroVariaveis;
vetorVariaveis = num2str(vetorVariaveis');
vetorVariaveis = num2cell(vetorVariaveis);
set(handles.popupmenu1,'String',vetorVariaveis);


guidata(hObject,handles);



% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
