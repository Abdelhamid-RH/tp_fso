function varargout = EX5(varargin)
% EX5 MATLAB code for EX5.fig
%      EX5, by itself, creates a new EX5 or raises the existing
%      singleton*.
%
%      H = EX5 returns the handle to a new EX5 or the handle to
%      the existing singleton*.
%
%      EX5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EX5.M with the given input arguments.
%
%      EX5('Property','Value',...) creates a new EX5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EX5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EX5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EX5

% Last Modified by GUIDE v2.5 20-May-2026 10:48:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EX5_OpeningFcn, ...
                   'gui_OutputFcn',  @EX5_OutputFcn, ...
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


% --- Executes just before EX5 is made visible.
function EX5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EX5 (see VARARGIN)

% Choose default command line output for EX5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EX5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EX5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in Tope.
function Tope_Callback(hObject, eventdata, handles)
% hObject    handle to Tope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Tope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
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


% --- Executes on button press in Tcal.
function Tcal_Callback(hObject, eventdata, handles)

x = str2double(get(handles.Tx, 'string'));
y = str2double(get(handles.Ty, 'string'));
o = get(handles.Tope, 'value');

    if (o == 1)
       z  = x + y;
    elseif (o == 3)
        z= x*y;
    elseif (o == 4)
        z = x / y;
    elseif (o == 2)
        z = x - y;
    end

    set(handles.Tres, 'string', num2str(z));


% hObject    handle to Tcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Tres_Callback(hObject, eventdata, handles)
% hObject    handle to Tres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tres as text
%        str2double(get(hObject,'String')) returns contents of Tres as a double


% --- Executes during object creation, after setting all properties.
function Tres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Tqui.
function Tqui_Callback(hObject, eventdata, handles)
close;
% hObject    handle to Tqui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)