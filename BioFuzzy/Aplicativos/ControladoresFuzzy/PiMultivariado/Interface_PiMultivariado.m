function varargout = Interface_PiMultivariado(varargin)
% INTERFACE_PIMULTIVARIADO MATLAB code for Interface_PiMultivariado.fig
%      INTERFACE_PIMULTIVARIADO, by itself, creates a new INTERFACE_PIMULTIVARIADO or raises the existing
%      singleton*.
%
%      H = INTERFACE_PIMULTIVARIADO returns the handle to a new INTERFACE_PIMULTIVARIADO or the handle to
%      the existing singleton*.
%
%      INTERFACE_PIMULTIVARIADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_PIMULTIVARIADO.M with the given input arguments.
%
%      INTERFACE_PIMULTIVARIADO('Property','Value',...) creates a new INTERFACE_PIMULTIVARIADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interface_PiMultivariado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interface_PiMultivariado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interface_PiMultivariado

% Last Modified by GUIDE v2.5 09-Aug-2017 09:41:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interface_PiMultivariado_OpeningFcn, ...
                   'gui_OutputFcn',  @Interface_PiMultivariado_OutputFcn, ...
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


% --- Executes just before Interface_PiMultivariado is made visible.
function Interface_PiMultivariado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interface_PiMultivariado (see VARARGIN)

% Choose default command line output for Interface_PiMultivariado
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interface_PiMultivariado wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interface_PiMultivariado_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename01 pathname01] = uigetfile({'*.txt'},'File Selector');
handles.filename01 = filename01;
handles.pathname01 = pathname01;
arquivo01 = [pathname01 filename01];
handles.arquivo01 = arquivo01;
set(handles.edit1,'String',arquivo01);
guidata(hObject, handles)
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
[filename02 pathname02] = uigetfile({'*.txt'},'File Selector');
handles.pathname02 = pathname02;
handles.filename02 = filename02;
handles.filename02 = filename02;
arquivo02 = [pathname02 filename02];
handles.arquivo02 = arquivo02;
set(handles.edit2,'String',arquivo02);
guidata(hObject, handles)


% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
pathname01 = handles.pathname01;
% end_var1 = get(handles.edit1,'String');
% [num_v1 text_v1 completo_v1] = xlsread(end_var1);
arquivo01 = handles.arquivo01;
dados = load(arquivo01);
[nlin ncol] = size(dados);
num_v1 = dados;
[Pi_v1 Pig_v1 Pif_v1 Pid_v1] = calculoPi(num_v1)
dados_v1 = cell2mat(Pi_v1(2:end,3:4));

% end_var2 = get(handles.edit2,'String');
% [num_v2 text_v2 completo_v2] = xlsread(end_var2);
pathname02 = handles.pathname02;
arquivo02 = handles.arquivo02;
dados = load(arquivo02);
num_v2 = dados;
[Pi_v2 Pig_v2 Pif_v2 Pid_v2] = calculoPi(num_v2)
dados_v2 = cell2mat(Pi_v2(2:end,3:4));
entrada_Pi = [dados_v1 dados_v2];


% PMPid_var1 = get(handles.edit3,'String');
% PMPif_var1 = get(handles.edit4,'String');
% PMPid_var2 = get(handles.edit7,'String');
% PMPif_var2 = get(handles.edit8,'String');

posSel = get(handles.popupmenu1,'Value');
PMPid_var1 = get(handles.popupmenu1,'String');
PMPid_var1 = PMPid_var1{posSel};
PMPid_var1 = str2num(PMPid_var1);

posSel = get(handles.popupmenu2,'Value');
PMPif_var1 = get(handles.popupmenu2,'String');
PMPif_var1 = PMPif_var1{posSel};
PMPif_var1 = str2num(PMPif_var1);

posSel = get(handles.popupmenu3,'Value');
PMPid_var2 = get(handles.popupmenu3,'String');
PMPid_var2 = PMPid_var2{posSel};
PMPid_var2 = str2num(PMPid_var2);

posSel = get(handles.popupmenu4,'Value');
PMPif_var2 = get(handles.popupmenu4,'String');
PMPif_var2 = PMPif_var2{posSel};
PMPif_var2 = str2num(PMPif_var2);


[resumo completa pertinencias parametros] = fuzzyLinBinnsMultivariado(entrada_Pi, PMPid_var1,PMPif_var1,PMPid_var2,PMPif_var2);


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
print (figura, '-dpng', '-r400', [pathname01,'Control_Mult_Saidas']);

