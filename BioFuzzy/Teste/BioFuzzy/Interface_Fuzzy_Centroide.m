function varargout = Interface_Fuzzy(varargin)
% INTERFACE_FUZZY MATLAB code for Interface_Fuzzy.fig
%      INTERFACE_FUZZY, by itself, creates a new INTERFACE_FUZZY or raises the existing
%      singleton*.
%
%      H = INTERFACE_FUZZY returns the handle to a new INTERFACE_FUZZY or the handle to
%      the existing singleton*.
%
%      INTERFACE_FUZZY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_FUZZY.M with the given input arguments.
%
%      INTERFACE_FUZZY('Property','Value',...) creates a new INTERFACE_FUZZY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interface_Fuzzy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interface_Fuzzy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interface_Fuzzy

% Last Modified by GUIDE v2.5 05-Oct-2016 14:28:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interface_Fuzzy_OpeningFcn, ...
                   'gui_OutputFcn',  @Interface_Fuzzy_OutputFcn, ...
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


% --- Executes just before Interface_Fuzzy is made visible.
function Interface_Fuzzy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interface_Fuzzy (see VARARGIN)

% Choose default command line output for Interface_Fuzzy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Interface_Fuzzy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interface_Fuzzy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.text3,'String','Aguarde (Processando)','background', 'r');
[filename pathname] = uigetfile({'*.xlsx';'*.xls'},'File Selector');
arquivo = [pathname filename];
[num text completo] = xlsread(arquivo);
[resumo matrizOriginal matrizPadronizada] = fuzzyMediasCentroide(num,1)
set(handles.uitable3,'data',completo);
set(handles.uitable1,'data',resumo);
set(handles.uitable2,'data',matrizPadronizada);
nomeResumo = '_resumo.xlsx'
[l c] =size(filename);
nomeAq = filename(1,1:(c-5));
enderecoResumo = [pathname nomeAq nomeResumo];
xlswrite(enderecoResumo,resumo)
nomeCompleta = '_completa.xlsx'
enderecoCompleta = [pathname nomeAq nomeCompleta];
xlswrite(enderecoCompleta,matrizPadronizada)
set(handles.text3,'String','Processado','background', 'g');

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
