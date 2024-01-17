function varargout = Rectangular_stop(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rectangular_stop_OpeningFcn, ...
                   'gui_OutputFcn',  @Rectangular_stop_OutputFcn, ...
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


function Rectangular_stop_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Rectangular_stop_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Order_Callback(hObject, eventdata, handles)
N=str2num(get(handles.Order,'String'));


function Order_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Specs1_Callback(hObject, eventdata, handles)
Fc1=str2num(get(handles.Specs1,'String'));

function Specs1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Specs2_Callback(hObject, eventdata, handles)
Fc2=str2num(get(handles.Specs2,'String'));

function Specs2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Sampling_Callback(hObject, eventdata, handles)
Fs=str2num(get(handles.Sampling,'String'));

function Sampling_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Calculate_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
N=str2num(get(handles.Order,'String'));
Fc1=str2num(get(handles.Specs1,'String'));
Fc2=str2num(get(handles.Specs2,'String'));
Fs=str2num(get(handles.Sampling,'String'));
wc1=(Fc1/(Fs/2));
wc2=(Fc2/(Fs/2));
b= fir1(N,[wc1 wc2],'stop',rectwin(N+1));
w=0:0.01:pi;
H=freqz(b,1,w);

axes(handles.axes1)
plot(w,20*log10(abs(H)));
title('FIR Filter Magnitude versus Frequency');
xlabel('Magnitude (dB)');
ylabel('Frequency (Hz)');


% --- Executes on button press in esc.
function esc_Callback(hObject, eventdata, handles)
% hObject    handle to esc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Butterworth_stop
close Rectangular_stop
