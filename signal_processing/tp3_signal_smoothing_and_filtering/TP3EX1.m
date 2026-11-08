function varargout = TP3EX1(varargin)
% TP3EX1 MATLAB code for TP3EX1.fig
%      TP3EX1, by itself, creates a new TP3EX1 or raises the existing
%      singleton*.
%
%      H = TP3EX1 returns the handle to a new TP3EX1 or the handle to
%      the existing singleton*.
%
%      TP3EX1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP3EX1.M with the given input arguments.
%
%      TP3EX1('Property','Value',...) creates a new TP3EX1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP3EX1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP3EX1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help TP3EX1
% Last Modified by GUIDE v2.5 21-May-2026 03:15:14
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP3EX1_OpeningFcn, ...
                   'gui_OutputFcn',  @TP3EX1_OutputFcn, ...
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
% --- Executes just before TP3EX1 is made visible.
function TP3EX1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP3EX1 (see VARARGIN)
% Choose default command line output for TP3EX1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes TP3EX1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = TP3EX1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in Tqui.
function Tqui_Callback(hObject, eventdata, handles)
close();
% hObject    handle to Tqui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function Tfp1_Callback(hObject, eventdata, handles)
% hObject    handle to Tfp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Tfp1 as text
%        str2double(get(hObject,'String')) returns contents of Tfp1 as a double
% --- Executes during object creation, after setting all properties.
function Tfp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tfp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Tfp2_Callback(hObject, eventdata, handles)
% hObject    handle to Tfp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Tfp2 as text
%        str2double(get(hObject,'String')) returns contents of Tfp2 as a double
% --- Executes during object creation, after setting all properties.
function Tfp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tfp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Tapp.
function Tapp_Callback(hObject, eventdata, handles)
global Nt Dt DF Temps TSignal H TSpectre TF;
Fp1 = str2double(get(handles.Tfp1, 'string'));
Fp2 = str2double(get(handles.Tfp2, 'string'));
iFp1 = Fp1/DF;
iFp2 = Fp2/DF;
for iF = 1: 1: Nt/2
    if (iFp1 <= iF && iF <= iFp2)
        H(iF) = 1;
    else
        H(iF) = 0;
    end
end
for iF = (Nt/2)+1: 1: Nt-1
    H(iF) = H(Nt - iF);
end
H(Nt) = H(1);
Amax = max(TSpectre);
plot(handles.axes2, TF(1:Nt/2), TSpectre(1:Nt/2), TF(1:Nt/2), Amax*H(1:Nt/2));
% hObject    handle to Tapp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Tfilt.
function Tfilt_Callback(hObject, eventdata, handles)
global Nt Temps TSignal H;
TSF = fft(TSignal(1:Nt), Nt);
for k = 1:Nt
    TY(k) = TSF(k)*H(k);
end
TSFiltre = real(ifft(TY(1:Nt), Nt));
plot(handles.axes3, Temps(1:Nt), TSFiltre(1:Nt));
% hObject    handle to Tfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
function Tordre_Callback(hObject, eventdata, handles)
% hObject    handle to Tordre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Tordre as text
%        str2double(get(hObject,'String')) returns contents of Tordre as a double
% --- Executes during object creation, after setting all properties.
function Tordre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tordre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Tlisser.
function Tlisser_Callback(hObject, eventdata, handles)
global Nt Temps TSignal TSignalLisse TF;
N = str2double(get(handles.Tordre, 'string'));
Lis = get(handles.Tpop2, 'value');
if (Lis == 1)
    TSignalLisse = smooth(TSignal, N, 'moving');
elseif (Lis == 2)
    f = fit(Temps', TSignal, 'gauss1')
    for it = 1: 1: Nt
        TSignalLisse(it) = f(Temps(it));
    end
elseif (Lis == 3)
    f = fit(Temps', TSignal, 'exp1')
    for it = 1: 1: Nt
        TSignalLisse(it) = f(Temps(it));
    end
elseif (Lis == 4)
    TSignalLisse = envelope(TSignal, N, 'peak');
end
plot(handles.axes3, Temps(1:Nt), TSignalLisse(1:Nt));
% hObject    handle to Tlisser (see GCBO)
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
% --- Executes on button press in Tvis.
function Tvis_Callback(hObject, eventdata, handles)
global Nt Dt DF Temps TSignal TSpectre TF;
S = get(handles.Tpop1, 'value');
if (S == 1)
    fp = fopen('Signal1.txt', 'r');
elseif (S == 2)
    fp = fopen('Signal2.txt', 'r');
elseif (S == 3)
    fp = fopen('Signal3.txt', 'r');
elseif (S == 4)
    fp = fopen('Signal4.txt', 'r');
elseif (S == 5)
    fp = fopen('Signal5.txt', 'r');
end
TSignal = fscanf(fp, '%f');
fclose(fp);
Nt = 1024;
Fe = 8000;
Dt = 1/Fe;
for i = 1: 1: Nt
    Temps(i) = (i - 1)*Dt;
end
plot(handles.axes1, Temps(1:Nt), TSignal(1:Nt));
DF = 1 / (Nt*Dt);
for iF = 1: 1: Nt
    TF(iF) = (iF - 1) * DF;
end
TSpectre = abs(fft(TSignal(1:Nt), Nt));
plot(handles.axes2, TF(1:Nt/2), TSpectre(1:Nt/2));
% hObject    handle to Tvis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)