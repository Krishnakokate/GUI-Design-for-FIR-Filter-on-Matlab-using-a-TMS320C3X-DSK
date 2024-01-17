function varargout = tpp(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tpp_OpeningFcn, ...
                   'gui_OutputFcn',  @tpp_OutputFcn, ...
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

function tpp_OpeningFcn(hObject, eventdata, handles, varargin)
[x,map]=imread('schedule-tracking-processor-status-disk-260nw-1237651030.jpg','jpg');
image(x),colormap(map),axis off,hold on
handles.output = hObject;
guidata(hObject, handles);


function varargout = tpp_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function lp_Callback(hObject, eventdata, handles)
Butterworth_low
close tpp


function hp_Callback(hObject, eventdata, handles)
Butterworth_high
close tpp


function pb_Callback(hObject, eventdata, handles)
Butterworth_pass
close tpp


function sb_Callback(hObject, eventdata, handles)
Butterworth_stop
close tpp
