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

% Last Modified by GUIDE v2.5 07-Dec-2016 11:45:39

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
[filenameV1 pathnameV1] = uigetfile({'*.xlsx';'*.xls'},'File Selector');
handles.filenameV1 = filenameV1;
handles.pathnameV1 = pathnameV1;
arquivoV1 = [pathnameV1 filenameV1];
handles.arquivoV1 = arquivoV1;
set(handles.edit1,'String',arquivoV1);
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
[filenameV2 pathnameV2] = uigetfile({'*.xlsx';'*.xls'},'File Selector');
handles.filenameV2 = filenameV2;
handles.filenameV2 = filenameV2;
arquivoV2 = [pathnameV2 filenameV2];
handles.arquivoV2 = arquivoV2;
set(handles.edit2,'String',arquivoV2);
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
end_var1 = get(handles.edit1,'String');
[num_v1 text_v1 completo_v1] = xlsread(end_var1);
[Pi_v1 Pig_v1 Pif_v1 Pid_v1] = calculoPi(num_v1)
dados_v1 = cell2mat(Pi_v1(2:end,3:4));

end_var2 = get(handles.edit2,'String');
[num_v2 text_v2 completo_v2] = xlsread(end_var2);
[Pi_v2 Pig_v2 Pif_v2 Pid_v2] = calculoPi(num_v2)
dados_v2 = cell2mat(Pi_v2(2:end,3:4));
entrada_Pi = [dados_v1 dados_v2];


% PMPid_var1 = get(handles.edit3,'String');
% PMPif_var1 = get(handles.edit4,'String');
% PMPid_var2 = get(handles.edit7,'String');
% PMPif_var2 = get(handles.edit8,'String');


[resumo completa] = fuzzyLinBinnsMultivariado(entrada_Pi, PMPid_var1,PMPif_var1,PMPid_var2,PMPif_var2);
filename = handles.filenameV1;
pathname = handles.pathnameV1;
 nomeResumo = '_MultRes.xlsx';
 [l c] =size(filename);
 nomeAq = filename(1,1:(c-5));
 enderecoResumo = [pathname nomeAq nomeResumo];
 xlswrite(enderecoResumo,resumo);
 nomeCompleta = '_MultComp.xlsx';
 enderecoCompleta = [pathname nomeAq nomeCompleta];
 xlswrite(enderecoCompleta,completa);
 guidata(hObject,handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

PMPid_var1 = get(handles.edit3,'String');
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
figuraEntrada1 = figure('Name', 'Entradas do Controlador');
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
PMPif_var1 = get(handles.edit4,'String');
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
PMPid_var2 = get(handles.edit7,'String');
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
PMPif_var2 = get(handles.edit8,'String');
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
