function varargout = TP2EX1(varargin)
% TP2EX1 MATLAB code for TP2EX1.fig
%      TP2EX1, by itself, creates a new TP2EX1 or raises the existing
%      singleton*.
%
%      H = TP2EX1 returns the handle to a new TP2EX1 or the handle to
%      the existing singleton*.
%
%      TP2EX1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP2EX1.M with the given input arguments.
%
%      TP2EX1('Property','Value',...) creates a new TP2EX1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP2EX1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP2EX1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP2EX1

% Last Modified by GUIDE v2.5 20-May-2026 19:20:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP2EX1_OpeningFcn, ...
                   'gui_OutputFcn',  @TP2EX1_OutputFcn, ...
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


% --- Executes just before TP2EX1 is made visible.
function TP2EX1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP2EX1 (see VARARGIN)

% Choose default command line output for TP2EX1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TP2EX1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP2EX1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Tqui.
function Tqui_Callback(hObject, eventdata, handles)
% hObject    handle to Tqui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in Tpop1.
function Tpop1_Callback(hObject, eventdata, handles)
% hObject    handle to Tpop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Tpop1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Tpop1


% --- Executes during object creation, after setting all properties.
function Tpop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tpop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Tpop2.
function Tpop2_Callback(hObject, eventdata, handles)
% hObject    handle to Tpop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Tpop2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Tpop2


% --- Executes during object creation, after setting all properties.
function Tpop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tpop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tfe0_Callback(hObject, eventdata, handles)
% hObject    handle to Tfe0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tfe0 as text
%        str2double(get(hObject,'String')) returns contents of Tfe0 as a double



% --- Executes during object creation, after setting all properties.
function Tfe0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tfe0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ttrac.
function Ttrac_Callback(hObject, eventdata, handles)
global Nt Fe Tsignal
Tx = [];
Tsignal = [];
pop1 = get(handles.Tpop2, 'value');
Nt = 2^(4 + pop1);

Fe = str2double(get(handles.Tfe0, 'string'));

S = get(handles.Tpop1, 'value');



if (S == 1)
    F1 = 50;
for i = 1: 1: Nt
    Tx(i) = (i-1)* (1/Fe);
    Tsignal(i) = sin(2*pi*F1*Tx(i));
end

elseif (S == 2)
 F1 = 50;
 F2 = 75;
for i = 1: 1: Nt
    Tx(i) = (i-1)* (1/Fe);
    Tsignal(i) = sin(2*pi*F1*Tx(i)) + 4*sin(2*pi*F2*Tx(i)) ;
end

elseif (S == 3)
F1 = 50;
F2 = 51;
for i = 1: 1: Nt
    Tx(i) = (i-1)* (1/Fe);
    Tsignal(i) = sin(2*pi*F1*Tx(i)) + sin(2*pi*F2*Tx(i)) ;
end

elseif (S == 4)
    F1 = 10;
    F2 = 50;
    F3 = 75;
    for i = 1: 1: Nt
        Tx(i) = (i-1)* (1/Fe);
        Tsignal(i) = sin(2*pi*F1*Tx(i)) + sin(2*pi*F2*Tx(i)) + sin(2*pi*F3*Tx(i));
    end

elseif (S == 5)
    T = Nt/8;
    for m = 0: 1: 7
      for i = 1: 1: T
        if (i >= T/4 && i <= 3*(T/4))
            Tsignal(i + m*T) = 1;
        else
            Tsignal(i + m*T) = 0;
        end
      end
    end

elseif (S == 6)
    sigma = Nt/20;
    F1 = 30;
    for i = 1: 1: Nt
        Tx(i) = (i - 1) * 1/Fe;
        Tsignal(i) = sin(2*pi*F1*Tx(i))* exp(-(i-Nt/2)^2 / (2*sigma^2));
    end
elseif (S == 7)
    Nt = 1024;
    Fe = 4096;
    fp = fopen('Signal7.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);

elseif (S == 8)
    Nt = 1024;
    Fe = 4096;
    fp = fopen('Signal8.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);
elseif (S == 9)
    Nt = 12288;
    Fe = 11000;
    fp = fopen('Signal9.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);


elseif (S == 10)
    Nt = 12288;
    Fe = 11000;
    fp = fopen('Signal10.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);


elseif (S == 11)
    Nt = 12288;
    Fe = 11000;
    fp = fopen('Signal11.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);


elseif (S == 12)
    Nt = 21760;
    Fe = 11000;
    fp = fopen('Signal12.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);


elseif (S == 13)
    Nt = 21760;
    Fe = 11000;
    fp = fopen('Signal13.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);


elseif (S == 14)
    Nt = 21760;
    Fe = 11000;
    fp = fopen('Signal14.txt', 'r');
    Tsignal = fscanf(fp, '%f');
    fclose(fp);

end


for i = 1: 1: Nt
    Tx(i) = (i-1)* (1/Fe);
    TFreq(i) = (i-1)* (Fe/Nt);
end

TSpectre = abs(fft(Tsignal(1:Nt), Nt));

plot(handles.axes1, Tx(1:Nt), Tsignal(1:Nt));
plot(handles.axes2, TFreq(1:Nt/2), TSpectre(1:Nt/2));


% hObject    handle to Ttrac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Tplay.
function Tplay_Callback(hObject, eventdata, handles)
global Nt Fe Tsignal
sound(Tsignal(1:Nt), Fe);
% hObject    handle to Tplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)