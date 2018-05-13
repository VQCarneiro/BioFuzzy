function varargout = control_005(varargin)
% CONTROL_005 MATLAB code for control_005.fig
%      CONTROL_005, by itself, creates a new CONTROL_005 or raises the existing
%      singleton*.
%
%      H = CONTROL_005 returns the handle to a new CONTROL_005 or the handle to
%      the existing singleton*.
%
%      CONTROL_005('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_005.M with the given input arguments.
%
%      CONTROL_005('Property','Value',...) creates a new CONTROL_005 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_005_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_005_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control_005

% Last Modified by GUIDE v2.5 09-Aug-2017 13:46:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_005_OpeningFcn, ...
                   'gui_OutputFcn',  @control_005_OutputFcn, ...
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


% --- Executes just before control_005 is made visible.
function control_005_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control_005 (see VARARGIN)

% Choose default command line output for control_005
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control_005 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_005_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;
dados = load(arquivo);
[nlin ncol] = size(dados);
num = dados;
posSel = get(handles.popupmenu1,'Value');
PMDESF = get(handles.popupmenu1,'String');
PMDESF = PMDESF{posSel};
PMDESF = str2num(PMDESF);

posSel = get(handles.popupmenu2,'Value');
PMFAV = get(handles.popupmenu2,'String');
PMFAV = PMFAV{posSel};
PMFAV = str2num(PMFAV);

PM = [PMDESF PMFAV];
[resumo matrizOriginal matrizPadronizada pertinencias parametros] = fuzzyMediasCentroide(num,PM,1);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Parte Gráfica%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
print (figura, '-dpng', '-r400', [pathname,'Control_MedEsp']);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Relatório%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nomeWord = 'resultados.txt';
nomeCompleto = [pathname, nomeWord];
handles.nomeCompleto = nomeCompleto;
delete([pathname, nomeWord]);
diary on
diary([pathname, nomeWord]);
disp('-------------------------------------------------------------------------');
disp('-----------------------------BIOFUZZY------------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vinícius Quintão Carneiro (vqcarneiro@gmail.com)')
disp(' ')
disp('-----------------------------INFORMAÇÕES---------------------------------');
disp('Sistema de controle fuzzy baseado em médias ambientais específicas (Ambientes Favoráveis e Desfavoráveis)')
disp(' ')
disp('* ENTRADAS: ')
disp('1. Médias Ambientais')
disp(['     1.1 Média BAIXA - zmf(',num2str(parametros(1,1)), ', ', num2str(parametros(1,2)),')'])
disp(['     1.2 Média ALTA - smf(',num2str(parametros(1,1)), ', ', num2str(parametros(1,2)),')'])
disp(' ')
disp('* SAÍDA: Comportamentos')
disp('1. Pouco Adaptado')
disp('2. Adaptabilidade Geral')
disp('3. Adaptabilidade a Ambientes Favoráveis')
disp('4. Adaptabilidade a Ambientes Desfavoráveis')
disp(' ')
disp(' ')
disp('* SISTEMA DE INFERÊNCIA: Sugeno')
disp('* MÉTODO DA INTERSEÇÃO (E): min')
disp(' ')
disp('---------------------REFERÊNCIAS BIBLIOGRÁFICAS--------------------------')
disp(' ')
disp('2. Carneiro, V.Q. (2015). Redes neurais e lógica fuzzy aplicadas no melhoramento de plantas') 
disp(' ')
disp(' ')
disp('---------------------------TRILHA DE DADOS-------------------------------');
disp(pathname);
disp('-------------------------------------------------------------------------');
disp('-------------------------------------------------------------------------');
disp('------------------------------RESULTADOS---------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ');
disp('Tabela 1. Resumo dos resultados completos do controlador fuzzy baseado médias ambientais específicas (Ambientes Favoráveis e Desfavoráveis).');
disp('______________________________________________________________________________________________________________________________');
disp(resumo)
disp('______________________________________________________________________________________________________________________________');
disp('------------------------------------------------------------------------------------------------------------------------------');
disp(' ')
disp(' ')
disp('Tabela 2. Resultados completos do controlador fuzzy baseado médias ambientais específicas (Ambientes Favoráveis e Desfavoráveis).');
disp('______________________________________________________________________________________________________________________________');
disp(matrizOriginal)
disp('______________________________________________________________________________________________________________________________');
disp('A.G.: Adaptabilidade Geral; P.A.: Pouco Adaptado; A.A.F.: Adaptabilidade a ambientes Favoráveis;')
disp('A.A.D.: Adaptabilidade a ambientes Desfavoráveis');

guidata(hObject,handles);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
pathname = handles.pathname;

posSel = get(handles.popupmenu1,'Value');
PMDESF = get(handles.popupmenu1,'String');
PMDESF = PMDESF{posSel};
PMDESF = str2num(PMDESF);



if PMDESF >= 50;
    Parametro1 = 2*PMDESF - 100;
    Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMDESF - 0;
end

x = 0:0.001:100;
yzmf1 = zmf(x,[Parametro1 Parametro2]);
ysmf1 = smf(x,[Parametro1 Parametro2]);
figura = figure('Name', 'Entradas fuzzy em todos os ambientes','NumberTitle','off');
subplot(1,2,1)
plot(x,yzmf1,'--black','LineWidth',2);
ylim([-0.1 1.5])
hold all
plot(x,ysmf1,'-black','LineWidth',2);
xlabel('Média em Ambiente Desfavorável','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Média Baixa','Média Alta');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')

subplot(1,2,2)
posSel = get(handles.popupmenu2,'Value');
PMFAV = get(handles.popupmenu2,'String');
PMFAV = PMFAV{posSel};
PMFAV = str2num(PMFAV);

if PMFAV >= 50;
    Parametro3 = 2*PMFAV - 100;
    Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMFAV - 0;
end

yzmf1 = zmf(x,[Parametro3 Parametro4]);
ysmf1 = smf(x,[Parametro3 Parametro4]);
plot(x,yzmf1,'--black','LineWidth',2);
ylim([-0.1 1.5]);
hold all
plot(x,ysmf1,'-black','LineWidth',2);
xlabel('Média em Ambiente Favorável','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Média Baixa','Média Alta');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')
print (figura, '-dpng', '-r400', [pathname,'Entradas_MedEsP']);

diary off


% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
nomeCompleto = handles.nomeCompleto;
winopen(nomeCompleto);
guidata(hObject, handles);


% hObject    handle to pushbutton6 (see GCBO)
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

set(handles.pushbutton5,'visible', 'on')
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
pathname = 'C:\BioFuzzy\Exemplos\control_005\';
handles.pathname = pathname;
filename = 'dados.txt';
handles.filename = filename;
arquivo = 'C:\BioFuzzy\Exemplos\control_005\dados.txt';
handles.arquivo = arquivo;
set(handles.edit1,'String',arquivo);
set(handles.edit1,'ForegroundColor','Black');

set(handles.pushbutton5,'visible','on')

guidata(hObject,handles);
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
