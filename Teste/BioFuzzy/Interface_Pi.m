function varargout = Interface_Pi(varargin)
% INTERFACE_PI MATLAB code for Interface_Pi.fig
%      INTERFACE_PI, by itself, creates a new INTERFACE_PI or raises the existing
%      singleton*.
%
%      H = INTERFACE_PI returns the handle to a new INTERFACE_PI or the handle to
%      the existing singleton*.
%
%      INTERFACE_PI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_PI.M with the given input arguments.
%
%      INTERFACE_PI('Property','Value',...) creates a new INTERFACE_PI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interface_Pi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interface_Pi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interface_Pi

% Last Modified by GUIDE v2.5 06-Dec-2016 10:23:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Interface_Pi_OpeningFcn, ...
    'gui_OutputFcn',  @Interface_Pi_OutputFcn, ...
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


% --- Executes just before Interface_Pi is made visible.
function Interface_Pi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interface_Pi (see VARARGIN)

% Choose default command line output for Interface_Pi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interface_Pi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interface_Pi_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.xlsx';'*.xls'},'File Selector');
handles.filename = filename;
handles.pathname = pathname;
arquivo = [pathname filename];
set(handles.edit3,'String',arquivo);
set(handles.edit3,'ForegroundColor','Black');
handles.arquivo = arquivo;
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
axes(handles.axes1);
cla
axes(handles.axes3);
cla
PMFAV = get(handles.edit1,'String');
PMFAV= str2num(PMFAV);
handles.PMFAV = PMFAV;

if PMFAV >= 50;
    Parametro1 = 2*PMFAV - 100;
    Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMFAV - 0;
end

handles.parametro1 = Parametro1;
handles.parametro2 = Parametro2;
x = 0:0.001:100;
yzmf = zmf(x,[Parametro1 Parametro2]);
ysmf = smf(x,[Parametro1 Parametro2]);

axes(handles.axes1);
plot(x,yzmf,'--black','LineWidth',2);
ylim([-0.1 1.3])
hold all
plot(x,ysmf,'-black','LineWidth',2);
xlabel('Pif','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pif Baixo','Pif Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')

