function varargout = Hamming(varargin)
% HAMMING MATLAB code for Hamming.fig
%      HAMMING, by itself, creates a new HAMMING or raises the existing
%      singleton*.
%
%      H = HAMMING returns the handle to a new HAMMING or the handle to
%      the existing singleton*.
%
%      HAMMING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAMMING.M with the given input arguments.
%
%      HAMMING('Property','Value',...) creates a new HAMMING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hamming_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hamming_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools back.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hamming

% Last Modified by GUIDE v2.5 08-Nov-2022 23:06:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hamming_OpeningFcn, ...
                   'gui_OutputFcn',  @Hamming_OutputFcn, ...
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


% --- Executes just before Hamming is made visible.
function Hamming_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hamming (see VARARGIN)

% Choose default command line output for Hamming
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hamming wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hamming_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Order_Callback(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Order as text
%        str2double(get(hObject,'String')) returns contents of Order as a double
N=str2num(get(handles.Order,'String'));


% --- Executes during object creation, after setting all properties.
function Order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Specs_Callback(hObject, eventdata, handles)
% hObject    handle to Specs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fc=str2num(get(handles.Specs,'String'));

% Hints: get(hObject,'String') returns contents of Specs as text
%        str2double(get(hObject,'String')) returns contents of Specs as a double


% --- Executes during object creation, after setting all properties.
function Specs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Specs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sampling_Callback(hObject, eventdata, handles)
% hObject    handle to Sampling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2num(get(handles.Sampling,'String'));

% Hints: get(hObject,'String') returns contents of Sampling as text
%        str2double(get(hObject,'String')) returns contents of Sampling as a double


% --- Executes during object creation, after setting all properties.
function Sampling_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sampling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=str2num(get(handles.Order,'String'));
Fc=str2num(get(handles.Specs,'String'));
Fs=str2num(get(handles.Sampling,'String'));
wc=(2*pi*Fc/Fs);
b= fir1(N,wc/pi,hamming(N+1));
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
Butterworth_low
close Hamming
