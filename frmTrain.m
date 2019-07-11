function varargout = frmTrain(varargin)
% FRMTRAIN MATLAB code for frmTrain.fig
%      FRMTRAIN, by itself, creates a new FRMTRAIN or raises the existing
%      singleton*.
%
%      H = FRMTRAIN returns the handle to a new FRMTRAIN or the handle to
%      the existing singleton*.
%
%      FRMTRAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRMTRAIN.M with the given input arguments.
%
%      FRMTRAIN('Property','Value',...) creates a new FRMTRAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before frmTrain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to frmTrain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help frmTrain

% Last Modified by GUIDE v2.5 14-May-2019 23:10:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frmTrain_OpeningFcn, ...
                   'gui_OutputFcn',  @frmTrain_OutputFcn, ...
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


% --- Executes just before frmTrain is made visible.
function frmTrain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to frmTrain (see VARARGIN)

% Choose default command line output for frmTrain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes frmTrain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = frmTrain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFolder.
function btnFolder_Callback(hObject, eventdata, handles)
% hObject    handle to btnFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vpath = uigetdir();
set(handles.txtFolder, 'String', vpath);
handles.folderData = vpath;
guidata(hObject, handles);


% --- Executes on button press in btnSaveFitur.
function btnSaveFitur_Callback(hObject, eventdata, handles)
% hObject    handle to btnSaveFitur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uiputfile('dbfitur.mat','Simpan Fitur');
set(handles.txtFitur, 'String', fullfile(path,file));
handles.fileFitur = fullfile(path,file);
guidata(hObject, handles);


% --- Executes on button press in btnProses.
function btnProses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folderData = handles.folderData;
fileFitur = handles.fileFitur;
hasil = ekstraksiFitur(folderData, fileFitur);
if hasil > 0
    set(handles.txtHasil, 'String', ['Ekstraksi fitur ' hasil 'citra telah berhasil.']);
end