nomeWord = 'resultados.txt';
nomeCompleto = [pathname01, nomeWord];
handles.nomeCompleto = nomeCompleto;
delete([pathname01, nomeWord]);
diary on
diary([pathname01, nomeWord]);
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
disp('Variável 1')
disp('1. Pi em ambientes favoráveis (Pif)')
disp(['     1.1 Pif BAIXO - zmf(',num2str(parametros(1,1)), ', ', num2str(parametros(1,2)),')'])
disp(['     1.2 Pif ALTO - smf(',num2str(parametros(1,1)), ', ', num2str(parametros(1,2)),')'])
disp('2. Pi em ambientes desfavoráveis (Pid)')
disp(['     2.1 Pid BAIXO - zmf(',num2str(parametros(1,3)), ', ', num2str(parametros(1,4)),')'])
disp(['     2.2 Pid ALTO - smf(',num2str(parametros(1,3)), ', ', num2str(parametros(1,4)),')'])
disp(' ')
disp('Variável 2')
disp('1. Pi em ambientes favoráveis (Pif)')
disp(['     1.1 Pif BAIXO - zmf(',num2str(parametros(1,5)), ', ', num2str(parametros(1,6)),')'])
disp(['     1.2 Pif ALTO - smf(',num2str(parametros(1,5)), ', ', num2str(parametros(1,6)),')'])
disp('2. Pi em ambientes desfavoráveis (Pid)')
disp(['     2.1 Pid BAIXO - zmf(',num2str(parametros(1,7)), ', ', num2str(parametros(1,8)),')'])
disp(['     2.2 Pid ALTO - smf(',num2str(parametros(1,7)), ', ', num2str(parametros(1,8)),')'])
disp(' ')

