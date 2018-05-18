function varargout = control_003(varargin)
% CONTROL_003 MATLAB code for control_003.fig
%      CONTROL_003, by itself, creates a new CONTROL_003 or raises the existing
%      singleton*.
%
%      H = CONTROL_003 returns the handle to a new CONTROL_003 or the handle to
%      the existing singleton*.
%
%      CONTROL_003('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_003.M with the given input arguments.
%
%      CONTROL_003('Property','Value',...) creates a new CONTROL_003 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_003_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_003_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control_003

% Last Modified by GUIDE v2.5 08-Aug-2017 20:11:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_003_OpeningFcn, ...
                   'gui_OutputFcn',  @control_003_OutputFcn, ...
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


% --- Executes just before control_003 is made visible.
function control_003_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control_003 (see VARARGIN)

% Choose default command line output for control_003
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control_003 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_003_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;
dados = load(arquivo);

posSel = get(handles.popupmenu4,'Value');
varSel = get(handles.popupmenu4,'String');
varSel = varSel{posSel};
varSel = str2num(varSel);

selecionados =find(dados(:,1) == varSel);
dadosAnalisar = dados(selecionados,2:end);
[nlin ncol] = size(dadosAnalisar);

%% ************************************************************************
% *********** 4. Criando o controlador Fuzzy              *****************
% *************************************************************************
%% Criando o controlador Fuzzy

fis = newfis('newsys','sugeno','min', 'probor', 'prod','sum','wtaver');


%% Variável: Média em ambientes Favoráveis

posSel = get(handles.popupmenu1,'Value');
PMFAV = get(handles.popupmenu1,'String');
PMFAV = PMFAV{posSel};
PMFAV = str2num(PMFAV);

if PMFAV >= 50;
Parametro1 = 2*PMFAV - 100;
Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMFAV - 0;
end

fis = addvar(fis,'input','MFAV',[0 100]);
fis = addmf(fis,'input',1,'Baixo','zmf',[Parametro1 Parametro2]);
fis = addmf(fis,'input',1,'Alto','smf',[Parametro1 Parametro2]);

figure('Name', 'Variáveis Fuzzy de Entrada','NumberTitle','off')
subplot(2,3,1);plotmf(fis,'input',1)
%grid(gca,'minor')

%% Variável: Média em ambientes Desfavoráveis

posSel = get(handles.popupmenu2,'Value');
PMDESF = get(handles.popupmenu2,'String');
PMDESF = PMDESF{posSel};
PMDESF = str2num(PMDESF);


if PMDESF >= 50;
Parametro3 = 2*PMDESF - 100;
Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMDESF - 0;
end

fis = addvar(fis,'input','MDESF',[0 100]);
fis = addmf(fis,'input',2,'Baixo','zmf',[Parametro3 Parametro4]);
fis = addmf(fis,'input',2,'Alto','smf',[Parametro3 Parametro4]);
subplot(2,3,3)
plotmf(fis,'input',2);
%grid(gca,'minor')

%% Variável: B1

fis = addvar(fis,'input','B1',[-5 7]);
fis = addmf(fis,'input',3,'Menor1','zmf',[-5 1]);
fis = addmf(fis,'input',3,'1','pimf',[-5 1 1 7]);
fis = addmf(fis,'input',3,'Maior1','smf',[1 7]);

subplot(2,3,4);plotmf(fis,'input',3)
%grid(gca,'minor')

%% Variável: B1 + B2

fis = addvar(fis,'input','B1+B2',[-5 7]);
fis = addmf(fis,'input',4,'Menor1','zmf',[-5 1]);
fis = addmf(fis,'input',4,'1','pimf',[-5 1 1 7]);
fis = addmf(fis,'input',4,'Maior1','smf',[1 7]);

subplot(2,3,5);plotmf(fis,'input',4)
%grid(gca,'minor')

%% Variável: R2


posSel = get(handles.popupmenu3,'Value');
PMR2 = get(handles.popupmenu3,'String');
PMR2 = PMR2{posSel};
PMR2 = str2num(PMR2);


if PMR2 >= 50;
Parametro5 = 2*PMR2 - 100;
Parametro6 = 100;
else
    Parametro5 = 0;
    Parametro6 = 2*PMR2 - 0;
end

fis = addvar(fis,'input','R2',[0 100]);
fis = addmf(fis,'input',5,'Baixo','zmf',[Parametro5 Parametro6]);
fis = addmf(fis,'input',5,'Alto','smf',[Parametro5 Parametro6]);

% figure(2)
subplot(2,3,6);plotmf(fis,'input',5);
%grid(gca,'minor')
%% Saída

fis = addvar(fis,'output','Comportamento',[0 100]);
fis = addmf(fis,'output',1,'Geral','constant',[100]);
fis = addmf(fis,'output',1,'Favoravel','constant',[75]);
fis = addmf(fis,'output',1,'Desfavoravel','constant',[50]);
fis = addmf(fis,'output',1,'Ruim','constant',[25]);

%subplot(213)
%plotmf(fis,'output',1)
%grid(gca,'minor')

%% Rules
ruleList=[
2 2 1 3 2 1 1 1
2 2 2 3 2 2 1 1
2 1 1 3 2 2 1 1
2 1 2 3 2 2 1 1
2 1 3 3 2 2 1 1
2 2 3 3 2 2 1 1
1 2 1 1 2 3 1 1
1 2 1 2 2 3 1 1
1 2 1 3 2 3 1 1
2 2 1 1 2 3 1 1
2 2 1 2 2 3 1 1
1 2 2 1 2 4 1 1
1 2 2 2 2 4 1 1
1 2 2 3 2 4 1 1
2 2 2 1 2 4 1 1
2 2 2 2 2 4 1 1
1 1 1 1 1 4 1 1
1 1 1 1 2 4 1 1
1 1 1 2 1 4 1 1
1 1 1 2 2 4 1 1
1 1 1 3 1 4 1 1
1 1 1 3 2 4 1 1
1 1 2 1 1 4 1 1
1 1 2 1 2 4 1 1
1 1 2 2 1 4 1 1
1 1 2 2 2 4 1 1
1 1 2 3 1 4 1 1
1 1 2 3 2 4 1 1
1 1 3 1 1 4 1 1
1 1 3 1 2 4 1 1
1 1 3 2 1 4 1 1
1 1 3 2 2 4 1 1
1 1 3 3 1 4 1 1
1 1 3 3 2 4 1 1
1 2 1 1 1 4 1 1
1 2 1 2 1 4 1 1
1 2 1 3 1 4 1 1
1 2 2 1 1 4 1 1
1 2 2 2 1 4 1 1
1 2 2 3 1 4 1 1
1 2 3 1 1 4 1 1
1 2 3 1 2 4 1 1
1 2 3 2 1 4 1 1
1 2 3 2 2 4 1 1
1 2 3 3 1 4 1 1
1 2 3 3 2 4 1 1
2 1 1 1 1 4 1 1
2 1 1 1 2 4 1 1
2 1 1 2 1 4 1 1
2 1 1 2 2 4 1 1
2 1 1 3 1 4 1 1
2 1 2 1 1 4 1 1
2 1 2 1 2 4 1 1
2 1 2 2 1 4 1 1
2 1 2 2 2 4 1 1
2 1 2 3 1 4 1 1
2 1 3 1 1 4 1 1
2 1 3 1 2 4 1 1
2 1 3 2 1 4 1 1
2 1 3 2 2 4 1 1
2 1 3 3 1 4 1 1
2 2 1 1 1 4 1 1
2 2 1 2 1 4 1 1
2 2 1 3 1 4 1 1
2 2 2 1 1 4 1 1
2 2 2 2 1 4 1 1
2 2 2 3 1 4 1 1
2 2 3 1 1 4 1 1
2 2 3 1 2 4 1 1
2 2 3 2 1 4 1 1
2 2 3 2 2 4 1 1
2 2 3 3 1 4 1 1
 ];
fis = addrule(fis,ruleList);
%ruleview(fis)
%mfedit(fis) 
fuzzy(fis)

%writefis(fis,'Recomendacao');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%-----ANÁLISE DOS DADOS REAIS----%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados Media em ambientes Favoráveis

MedFAV = dadosAnalisar(1:nlin-2,1);
[nlinMedFAV ncolMedFAV] = size(MedFAV);

%% Padronização da Média em ambientes favoráveis

MEDGFAV = mean(MedFAV); % Média dos valores da média geral
variancia_MedFAV = var(MedFAV); % Variância dos valores da média geral
DP_MedFAV = sqrt(variancia_MedFAV); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_MedFAV; % Valor de 3 vezes o desvio padrão
minimoMedFAV = MEDGFAV - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoMedFAV = MEDGFAV + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizMedFAV = [minimoMedFAV;maximoMedFAV]; 

entradaMedFAV = Normatiza(MedFAV',matrizMedFAV',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedFAV = entradaMedFAV';


PifOR_PAD = [MedFAV entradaMedFAV]; % Comparação entre os valores originais e os padronizados


%% Dados Média em ambientes desfavoráveis

MedDESF = dadosAnalisar(1:nlin-2,2);
[nlinMedDESF ncolMedDESF] = size(MedDESF);

%% Padronização da Média em ambientes desfavoráveis

MEDGDESF = mean(MedDESF); % Média dos valores da média geral
variancia_MedDESF = var(MedDESF); % Variância dos valores da média geral
DP_MedDESF = sqrt(variancia_MedDESF); % Desvio padrão dos valores da média geral
sigX3 = 3*DP_MedDESF; % Valor de 3 vezes o desvio padrão
minimoMedDESF = MEDGDESF - sigX3; % Valor mínimo igual a media menos 3 vezes o desvio padrão
maximoMedDESF = MEDGDESF + sigX3; % Valor máximo igual a media mais 3 vezes o desvio padrão

matrizMedDESF = [minimoMedDESF;maximoMedDESF]; 

entradaMedDESF = Normatiza(MedDESF',matrizMedDESF',0,100); % Padronização dos dados para escala 1 a 100 para o controlador fuzzy
entradaMedDESF = entradaMedDESF';


PifOR_PAD = [MedDESF entradaMedDESF]; % Comparação entre os valores originais e os padronizados


%% Dados B1 

B1_BIS = dadosAnalisar(1:nlin-2,3);
[nlinB1_BIS ncolB1_BIS] = size(B1_BIS);

%% Intervalo de confiança IC = 95% Beta 1 = B1

varianciatB1_BIS = dadosAnalisar(nlin-1,3); % Variância B1 da análise de Ebehart e Russeel
%tB1_BIS = 1.96; % Valor de t a 5 grau de liberdade = 432. Comando R qt(0.95, 432)
tB1_BIS = 1.65;
ICtB1_BIS = tB1_BIS * sqrt(varianciatB1_BIS); % Intervalo de Confiança para o teste t
menortB1_BIS = 1- ICtB1_BIS;
maiortB1_BIS = 1+ICtB1_BIS;

matriz_B1_BIS = [menortB1_BIS;maiortB1_BIS];

entradaB1_BIS = Normatiza(B1_BIS',matriz_B1_BIS',-2,4); % Padronização dos valores de B1 entre 2 e 4 de acordo com o controlador fuzzy
entradaB1_BIS = entradaB1_BIS';

dadosB1_BIS = [B1_BIS entradaB1_BIS]; % Comparação entre os valoresde B1 originais e os padronizados


%% Dados B1 + B2

B1B2_BIS = dadosAnalisar(1:nlin-2,4);
[nlinB1B2_BIS ncolB1B2_BIS] = size(B1B2_BIS);

%% Intervalo de confiança IC = 95% Beta 1 = B1

varianciatB1B2_BIS = dadosAnalisar(nlin,4); % Variância B1 da análise de Ebehart e Russeel
%tB1B2_BIS = 1.96; % Valor de t a 5 grau de liberdade = 432. Comando R qt(0.95, 432)
tB1B2_BIS = 1.65;
ICtB1B2_BIS = tB1B2_BIS * sqrt(varianciatB1B2_BIS); % Intervalo de Confiança para o teste t
menortB1B2_BIS = 1- ICtB1B2_BIS;
maiortB1B2_BIS = 1+ICtB1B2_BIS;

matriz_B1B2_BIS = [menortB1B2_BIS;maiortB1B2_BIS];

entradaB1B2_BIS = Normatiza(B1B2_BIS',matriz_B1B2_BIS',-2,4); % Padronização dos valores de B1 entre 2 e 4 de acordo com o controlador fuzzy
entradaB1B2_BIS = entradaB1B2_BIS';

dadosB1B2_BIS = [B1B2_BIS entradaB1B2_BIS]; % Comparação entre os valoresde B1 originais e os padronizados


%% Dados R2 - Unico dado não padronizado, já que ele adequa à escala do controlador fuzzy (0 a 100)

R2_BIS = dadosAnalisar(1:nlin-2,5); % Dados originais de R2
[nlinR2_BIS ncolR2_BIS] = size(R2_BIS);


%% Dados

ordem = 1:nlinR2_BIS;
ordem = ordem';
dadosBIS = [ordem entradaMedFAV entradaMedDESF entradaB1_BIS entradaB1B2_BIS R2_BIS]; % Dados padronizados de média geral e de B1
[nlindadosBIS ncoldadosBIS] = size(dadosBIS);

%% Recebendo o controlador fuzzy montado

%% Obtendo os valores de saida para o controlador de adaptabilidade (Ebehart e Russel) 

%[outputs_BIS, ER, ERR, PertPorRegra] = evalfis(dadosBIS(1,2:6),fis,1); % Submetendo os genótipos (valores de média geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.
%[outputs_ER, ER, ERR, PertPorRegra]= evalfis( [57.2 2.434 62.72],fis,1); % Submetendo os genótipos (valores de média geral e B1 padronizados) ao controlador fuzzy de adaptabilidade criado.

PertRegras = [];

for i = 1:nlin-2
    [E, ER, ERR, PertPorRegra]= evalfis(dadosBIS(i,2:6),fis,1);
    %[a, Pert_Entrada, b, c]= evalfis(dados(i,:),fisSOM ,10000); 

    PertRegras(:,i) = PertPorRegra(:,1);

end


PertRegras2 = PertRegras';

cab3BIS = {'Regra1', 'Regra2', 'Regra3', 'Regra4' , 'Regra5', 'Regra6', 'Regra7', 'Regra8', 'Regra9', 'Regra10', 'Regra11', 'Regra12', 'Regra13', 'Regra14', 'Regra15', 'Regra16', 'Regra17', 'Regra18', 'Regra19' , 'Regra20', 'Regra21', 'Regra22', 'Regra23', 'Regra24' 'Regra25', 'Regra26', 'Regra27', 'Regra28' , 'Regra29', 'Regra30', 'Regra31', 'Regra32', 'Regra33', 'Regra34', 'Regra35', 'Regra36', 'Regra37', 'Regra38', 'Regra39', 'Regra40', 'Regra41', 'Regra42', 'Regra43' , 'Regra44', 'Regra45', 'Regra46', 'Regra47', 'Regra48' 'Regra49', 'Regra50', 'Regra51', 'Regra52' , 'Regra53', 'Regra54', 'Regra55', 'Regra56', 'Regra57', 'Regra58', 'Regra59', 'Regra60', 'Regra61', 'Regra62', 'Regra63', 'Regra64', 'Regra65', 'Regra66', 'Regra67' , 'Regra68', 'Regra69', 'Regra70', 'Regra71', 'Regra72'};
MatrizPertsSaidaBIS2 = tabela(PertRegras2,cab3BIS); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências


%% Primeira Saida - Cinco grupos (Ruim-Desfavoravel, Desfavoravel, Geral, Favoravel e Ruim-Favoravel) - Disjuntos
[nlinPR ncolPR] = size(PertRegras);

pertinencias = [];
for k = 1:ncolPR
    
PertRuim = max(PertRegras(12:72,k));
PertGeral = max(PertRegras(1,k));
PertFavoravel = max(PertRegras(2:6,k));
PertDesfavoravel = max(PertRegras(7:11,k));
Perts = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
pertinencias(k,:) = Perts(1,:);
end
%Pert_Output_ER2 = [PertGeral PertRuim PertFavoravel PertDesfavoravel]; 
DadosOutput2ER = [dadosBIS(1:nlin-2,:) pertinencias]; % Dados padronizados de média geral, B1 e R2 e suas pertinências

cab3BIS = {'Genótipos', 'MEDFAV' , 'MEDESF','B1', 'B1+B2', 'R2', 'A.G.', 'P.A','A.A.F','A.A.D'};
MatrizPertsSaidaER2 = tabela(DadosOutput2ER,cab3BIS); % Tabela dos dados padronizados de média geral , B1 e R2 e suas pertinências

% Parte Gráfica

axes(handles.axes1);h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Adaptabilidade a Ambientes Favoráveis','Adaptabilidade a Ambientes Desfavoráveis','Pouco Adaptado',...
              'Location','Best');
colormap jet

figura = figure('visible', 'off');
h = bar(pertinencias.*100);ylabel('Pertinências', 'FontSize',14);xlabel('Genótipos','FontSize',14)
xlim([0 nlin+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
hleg = legend('Adaptabilidade Geral','Adaptabilidade a Ambientes Favoráveis','Adaptabilidade a Ambientes Desfavoráveis','Pouco Adaptado',...
              'Location','Best');
colormap jet
% saveas(figura,[pathname,'Control_CTRV_Saidas'], 'png')
% close(figura)
print (figura, '-dpng', '-r400', [pathname,'Control_CTRV_Saidas']);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%--------Resultados-------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matriz = cell(nlin-2,5);
cabecalho = {'Genótipos' 'Classificação' 'Comportamento' ' ' 'Pertinencia'};
[nl nc] = size(cabecalho);

for h = 1:nc
    
    matriz{1,h} = cabecalho{1,h};
end

for i = 1:nlin-2
       
    matriz{i+1,1} = ordem(i,1);
    
end

    
for j = 1:nlin-2
  %rec = Pert_Output_ER2(j,:);
    rec = pertinencias(j,:);
  posicao = find(rec > 0.50);
  
  matriz{j+1,2} = posicao;
  
end
   
for k = 1:nlin-2
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

for w = 1:nlin-2
  %rec = Pert_Output_ER2(w,:);
  rec = pertinencias(w,:);
    
  posicao = find(rec > 0.50);
  
  %matriz{w+1,5} = Pert_Output_ER2(w, posicao);
  matriz{w+1,5} = pertinencias(w, posicao);
  
end

matrizcomp = matriz(:,1:2:5)



%7.3  Garavação dos resultados
nome = [pathname,'control_CTRV.txt'];
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
fprintf('Controlador: Cruz, Torres e Vencovsky (1989) \n');
fprintf('Parâmetros Iniciais \n');
fprintf('Sistema de Inferência Fuzzy (FIS): Sugeno \n');
fprintf('Ponto de Corte (Média Ambientes Favoráveis):  %d\n',PMFAV);
fprintf('Ponto de Corte (Média Ambientes Desfavoráveis):  %d\n',PMDESF);
fprintf('Ponto de Corte para R²:  %d\n',PMR2);
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

% Planilhas

% nomexls = [pathname,'controle_CTRV.xlsx'];
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
set(handles.popupmenu4,'String',vetorVariaveis);


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


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
pathname = 'C:\BioFuzzy\Exemplos\control_003\';
handles.pathname = pathname;
filename = 'dados.txt';
handles.filename = filename;
arquivo = 'C:\BioFuzzy\Exemplos\control_003\dados.txt';
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');

dados = load(arquivo);
numeroVariaveis = max(dados);
vetorVariaveis = 1:1:numeroVariaveis;
vetorVariaveis = num2str(vetorVariaveis');
vetorVariaveis = num2cell(vetorVariaveis);
set(handles.popupmenu4,'String',vetorVariaveis);


guidata(hObject,handles);
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
