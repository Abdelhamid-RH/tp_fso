function varargout = TP1EX4(varargin)
% TP1EX4 MATLAB code for TP1EX4.fig
%      TP1EX4, by itself, creates a new TP1EX4 or raises the existing
%      singleton*.
%
%      H = TP1EX4 returns the handle to a new TP1EX4 or the handle to
%      the existing singleton*.
%
%      TP1EX4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1EX4.M with the given input arguments.
%
%      TP1EX4('Property','Value',...) creates a new TP1EX4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP1EX4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP1EX4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP1EX4

% Last Modified by GUIDE v2.5 20-May-2026 10:33:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP1EX4_OpeningFcn, ...
                   'gui_OutputFcn',  @TP1EX4_OutputFcn, ...
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


% --- Executes just before TP1EX4 is made visible.
function TP1EX4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP1EX4 (see VARARGIN)

% Choose default command line output for TP1EX4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TP1EX4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TP1EX4_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in Tcal.
function Tcal_Callback(hObject, eventdata, handles)
x = str2double
% hObject    handle to Tcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Tx_Callback(hObject, eventdata, handles)
% hObject    handle to Tx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tx as text
%        str2double(get(hObject,'String')) returns contents of Tx as a double


% --- Executes during object creation, after setting all properties.
function Tx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ty_Callback(hObject, eventdata, handles)
% hObject    handle to Ty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ty as text
%        str2double(get(hObject,'String')) returns contents of Ty as a double


% --- Executes during object creation, after setting all properties.
function Ty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
X = str2double(get(handles.Tx, 'string'));
Y = X^2;
set(handles.Ty, 'string', Y);



% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