disp('* SAÍDA: Comportamentos')
disp('1. Pouco Adaptado')
disp('2. Ampla Adaptabilidade')
disp('3. Adaptabilidade a Ambientes Favoráveis')
disp('4. Adaptabilidade a Ambientes Desfavoráveis')
disp(' ')
% disp('* REGRAS: ')
% disp('1. Se Pif é BAIXO e Pid é BAIXO Comportamento é de Ampla Adaptabilidade')
% disp('2. Se Pif é ALTO e Pid é ALTO Comportamento é POUCO ADAPTADO')
% disp('3. Se Pif é BAIXO e Pid é ALTO Comportamento é de ADAPTABILIDADE A AMBIENTES FAVORÁVEIS')
% disp('4. Se Pif é ALTO e Pid é BAIXO Comportamento é de ADAPTABILIDADE A AMBIENTES DESFAVORÁVEIS')
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
disp(pathname01);
disp('-------------------------------------------------------------------------');
disp('-------------------------------------------------------------------------');
disp('------------------------------RESULTADOS---------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ');
disp('Tabela 1. Resumo dos resultados completos do controlador fuzzy baseado em Lin e Binns (1988) modificado por Carneiro (1998).');
disp('______________________________________________________________________________________________________________________________');
disp(resumo)
disp('______________________________________________________________________________________________________________________________');
disp('Tabela 1. Resultados completos do controlador fuzzy multivariado baseado em Lin e Binns (1988) modificado por Carneiro (1998).');
disp('______________________________________________________________________________________________________________________________');
disp(completa)
disp('______________________________________________________________________________________________________________________________');
disp('pidVar1: Pi desfavorável para variável 1;pifVar1: Pi favorável para variável 1;pidVar2: Pi desfavorável para variável 2');
disp('pifVar2: Pi favorável para variável 2');
disp('A.G.: Adaptabilidade Geral; P.A.: Pouco Adaptado; A.A.F.: Adaptabilidade a ambientes Favoráveis;')
disp('A.A.D.: Adaptabilidade a ambientes Desfavoráveis');
diary off

 guidata(hObject,handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

posSel = get(handles.popupmenu1,'Value');
PMPid_var1 = get(handles.popupmenu1,'String');
PMPid_var1 = PMPid_var1{posSel};
PMPid_var1 = str2num(PMPid_var1);


% PMPid_var1 = get(handles.edit3,'String');

if PMPid_var1 >= 50;
    Parametro1 = 2*PMPid_var1 - 100;
    Parametro2 = 100;
else
    Parametro1 = 0;
    Parametro2 = 2*PMPid_var1 - 0;
end

x = 0:0.001:100;
yzmf1 = zmf(x,[Parametro1 Parametro2]);
ysmf1 = smf(x,[Parametro1 Parametro2]);
figuraEntrada1 = figure('Name', 'Entradas do Controlador Multivariado','NumberTitle', 'off');
subplot(2,2,1)
plot(x,yzmf1,'--black','LineWidth',2);
title('Variável 1','fontsize',12,'fontweight','b');
ylim([-0.1 1.5])
hold all
plot(x,ysmf1,'-black','LineWidth',2);
xlabel('Pid','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pid Baixo','Pid Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')

subplot(2,2,2)

posSel = get(handles.popupmenu2,'Value');
PMPif_var1 = get(handles.popupmenu2,'String');
PMPif_var1 = PMPif_var1{posSel};
PMPif_var1 = str2num(PMPif_var1);


% PMPif_var1 = get(handles.edit4,'String');
if PMPif_var1 >= 50;
    Parametro3 = 2*PMPif_var1 - 100;
    Parametro4 = 100;
else
    Parametro3 = 0;
    Parametro4 = 2*PMPif_var1 - 0;
end
x = 0:0.001:100;
yzmf2 = zmf(x,[Parametro3 Parametro4]);
ysmf2 = smf(x,[Parametro3 Parametro4]);
plot(x,yzmf2,'--black','LineWidth',2);
title('Variável 1','fontsize',12,'fontweight','b');
ylim([-0.1 1.5])
hold all
plot(x,ysmf2,'-black','LineWidth',2);
xlabel('Pif','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pif Baixo','Pif Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')

subplot(2,2,3)
posSel = get(handles.popupmenu3,'Value');
PMPid_var2 = get(handles.popupmenu3,'String');
PMPid_var2 = PMPid_var2{posSel};
PMPid_var2 = str2num(PMPid_var2);
% PMPid_var2 = get(handles.edit7,'String');
if PMPid_var2 >= 50;
    Parametro5 = 2*PMPid_var2 - 100;
    Parametro6 = 100;
else
    Parametro5 = 0;
    Parametro6 = 2*PMPid_var2 - 0;
end
x = 0:0.001:100;
yzmf3 = zmf(x,[Parametro5 Parametro6]);
ysmf3 = smf(x,[Parametro5 Parametro6]);
plot(x,yzmf3,'--black','LineWidth',2);
ylim([-0.1 1.5])
hold all
plot(x,ysmf3,'-black','LineWidth',2);
title('Variável 2','fontsize',12,'fontweight','b');
xlabel('Pid','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pid Baixo','Pid Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')

subplot(2,2,4)
posSel = get(handles.popupmenu4,'Value');
PMPif_var2 = get(handles.popupmenu4,'String');
PMPif_var2 = PMPif_var2{posSel};
PMPif_var2 = str2num(PMPif_var2);
% PMPif_var2 = get(handles.edit8,'String');
if PMPif_var2 >= 50;
    Parametro7 = 2*PMPif_var2 - 100;
    Parametro8 = 100;
else
    Parametro7 = 0;
    Parametro8 = 2*PMPif_var2 - 0;
end
x = 0:0.001:100;
yzmf4 = zmf(x,[Parametro7 Parametro8]);
ysmf4 = smf(x,[Parametro7 Parametro8]);
plot(x,yzmf4,'--black','LineWidth',2);
title('Variável 2','fontsize',12,'fontweight','b');
ylim([-0.1 1.5])
hold all
plot(x,ysmf4,'-black','LineWidth',2);
xlabel('Pif','fontsize',12,'fontweight','b');ylabel('Pertinências','fontsize',12,'fontweight','b');
hleg1 = legend('Pif Baixo','Pif Alto');
set(hleg1,'Location','NorthWest','Fontsize', 11,'FontAngle','italic')
set(gca,'Fontsize', 12,'FontWeight','b')
% guidata(hObject,handles);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
pathname01 = 'C:\BioFuzzy\Exemplos\piMultivariado\';
pathname02 = pathname01;
handles.pathname01 = pathname01;
handles.pathname02 = pathname02;

filename01 = 'dados01.txt';
handles.filename01 = filename01;
filename02 = 'dados02.txt';
handles.filename02 = filename02;

arquivo01 = 'C:\BioFuzzy\Exemplos\piMultivariado\dados01.txt';
handles.arquivo01 = arquivo01;
set(handles.edit1,'String',arquivo01);
set(handles.edit1,'ForegroundColor','Black');

arquivo02 = 'C:\BioFuzzy\Exemplos\piMultivariado\dados02.txt';
handles.arquivo02 = arquivo02;
set(handles.edit2,'String',arquivo02);
set(handles.edit2,'ForegroundColor','Black');





guidata(hObject,handles);
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
arquivo01 = handles.arquivo01;
winopen(arquivo01);
guidata(hObject,handles);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
arquivo01 = handles.arquivo01;
winopen(arquivo01);
guidata(hObject,handles);
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
nomeCompleto = handles.nomeCompleto;
winopen(nomeCompleto);
guidata(hObject, handles);
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
