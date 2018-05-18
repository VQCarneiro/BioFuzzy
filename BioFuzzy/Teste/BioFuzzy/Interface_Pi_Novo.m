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

% Last Modified by GUIDE v2.5 05-Dec-2016 16:08:21

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
set(handles.text1,'String','Aguarde (Processando)','background', 'r');
arquivo = handles.arquivo;
[num text completo] = xlsread(arquivo);
[matrizPi matrizPigOrdenada matrizPifOrdenada matrizPidOrdenada] = calculoPi(num)
set(handles.uitable1,'data',completo);
set(handles.uitable2,'data',matrizPigOrdenada);
set(handles.uitable3,'data',matrizPifOrdenada);
set(handles.uitable4,'data',matrizPidOrdenada);

PMFAV = get(handles.edit1,'String');
PMFAV= str2num(PMFAV);
PMDESF = get(handles.edit1,'String');
PMDESF= str2num(PMDESF);
[saidaResumo saidaCompleta] = fuzzyLinBinns(matrizPi,PMFAV,PMDESF)
set(handles.uitable5,'data',saidaCompleta);
set(handles.uitable6,'data',saidaResumo);

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
set(handles.text1,'String','Processado','background', 'g');
%guidata(hObject,handles);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
