function varargout = Informacores(varargin)
% INFORMACORES MATLAB code for Informacores.fig
%      INFORMACORES, by itself, creates a new INFORMACORES or raises the existing
%      singleton*.
%
%      H = INFORMACORES returns the handle to a new INFORMACORES or the handle to
%      the existing singleton*.
%
%      INFORMACORES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFORMACORES.M with the given input arguments.
%
%      INFORMACORES('Property','Value',...) creates a new INFORMACORES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Informacores_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Informacores_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Informacores

% Last Modified by GUIDE v2.5 05-Oct-2016 22:44:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Informacores_OpeningFcn, ...
                   'gui_OutputFcn',  @Informacores_OutputFcn, ...
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


% --- Executes just before Informacores is made visible.
function Informacores_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Informacores (see VARARGIN)

% Choose default command line output for Informacores
handles.output = hObject;

% Update handles structure

guidata(hObject, handles);

% UIWAIT makes Informacores wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Informacores_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagem = imread('img.png');
imshow(imagem, 'parent',handle.axes1)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)


% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
