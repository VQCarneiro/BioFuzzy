function varargout = BioFuzzy(varargin)
% BIOFUZZY MATLAB code for BioFuzzy.fig
%      BIOFUZZY, by itself, creates a new BIOFUZZY or raises the existing
%      singleton*.
%
%      H = BIOFUZZY returns the handle to a new BIOFUZZY or the handle to
%      the existing singleton*.
%
%      BIOFUZZY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BIOFUZZY.M with the given input arguments.
%
%      BIOFUZZY('Property','Value',...) creates a new BIOFUZZY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BioFuzzy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BioFuzzy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BioFuzzy

% Last Modified by GUIDE v2.5 07-Oct-2016 16:29:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BioFuzzy_OpeningFcn, ...
                   'gui_OutputFcn',  @BioFuzzy_OutputFcn, ...
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


% --- Executes just before BioFuzzy is made visible.
function BioFuzzy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BioFuzzy (see VARARGIN)

% Choose default command line output for BioFuzzy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BioFuzzy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BioFuzzy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Selecao_Callback(hObject, eventdata, handles)
% hObject    handle to Selecao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GxA_Callback(hObject, eventdata, handles)
% hObject    handle to GxA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PiFuzzyM_Callback(hObject, eventdata, handles)
Interface_PiMultivariado
% hObject    handle to PiFuzzyM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ANOVAC_Callback(hObject, eventdata, handles)
teste
% hObject    handle to ANOVAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function AdaptaFuzzy_Callback(hObject, eventdata, handles)
% hObject    handle to AdaptaFuzzy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MGA_Callback(hObject, eventdata, handles)
Interface_Fuzzy
% hObject    handle to MGA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function MGE_Callback(hObject, eventdata, handles)
Interface_Fuzzy_Centroide
% hObject    handle to MGE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PiFuzzy_Callback(hObject, eventdata, handles)
Interface_Pi
% hObject    handle to PiFuzzy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
