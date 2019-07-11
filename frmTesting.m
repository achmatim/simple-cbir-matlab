function varargout = frmTesting(varargin)
% FRMTESTING MATLAB code for frmTesting.fig
%      FRMTESTING, by itself, creates a new FRMTESTING or raises the existing
%      singleton*.
%
%      H = FRMTESTING returns the handle to a new FRMTESTING or the handle to
%      the existing singleton*.
%
%      FRMTESTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRMTESTING.M with the given input arguments.
%
%      FRMTESTING('Property','Value',...) creates a new FRMTESTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before frmTesting_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to frmTesting_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help frmTesting

% Last Modified by GUIDE v2.5 15-May-2019 00:36:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frmTesting_OpeningFcn, ...
                   'gui_OutputFcn',  @frmTesting_OutputFcn, ...
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


% --- Executes just before frmTesting is made visible.
function frmTesting_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to frmTesting (see VARARGIN)

% Choose default command line output for frmTesting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes frmTesting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = frmTesting_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnQuery.
function btnQuery_Callback(hObject, eventdata, handles)
% hObject    handle to btnQuery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile({'*.jpg;*.png'},'Open Image');
img = imread(fullfile(path,file));
imshow(img);
handles.img = img;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'XTick',[]);
set(gca,'YTick',[]);
set(gca,'TickLength',[0 .01])


% --- Executes on button press in btnCari.
function btnCari_Callback(hObject, eventdata, handles)
% hObject    handle to btnCari (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.img;
hasil = imageQuery(img);
jum = length(hasil);
if jum > 6
    jum = 6;
end
set(handles.uipanel1,'visible','on');
for i=1 : jum
    h = handles.(['axes' num2str(i+2)]);
    set(h,'visible','on');
    G = imread(char(hasil(i).nama)); imshow(G,'Parent',h);
    set(get(h,'xlabel'),'string',(num2str(hasil(i).jarak)) );
end
