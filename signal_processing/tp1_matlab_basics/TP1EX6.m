function varargout = TP1EX6(varargin)
% TP1EX6 MATLAB code for TP1EX6.fig
%      TP1EX6, by itself, creates a new TP1EX6 or raises the existing
%      singleton*.
%
%      H = TP1EX6 returns the handle to a new TP1EX6 or the handle to
%      the existing singleton*.
%
%      TP1EX6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1EX6.M with the given input arguments.
%
%      TP1EX6('Property','Value',...) creates a new TP1EX6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP1EX6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP1EX6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP1EX6

% Last Modified by GUIDE v2.5 20-May-2026 12:13:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP1EX6_OpeningFcn, ...
                   'gui_OutputFcn',  @TP1EX6_OutputFcn, ...
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


% --- Executes just before TP1EX6 is made visible.
function TP1EX6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP1EX6 (see VARARGIN)

% Choose default command line output for TP1EX6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TP1EX6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP1EX6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Tcol.
function Tcol_Callback(hObject, eventdata, handles)
% hObject    handle to Tcol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Tcol contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Tcol


% --- Executes during object creation, after setting all properties.
function Tcol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tcol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ttra.
function Ttra_Callback(hObject, eventdata, handles)
col = get(handles.Tcol, 'value');
if (col == 1)
    col = 'r';
elseif (col == 2)
    col = 'k';
elseif (col == 3)
    col = 'b';
elseif (col == 4)
    col = 'g';
end

check1 = get(handles.checkbox1, 'value');
check2 = get(handles.checkbox2, 'value');
check3 = get(handles.checkbox3, 'value');

past = 0.001;
N =  256;

for i = 1: 1: N
    Ttemp(i) = (i-1) * past;
    t = Ttemp(i);
    TEXP(i) = exp(8*t);
    TCOS(i) = cos(2*pi*50*t);
end
TGauss = gausswin(N);

cla(handles.axes1);
hold(handles.axes1, 'on');

if (check1 == 1)
plot(handles.axes1, Ttemp, TCOS, col)

end

if (check2 == 1)
plot(handles.axes1, Ttemp, TEXP, col)

end

if (check3 == 1)
plot(handles.axes1, Ttemp, TGauss, col)

end

hold(handles.axes1, 'off');



% hObject    handle to Ttra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in Tqui.
function Tqui_Callback(hObject, eventdata, handles)
close;
% hObject    handle to Tqui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)