handles.x = x;
handles.yzmf = yzmf;
handles.ysmf = ysmf;
%% Salvar Grafico
% figuraEntrada1 = figure('visible','off');
% x = handles.x;
% yzmf = handles.yzmf;
% plot(x,yzmf,'--black','LineWidth',2);
% ylim([-0.1 1.3])
% hold all
% plot(x,ysmf,'-black','LineWidth',2);
% xlabel('Pif','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
% hleg1 = legend('Pif Baixo','Pif Alto');
% set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
% set(gca,'Fontsize', 12,'FontWeight','b')
% nomeFig_E1 = 'Pif';
% pathname = handles.pathname;
% print (figuraEntrada1, '-dpng', '-r300', [pathname nomeFig_E1])
%%

PMDESF = get(handles.edit2,'String');
PMDESF= str2num(PMDESF);
handles.PMDESF = PMDESF

if PMDESF >= 50;
    Parametro3 = 2*PMDESF - 100;
    Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMDESF - 0;
end
yzmf2 = zmf(x,[Parametro3 Parametro4]);
ysmf2 = smf(x,[Parametro3 Parametro4]);
handles.parametro3 = Parametro3;
handles.parametro4 = Parametro4;

axes(handles.axes3);
plot(x,yzmf2, '--black','LineWidth',2);
ylim([-0.1 1.3])
hold all
plot(x,ysmf2, '-black','LineWidth',2);
xlabel('Pid','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pid Baixo','Pid Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')
handles.yzmf2 = yzmf2;
handles.ysmf2 = ysmf2;
%% Salvar Grafico
% figuraEntrada2 = figure('visible','off')
% plot(x,yzmf2, '--black','LineWidth',2);
% ylim([-0.1 1.3])
% hold all
% plot(x,ysmf2, '-black','LineWidth',2);
% xlabel('Pid','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
% hleg1 = legend('Pid Baixo','Pid Alto');
% set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
% set(gca,'Fontsize', 12,'FontWeight','b')
% nomeFig_E2 = 'Pid';
% print (figuraEntrada2, '-dpng', '-r300', [pathname nomeFig_E2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
guidata(hObject,handles)
%guidata(hObject,handles);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;
[num text completo] = xlsread(arquivo);
[matrizPi matrizPigOrdenada matrizPifOrdenada matrizPidOrdenada] = calculoPi(num)
PMFAV = handles.PMFAV;
PMDESF = handles.PMDESF;
[saidaResumo saidaCompleta] = fuzzyLinBinns(matrizPi,PMFAV,PMDESF)
handles.saidaCompleta = saidaCompleta
matrizPifRes = [matrizPi(:,1), matrizPi(:,3), saidaCompleta(:,2)];
matrizPifRes{1,2} = 'Pif Original';
matrizPifRes{1,3} = 'Pif Padronizado';
matrizPifResOrd = sortrows(matrizPifRes(2:end,:),2);
matrizPifResOrd = [matrizPifRes(1,:);matrizPifResOrd];



matrizPidRes = [matrizPi(:,1), matrizPi(:,4), saidaCompleta(:,3)];
matrizPidRes{1,2} = 'Pid Original';
matrizPidRes{1,3} = 'Pid Padronizado';
matrizPidResOrd = sortrows(matrizPidRes(2:end,:),2);
matrizPidResOrd = [matrizPidRes(1,:);matrizPidResOrd];

[nl nc] = size(saidaCompleta)
nll = nl-1
x = 1:1:nll
x = x';
y = cell2mat(saidaCompleta(2:end,4:7))

axes(handles.axes4);
a = bar(x,y);
xlabel('Genótipos','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg2 = legend('Ampla Adaptabilidade','Pouco Adaptado', 'Adaptabilidade a Ambientes Favoráveis','Adaptabilidade a Ambientes Desfavoráveis');
set(hleg2,'Location','NorthWest','Fontsize', 10,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b');ylim([0 1.4]);xlim([0 17]);
colormap cool
hold all
y2 = 0.5*(ones(1,nll))
plot(x,y2,'--r')

%% Salvar o graficos
% Grafico Saida
figure1 = figure('visible','off')
hold on
a = bar(x,y);
xlabel('Genótipos','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg2 = legend('Ampla Adaptabilidade','Pouco Adaptado', 'Adaptabilidade a Ambientes Favoráveis','Adaptabilidade a Ambientes Desfavoráveis');
set(hleg2,'Location','NorthWest','Fontsize', 10,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b');ylim([0 1.4]);xlim([0 17]);
colormap cool
y2 = 0.5*(ones(1,nll))
plot(x,y2,'--r')
hold off
nomeFig_res = 'comportamentos';
print (figure1, '-dpng', '-r300', [pathname nomeFig_res])

% Grafico Entrada 1
figuraEntrada1 = figure('visible','off');
x = handles.x;
yzmf = handles.yzmf;
ysmf = handles.ysmf;
plot(x,yzmf,'--black','LineWidth',2);
ylim([-0.1 1.3])
hold all
plot(x,ysmf,'-black','LineWidth',2);
xlabel('Pif','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pif Baixo','Pif Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')
nomeFig_E1 = 'Pif';
pathname = handles.pathname;
print (figuraEntrada1, '-dpng', '-r300', [pathname nomeFig_E1])

% Grafico Entrada 2
x = handles.x;
yzmf2 = handles.yzmf2;
ysmf2 = handles.ysmf2;
figuraEntrada2 = figure('visible','off')
plot(x,yzmf2, '--black','LineWidth',2);
ylim([-0.1 1.3])
hold all
plot(x,ysmf2, '-black','LineWidth',2);
xlabel('Pid','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pid Baixo','Pid Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')
nomeFig_E2 = 'Pid';
print (figuraEntrada2, '-dpng', '-r300', [pathname nomeFig_E2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nomeResumo = '_PiFuzzyRes.xlsx'
filename = handles.filename;
[l c] =size(filename);
nomeAq = filename(1,1:(c-5));
pathname = handles.pathname;
enderecoResumo = [pathname nomeAq nomeResumo];
xlswrite(enderecoResumo,saidaResumo)
nomeCompleta = '_PiFuzzyComp.xlsx'
enderecoCompleta = [pathname nomeAq nomeCompleta];
xlswrite(enderecoCompleta,saidaCompleta)
parametro1 = handles.parametro1;
parametro2 = handles.parametro2;
parametro3 = handles.parametro3;
parametro4 = handles.parametro4;

nomeWord = 'resultados.doc';
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
disp('Controlador fuzzy baseado na metodologia de Lin e Binns (1988) modificada por Carneiro (1998)')
disp(' ')
disp('* ENTRADAS: ')
disp('1. Pi em ambientes favoráveis (Pif)')
disp(['     1.1 Pif BAIXO - zmf(',num2str(parametro1), ', ', num2str(parametro2),')'])
disp(['     1.2 Pif ALTO - smf(',num2str(parametro1), ', ', num2str(parametro2),')'])
disp('2. Pi em ambientes desfavoráveis (Pid)')
disp(['     2.1 Pif BAIXO - zmf(',num2str(parametro3), ', ', num2str(parametro4),')'])
disp(['     2.2 Pif ALTO - smf(',num2str(parametro3), ', ', num2str(parametro4),')'])
disp(' ')
disp('* SAÍDA: Comportamentos')
disp('1. Pouco Adaptado')
disp('2. Ampla Adaptabilidade')
disp('3. Adaptabilidade a Ambientes Favoráveis')
disp('4. Adaptabilidade a Ambientes Desfavoráveis')
disp(' ')
disp('* REGRAS: ')
disp('1. Se Pif é BAIXO e Pid é BAIXO Comportamento é de Ampla Adaptabilidade')
disp('2. Se Pif é ALTO e Pid é ALTO Comportamento é POUCO ADAPTADO')
disp('3. Se Pif é BAIXO e Pid é ALTO Comportamento é de ADAPTABILIDADE A AMBIENTES FAVORÁVEIS')
disp('4. Se Pif é ALTO e Pid é BAIXO Comportamento é de ADAPTABILIDADE A AMBIENTES DESFAVORÁVEIS')
disp(' ')
disp('* SISTEMA DE INFERÊNCIA: Sugeno')
disp('* MÉTODO DA INTERSEÇÃO (E): min')
disp(' ')
disp('---------------------REFERÊNCIAS BIBLIOGRÁFICAS--------------------------')
disp('1. Carneiro, P.C.S. (1998). Novas metodologias de análise da adaptabilidade e estabilidade de comportamento. Universidade Federal de Viçosa.')
disp(' ')
disp('2. Carneiro, V.Q. (2015). Redes neurais e lógica fuzzy aplicadas no melhoramento de plantas') 
disp(' ')
disp('3. Lin, C.S.; Binns, M.R. A. (1988) Superiority measure of cultivar performance for cultivar x location data. Canadian Journal of Plant Science, v.68, p.193-198.')
disp(' ')
disp('---------------------------TRILHA DE DADOS-------------------------------');
disp(pathname);
disp('-------------------------------------------------------------------------');
disp('----------------------------ARQUIVOS GERADOS-----------------------------');

disp(['Resultado (Word): ',nomeWord]);
disp(['Resumo (Excel): ',nomeAq, nomeResumo]);
disp(['Completo (Excel): ',nomeAq, nomeCompleta]);
disp(['Grafico Resultado (PNG): ', nomeFig_res,'.png'])
disp(['Grafico Entrada Pif (PNG): ', nomeFig_E1,'.png'])
disp(['Grafico Entrada Pid (PNG): ', nomeFig_E2,'.png'])
disp('-------------------------------------------------------------------------');
disp('-------------------------------------------------------------------------');
disp('------------------------------RESULTADOS---------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ');
disp('Tabela 1. Valores de Pi conforme metodologia de Lin e Binns (1988) modificado por Carneiro (1998).');
disp(' ');
disp('_____________________________________________________________________');
disp(matrizPi)
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp(' ');
disp('Tabela 2. Valores ordenados de Pi conforme metodologia de Lin e Binns (1988)');
disp(' ');
disp('_____________________________________________________________________');
disp(matrizPigOrdenada)
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp('Tabela 3. Valores ordenados de Pi (originais e padronizados) em ambientes favoráveis conforme metodologia de Lin e Binns (1988) modificada por Carneiro (1998).');
disp(' ');
disp('_____________________________________________________________________');
disp(matrizPifResOrd) 
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp(' ');
disp('Tabela 4. Valores ordenados de Pi (originais e padronizados) em ambientes desfavoráveis conforme metodologia de Lin e Binns (1988) modificada por Carneiro (1998).');
disp(' ');
disp('_____________________________________________________________________');
disp(matrizPidResOrd)
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp(' ');
disp('Tabela 5. Resumo dos resultados completos do controlador fuzzy baseado em Lin e Binns (1988) modificado por Carneiro (1998).');
disp('_____________________________________________________________________');
disp(saidaResumo)
disp('_____________________________________________________________________');
diary off
open([pathname, nomeWord])
guidata(hObject,handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
