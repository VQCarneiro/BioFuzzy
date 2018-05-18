function varargout = prj0001_FCM(varargin)
% PRJ0001_FCM MATLAB code for prj0001_FCM.fig
%      PRJ0001_FCM, by itself, creates a new PRJ0001_FCM or raises the existing
%      singleton*.
%
%      H = PRJ0001_FCM returns the handle to a new PRJ0001_FCM or the handle to
%      the existing singleton*.
%
%      PRJ0001_FCM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRJ0001_FCM.M with the given input arguments.
%
%      PRJ0001_FCM('Property','Value',...) creates a new PRJ0001_FCM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prj0001_FCM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prj0001_FCM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prj0001_FCM

% Last Modified by GUIDE v2.5 24-Jun-2017 10:38:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prj0001_FCM_OpeningFcn, ...
                   'gui_OutputFcn',  @prj0001_FCM_OutputFcn, ...
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


% --- Executes just before prj0001_FCM is made visible.
function prj0001_FCM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prj0001_FCM (see VARARGIN)

% Choose default command line output for prj0001_FCM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prj0001_FCM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prj0001_FCM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
filename = handles.filename;
b = strtok(filename,'.');
pathname = handles.pathname;
Originais = handles.Originais;
texto = handles.rotulos;
inform = get(handles.popupmenu2,'Value');
inf = get(handles.popupmenu2,'String');
tipo = inf{inform,1};

eixoX_Val = get(handles.popupmenu7,'Value');
eixoX_Str = get(handles.popupmenu7,'String');
eixoX = eixoX_Str{eixoX_Val,1};

eixoY_Val = get(handles.popupmenu5,'Value');
eixoY_Str = get(handles.popupmenu5,'String');
eixoY = eixoX_Str{eixoY_Val,1};

eixoZ_Val = get(handles.popupmenu6,'Value');
eixoZ_Str = get(handles.popupmenu6,'String');
eixoZ = eixoZ_Str{eixoZ_Val,1};

tipo1 = 'Dados e Centroides';
tipo2 = 'Dados';
tipo3 = 'Centroides';
tipo4 = 'Eficiência';
classes = handles.classes;
matriz = handles.matriz;
centroides = handles.centroides;
[nlCen ncCen] = size(centroides);
cen = centroides';
for k = 1:1:ncCen
    
    CenNorm(k,:) = DNormatiza(cen(k,:),Originais(:,k),0,1);
    
    
end
CenNorm = CenNorm';

nlin = handles.nlin;
cores = {'r.', 'g.', 'b.', 'c.', 'm.', 'y.','ro', 'go', 'bo', 'co', 'mo', 'yo', 'r*', 'g*', 'b*', 'c*', 'm*', ...
    'r+', 'g+', 'b+', 'c+', 'm+', 'y+','y*',  ...
    'rx', 'gx', 'bx', 'cx', 'mx', 'yx','rs', 'gs', 'bs', 'cs', 'ms', 'ys', ...
    'rd', 'gd', 'bd', 'cd', 'md', 'yd', 'r^', 'g^', 'b^', 'c^', 'm^', 'y^', ...
    'rv', 'gv', 'bv', 'cv', 'mv', 'yv', 'r>', 'g>', 'b>', 'c>', 'm>', 'y>',	...
    'r<', 'g<', 'b<', 'c<', 'm<', 'y<','rp', 'gp', 'bp', 'cp', 'mp', 'yp', ...
    'rh', 'gh', 'bh', 'ch', 'mh', 'yh'};


