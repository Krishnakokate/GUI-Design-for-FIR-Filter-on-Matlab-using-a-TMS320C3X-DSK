function varargout = Hanning_b(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hanning_b_OpeningFcn, ...
                   'gui_OutputFcn',  @Hanning_b_OutputFcn, ...
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


function Hanning_b_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Hanning_b_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Order_Callback(hObject, eventdata, handles)

N=str2num(get(handles.Order,'String'));


% Hints: get(hObject,'String') returns contents of Order as text
%        str2double(get(hObject,'String')) returns contents of Order as a double


function Order_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Specs_Callback(hObject, eventdata, handles)
Fc=str2num(get(handles.Specs,'String'));
% Hints: get(hObject,'String') returns contents of Specs as text
%        str2double(get(hObject,'String')) returns contents of Specs as a double


function Specs_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sampling_Callback(hObject, eventdata, handles)
Fs=str2num(get(handles.Sampling,'String'));

function Sampling_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calcular_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
N=str2num(get(handles.Order,'String'));
Fc=str2num(get(handles.Specs,'String'));
Fs=str2num(get(handles.Sampling,'String'));
wn=(2*pi*Fc/Fs);
window=hanning(N+1);
b= fir1(N,wn/pi,'high',window);
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
Butterworth_high
close Hanning_b
