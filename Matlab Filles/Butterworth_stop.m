function varargout = Butterworth_stop(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Butterworth_stop_OpeningFcn, ...
                   'gui_OutputFcn',  @Butterworth_stop_OutputFcn, ...
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

function Butterworth_stop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Butterworth_stop (see VARARGIN)
[x,map]=imread('SIG.jpg','jpg');

image(x),colormap(map),axis off,hold on
% Choose default command line output for Butterworth_stop
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Butterworth_stop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Butterworth_stop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ham.
function ham_Callback(hObject, eventdata, handles)
% hObject    handle to ham (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hamming_stop
close Butterworth_stop


% --- Executes on button press in rect.
function rect_Callback(hObject, eventdata, handles)
% hObject    handle to rect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rectangular_stop
close Butterworth_stop

% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tpp
close Butterworth_stop

% --- Executes on button press in han.
function han_Callback(hObject, eventdata, handles)
% hObject    handle to han (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hanning_stop
close Butterworth_stop