switch tipo
    case tipo1
        if eixoZ_Val == 1
            
            fig_graficos = figure('Name', 'Projeção dos Dados');
            for i = 1:nlin
                for j =1:(max(classes))
                    if matriz(i,end) == j
                        subplot(1,2,1);
                        plot(matriz(i,1+eixoX_Val),matriz(i,1+eixoY_Val),cores{j},'MarkerSize',9);
                        xlim=[min(matriz(:,1+eixoX_Val)) max(matriz(:,1+eixoX_Val))];
                        ylim=[min(matriz(:,1+eixoY_Val)) max(matriz(:,1+eixoY_Val))];
                        hold all;
                        plot(centroides(:,eixoX_Val),centroides(:,eixoY_Val),'black*','MarkerSize',12);
                        title(['Dados Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        %             xlim('manual');ylim('manual');
                        
                        hold all;
                        
                        subplot(1,2,2);
                        plot(Originais(i,eixoX_Val),Originais(i,eixoY_Val),cores{j},'MarkerSize',9);
                        hold all;
                        plot(CenNorm(:,eixoX_Val),CenNorm(:,eixoY_Val),'black*','MarkerSize',12);
                        title(['Dados Não Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        xlim=[min(Originais(:,eixoX_Val)) max(Originais(:,eixoX_Val))];
                        ylim=[min(Originais(:,eixoY_Val)) max(Originais(:,eixoY_Val))];
                        %                         xlim=('manual');ylim=('manual');
                        hold all;
                        
                        
                    else
                    end
                end
            end
            
            nomeGrafico = ['C_Means_Dados_Centroides_',eixoX, 'x',eixoY ];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        else
            fig_graficos = figure('Name', 'Projeção dos Dados');
            for i = 1:nlin
                for j =1:(max(classes))
                    if matriz(i,end) == j
                        subplot(1,2,1);
                        plot3(matriz(i,1+eixoX_Val),matriz(i,1+eixoY_Val),matriz(i,eixoZ_Val),cores{j},'MarkerSize',9);
                        hold all;
                        plot3(centroides(:,eixoX_Val),centroides(:,eixoY_Val),centroides(:,eixoZ_Val-1),'black*','MarkerSize',12);
                        title(['Dados Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        grid on;
                        axis square;
                        rotate3d on;
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        subplot(1,2,2);
                        plot3(Originais(i,eixoX_Val),Originais(i,eixoY_Val),Originais(i,eixoZ_Val-1),cores{j},'MarkerSize',9);
                        hold all;
                        plot3(CenNorm(:,eixoX_Val),CenNorm(:,eixoY_Val),CenNorm(:,eixoZ_Val-1),'black*','MarkerSize',12);
                        title(['Dados Não Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        grid on;
                        axis square;
                        rotate3d on;
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        
                        
                    else
                    end
                end
            end
            nomeGrafico = ['CMeans_Dados_Centroides_',eixoX, 'x',eixoY, 'x',eixoZ];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        end
    case tipo2
        
        if eixoZ_Val == 1
            
            fig_graficos = figure('Name', 'Projeção dos Dados');
            
            for i = 1:nlin
                for j =1:(max(classes))
                    if matriz(i,end) == j
                        subplot(1,2,1);
                        plot(matriz(i,1+eixoX_Val),matriz(i,1+eixoY_Val),cores{j},'MarkerSize',9);
                        title(['Dados Padronizados'],'Fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        
                        subplot(1,2,2);
                        plot(Originais(i,eixoX_Val),Originais(i,eixoY_Val),cores{j},'MarkerSize',9);
                        title(['Dados Não Padronizados'],'Fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        
                        
                        
                    else
                    end
                end
            end
            nomeGrafico = ['CMeans_Dados_',eixoX, 'x',eixoY ];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        else
            fig_graficos = figure('Name', 'Projeção dos Dados');
            for i = 1:nlin
                for j =1:(max(classes))
                    if matriz(i,end) == j
                        subplot(1,2,1);
                        plot3(matriz(i,1+eixoX_Val),matriz(i,1+eixoY_Val),matriz(i,eixoZ_Val),cores{j},'MarkerSize',9);
                        title(['Dados padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        grid on;
                        axis square;
                        rotate3d on;
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        
                        subplot(1,2,2);
                        plot3(Originais(i,eixoX_Val),Originais(i,eixoY_Val),Originais(i,eixoZ_Val-1),cores{j},'MarkerSize',9);
                        title(['Dados Não Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
                        ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
                        grid on;
                        axis square;
                        rotate3d on;
                        %                         xlim('manual');ylim('manual');
                        hold all;
                        
                        
                    else
                    end
                end
            end
            nomeGrafico = ['C_Means_Dados_', eixoX, 'x',eixoY,'x',eixoZ];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        end
    case tipo3
        if eixoZ_Val == 1
            
            fig_graficos =  figure('Name', 'Projeção dos Dados');
            subplot(1,2,1);
            plot(centroides(:,eixoX_Val),centroides(:,eixoY_Val),'black*','MarkerSize',12);
            title(['Pesos Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
            ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
            %             xlim('manual');ylim('manual');
            hold all;
            
            
            subplot(1,2,2);
            plot(CenNorm(:,eixoX_Val),CenNorm(:,eixoY_Val),'black*','MarkerSize',12);
            title(['Pesos Não Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
            ylabel(eixoY,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
            %             xlim('manual');ylim('manual');
            hold all;
            
            nomeGrafico = ['CMeans_Centroides_',eixoX, 'x',eixoY];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
            
        else
            fig_graficos = figure('Name', 'Projeção dos Dados');
            subplot(1,2,1);
            plot3(centroides(:,eixoX_Val),centroides(:,eixoY_Val),centroides(:,eixoZ_Val-1),'black*','MarkerSize',12)
            title(['Pesos Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
            ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
            grid on;
            axis square;
            rotate3d on;
            %             xlim('manual');ylim('manual');zlim('manual');
            
            subplot(1,2,2);
            plot3(CenNorm(:,eixoX_Val),CenNorm(:,eixoY_Val),CenNorm(:,eixoZ_Val-1),'black*','MarkerSize',12);
            title(['Pesos não Padronizados'],'fontsize',12,'fontweight','b'); xlabel(eixoX,'fontsize',12,'fontweight','b');
            ylabel(eixoY,'fontsize',12,'fontweight','b');zlabel(eixoZ,'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
            grid on;
            axis square;
            rotate3d on;
            %             xlim('manual');ylim('manual');zlim('manual');
            
            nomeGrafico = ['CMeans_Centroides_',eixoX, 'x',eixoY, 'x',eixoZ];
            print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        end
        
    case tipo4
        
        fig_graficos =  figure('Name', 'Eficiência');
        variacao = handles.variacao;
        [nlin ncol] = size(variacao);
        sq = 1:1:nlin;
        plot(sq,variacao,'blue-','MarkerSize',12);
        title(['Eficiência'],'fontsize',12,'fontweight','b'); xlabel(['Iterações'],'fontsize',12,'fontweight','b');
        ylabel(['Variação Mínima'],'fontsize',12,'fontweight','b');set(gca,'Fontsize', 12,'FontWeight','b');
        
        nomeGrafico = ['Eficiencia_FuzzCMeans'];
        
        print (fig_graficos, '-dpng', '-r300', [pathname b nomeGrafico])
        
        
    otherwise
        errordlg('Escolha uma das opções disponíveis');
end
% hObject    handle to pushbutton7 (see GCBO)
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


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;

num = load(arquivo);
[linhas colunas] = size(num);

exp = get(handles.edit11,'String');
exp = str2num(exp);

opcoes = [exp,1000,0.001,0];
[nlNum ncNum] = size(num);
 
selecao = get(handles.popupmenu1,'String');
indiceSel = get(handles.popupmenu1,'Value');
selecionado = selecao{indiceSel};

if(strcmp(selecionado,'Todos'))
    ate = nlNum-1;
else
    if (str2num(selecionado)>=nlNum)
    helpdlg(['Impossivel utilizar um número máximo de grupos superior a ' num2str(nlNum) '.Selecione um número máximo de grupos inferior a ' num2str(nlNum)]);
else
end

    ate = str2num(selecionado);
end
   


for g = 2:ate

[centroides, pertinencias, variacao] = fcm(num,g,opcoes);
handles.pertinencias = pertinencias;
handles.variacao = variacao;
[nlin ncol] = size(pertinencias);
for k = 1:ncol
    classes(k) = find(pertinencias(:,k)==max(pertinencias(:,k)));
end
[nlin ncol] = size(num);
ordem = 1:1:nlin;
matriz = [ordem' num classes'];
matrizPert = [ordem' classes' pertinencias'];

handles.classes = classes;
handles.matriz = matriz;
handles.matrizPert = matrizPert;
handles.centroides = centroides;
handles.nlin = nlin;

classesGrupos(:,g-1) = classes';

valorMaxPert = (max(pertinencias))';

valoresPertMaximas(:,g-1) = valorMaxPert;

valoresMedias = mean(valoresPertMaximas);
valoresMin = min(valoresPertMaximas);
valoresMax = max(valoresPertMaximas);
valoresVar = var(valoresPertMaximas);

end
format shortG

valoresMedias;
valoresMin ;
valoresMax ;
valoresVar ;
classesGrupos;
valoresPertMaximas;
[lin col] = size(valoresPertMaximas);
val = zeros(6,col);
for h = 1:col
    for q = 1:lin
        if (valoresPertMaximas(q,h)>0.5);
            val(1,h) = val(1,h)+1;
        else
        end
        if (valoresPertMaximas(q,h)>0.6);
            val(2,h) = val(2,h)+1;
        else
        end
        if (valoresPertMaximas(q,h)>0.7);
            val(3,h) = val(3,h)+1;
        else
        end
        if (valoresPertMaximas(q,h)>0.8);
            val(4,h) = val(4,h)+1;
        else
        end
        if (valoresPertMaximas(q,h)>0.9);
            val(5,h) = val(5,h)+1;
        else
        end
        if (valoresPertMaximas(q,h)>0.95);
            val(6,h) = val(6,h)+1;
        else
        end
    end
end
percentualVal = val*100/nlNum;

[nlVal ncVal] = size(val);
seq = 2:1:ncVal+1;
valF = [seq' val'];
tabValores = num2cell(valF);
cabeVal = {'Número de Grupos', '>50%','>60%', '>70%', '>80%', '>90%', '>95%'};
saida_tabValores = [cabeVal;tabValores];
nome = [pathname,'Teste_NumeroGrupos.xlsx'];
delete(nome);
nomeTab1 = {'Tabela 1. Quantidade de valores de pertinencias máximas por número de grupos'};
xlswrite(nome,nomeTab1,1,'A1');
xlswrite(nome,saida_tabValores,1,'A3');


format bank

valPF = [seq' percentualVal'];
tabValores = num2cell(valPF);
cabeVal = {'Número de Grupos', '>50%','>60%', '>70%', '>80%', '>90%', '>95%'};
saida_tabValores = [cabeVal;tabValores];
nome = [pathname,'Teste_NumeroGrupos.xlsx'];

nomeTab1 = {'Tabela 2. Percentual de valores de pertinencias máximas por número de grupos'};
xlswrite(nome,nomeTab1,2,'A1');
xlswrite(nome,saida_tabValores,2,'A3');


helpdlg('A fase de seleção de número de grupos foi executada com sucesso!');
winopen(nome);
guidata(hObject, handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
filename = handles.filename;
b = strtok(filename,'.');
pathname = handles.pathname;
nomeClass = [b,'_FCM.xlsx'];
nomeWord = [b,'_FCM.doc'];
delete([pathname, nomeWord]);
format bank;
Originais = handles.Originais;
matriz = handles.matriz;
nGrupos = handles.nGrupos;
nGrupos = num2str(nGrupos);
varMin = handles.varMin;
varMin = num2str(varMin);
iteracoes=handles.iteracoes;
iteracoes = num2str(iteracoes);
variacao = handles.variacao;
[nlV ncV] = size(variacao);
iterReal = num2str(nlV);
exp = handles.exp;
exp = num2str(exp);
num = handles.num;
texto = handles.rotulos;
classes = handles.classes;
pertinencias = handles.pertinencias;
maximoPert = (100*max(pertinencias));
tabela = [matriz(:,1), classes',maximoPert'];
centroides = handles.centroides;

if (exist([pathname, nomeWord]))~=0
    delete([pathname, nomeWord]);
else
end

diary on;
diary([pathname, nomeWord]);
disp('-------------------------------------------------------------------------');
disp('-----------------------------BIOFUZZY------------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ')
disp('Desenvolvedor: Vinícius Quintão Carneiro (vqcarneiro@gmail.com)');
disp(' ')
disp('-----------------------------INFORMAÇÕES---------------------------------');
disp(' ')
disp('- - - - - - - - - - - - - - FUZZY C-MEANS - - - - - - - - - - - - - - -  ');
disp(' ')
disp('---------------------REFERÊNCIAS BIBLIOGRÁFICAS--------------------------');
disp(' ')
disp('1. BEZDEC, J.C., Pattern Recognition with Fuzzy Objective Function Algorithms, Plenum Press, New York, 1981.');
disp(' ')
disp('2. CHIU, S., “Fuzzy Model Identification Based on Cluster Estimation,” Journal of Intelligent & Fuzzy Systems, Vol. 2, No. 3, Sept. 1994.');
disp(' ')
disp('------------------------ FASE 1: TREINAMENTO ----------------------------');
disp('----------------------------CONFIGURAÇÕES--------------------------------');
disp(' ');
disp(['Número de grupos a priori: ', nGrupos]);
disp(['Fator Expoente: ', exp]);
disp(['Variação Mínima: ', varMin]);
disp(['Número de iterações totais: ', iteracoes]);
disp(['Número de iterações realizadas: ', iterReal]);
disp(' ');
disp('---------------------------------DADOS-----------------------------------');
disp(' ');
[nl nc] = size(num);
disp(['Número Total de Observações: ',num2str(nl)]);
disp(' ')
disp('* ENTRADAS: ');
[nlO ncO] = size(Originais);
for l=1:ncO
    lstr = num2str(l);
    disp(['Entrada: ', lstr, ': ', texto{l}]);
    disp(['Valor Máximo: ', num2str(max(Originais(:,l)))]);
    disp(['Valor Mínimo: ', num2str(min(Originais(:,l)))]);
    disp(['Média: ', num2str(mean(Originais(:,l)))]);
    disp(['Variância: ', num2str(var(Originais(:,l)))]);
    disp(' ');
end
disp(' ');
disp('---------------------------TRILHA DE DADOS-------------------------------');
disp(' ');
disp(pathname);
disp(' ');
disp('----------------------------ARQUIVOS GERADOS-----------------------------');
disp(' ');
disp(['Resultado (Word): ',nomeWord]);
disp(['Classificação (Excel): ',nomeClass]);
disp(' ');
disp('-------------------------------------------------------------------------');
disp('------------------------------RESULTADOS---------------------------------');
disp('-------------------------------------------------------------------------');
disp(' ');
disp('Tabela 1. Classificação das observações avaliadas');
disp(' ');
disp('_____________________________________________________________________');
disp('        Observações    Classes    Pertinências')
disp('_____________________________________________________________________');
disp(tabela);
disp('_____________________________________________________________________');
disp(' ');
disp(' ');
disp('Tabela 2. Observações por Grupo');
disp('_____________________________________________________________________');
disp(' ');
nclasses = max(classes);
for m = 1:1:nclasses
    obsGrupo = tabela(find(tabela(:,2)==m));
    obsGrupo = obsGrupo';
    mstr = num2str(m);
    disp(['Grupo: ',mstr]);
    disp(num2str(obsGrupo));
    disp(' ');
    disp('_____________________________________________________________________');
    disp(' ');
end
disp(' ');
disp('Tabela 3. Eficiência');
disp('_____________________________________________________________________');
disp(' ');
disp('        Iterações     Variação')
disp('_____________________________________________________________________');
sqq = 1:1:nlV;
tabVar = [sqq',variacao];
disp(tabVar)
disp('_____________________________________________________________________');
disp(' ');
diary off;
open([pathname, nomeWord]);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
pathname = handles.pathname;
centroides = handles.centroides;
CenNorm = handles.CenNorm;
texto = handles.rotulos;
matriz = handles.matriz;
Originais = handles.Originais;
[nlin ncol] = size(Originais);
gen = 1:1:nlin;
gen = gen';
classes = handles.classes;
tab = [gen Originais classes'];
tab = num2cell(tab);
cabe = ['Observação', texto(:,:), 'Classes'];
saida_or = [cabe;tab];
nome = [pathname,'classificação.xlsx'];
delete(nome);
nomeTab1 = {'Tabela 1. Classificação dos dados originais'};
xlswrite(nome,nomeTab1,1,'A1');
xlswrite(nome,saida_or,1,'A3');

nomeTab3 = {'Tabela 2. Centróides originais'};
xlswrite(nome,nomeTab3,2,'A1');
[nlinCenN  ncolCenN] = size(CenNorm);
cenN = 1:1:nlinCenN;
cenN = cenN';
tabCenN = [cenN, CenNorm];
tabCenN = num2cell(tabCenN);
cabeCenN = ['Neurônios', texto];
tabCentroidesN = [cabeCenN;tabCenN];
xlswrite(nome,tabCentroidesN,2,'A3');


cellMatriz = num2cell(matriz);
cellMatriz = [cabe;cellMatriz];
nomeTab2 = {'Tabela 3. Classificaçao dos dados padronizados'};
xlswrite(nome,nomeTab2,3,'A1');
xlswrite(nome,cellMatriz,3,'A3');

nomeTab4 = {'Tabela 4. Centróides padronizados'};
xlswrite(nome,nomeTab4,4,'A1');
[nlinCen  ncolCen] = size(centroides);
cen = 1:1:nlinCen;
cen = cen';
tabCen = [cen, centroides];
tabCen = num2cell(tabCen);
cabeCen = ['Neurônios', texto];
tabCentroides = [cabeCen;tabCen];
xlswrite(nome,tabCentroides,4,'A3');


matrizPert = handles.matrizPert;
matrizPert(:,3:4) = 100*matrizPert(:,3:4);
matrizPert = num2cell(matrizPert)
nGrupos = handles.nGrupos;
for l = 1:1:nGrupos
    grupo = num2str(l);
    cabPert{l} = ['Grupo ',grupo];
end
cab = ['Observações','Classes', cabPert]

matrizPert = [cab;matrizPert];
nomeTab5 = {'Tabela 5. Classificação e Pertinências das observações avaliadas'};
xlswrite(nome,nomeTab5,5,'A1');
xlswrite(nome,matrizPert,5,'A3');
winopen(nome);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
arquivo = handles.arquivo;
pathname = handles.pathname;

num = load(arquivo);
[linhas colunas] = size(num);

for j = 1:colunas
rotulos{j} = ['var',num2str(j)];
end
handles.rotulos = rotulos;
set(handles.popupmenu5,'String',rotulos);
set(handles.popupmenu7,'String',rotulos);
if colunas>=3
    rotulosEixoZ = ['Nenhum',rotulos];
    set(handles.popupmenu6,'String',rotulosEixoZ);
else
    rotulosEixoZ = {'Nenhum'};
    set(handles.popupmenu6,'String',rotulosEixoZ);
end
Originais = num;
handles.Originais = Originais;

num = num';

for k = 1:1:colunas
    
    dadosNorm1(k,:) = Normatiza(num(k,:),num(k,:),0,1);
        
end
num = dadosNorm1';

handles.num = num;

nGrupos = get(handles.edit3,'String');
nGrupos = str2num(nGrupos);
handles.nGrupos = nGrupos;

exp = get(handles.edit4,'String');
exp = str2num(exp);
handles.exp = exp;

varMin = get(handles.edit5,'String');
varMin = str2num(varMin);
handles.varMin = varMin;

iteracoes = get(handles.edit6,'String');
iteracoes = str2num(iteracoes);
handles.iteracoes = iteracoes;

opcoes = [exp,iteracoes,varMin,0];
[centroides, pertinencias, variacao] = fcm(num,nGrupos,opcoes);
handles.pertinencias = pertinencias;
handles.variacao = variacao;
[nlin ncol] = size(pertinencias);
pertinencias
for k = 1:ncol
    classes(k) = find(pertinencias(:,k)==max(pertinencias(:,k)));
end
[nlin ncol] = size(num);
ordem = 1:1:nlin;
matriz = [ordem' num classes'];
matrizPert = [ordem' classes' pertinencias'];

handles.classes = classes;
handles.matriz = matriz;
handles.matrizPert = matrizPert;
handles.centroides = centroides;
handles.nlin = nlin;

nclasses = max(classes);

for j = 1:nclasses
legenda{j} = ['Grupo ', num2str(j)]; 

end





pertGrafico = (matrizPert(:,3:end))*100;
axes(handles.axes1);h = bar(pertGrafico);
xlim([0 nlin+1]);ylim([0 150]);set(get(h(1),'BaseLine'),'LineWidth',2,'LineStyle',':')
title('Pertinências das observações nos clusters')
hleg = legend(legenda,'Location','Best');
colormap jet % Change the color scheme




[nlCen ncCen] = size(centroides);
cen = centroides';
for k = 1:1:ncCen
    
    CenNorm(k,:) = DNormatiza(cen(k,:),Originais(:,k),0,1);
    
    
end
CenNorm = CenNorm';
handles.CenNorm = CenNorm;


helpdlg('A fase de treinamento foi processada com sucesso!');
guidata(hObject, handles);

% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.txt'},'File Selector');
handles.filename = filename;
handles.pathname = pathname;
arquivo = [pathname filename];
set(handles.edit2,'String',arquivo);
set(handles.edit2,'ForegroundColor','Black');
handles.arquivo = arquivo;
guidata(hObject,handles);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
arquivo = handles.arquivo;
winopen(arquivo);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exemplo_ClickedCallback(hObject, eventdata, handles)
pathname = 'C:\BioFuzzy\Exemplos\prj0001_FCM\';
handles.pathname = pathname;
filename = 'prj0001.txt';
handles.filename = filename;
arquivo =[pathname,filename];
handles.arquivo = arquivo;
enderecoExemplo = {'C:\BioFuzzy\Exemplos\prj0001_FCM\prj0001.txt'};
set(handles.edit2,'String',enderecoExemplo);
set(handles.edit2,'ForegroundColor','Black');
guidata(hObject,handles);
% hObject    handle to Exemplo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
