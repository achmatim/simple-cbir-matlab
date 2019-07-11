function varargout = frmMain(varargin)
% FRMMAIN MATLAB code for frmMain.fig
%      FRMMAIN, by itself, creates a new FRMMAIN or raises the existing
%      singleton*.
%
%      H = FRMMAIN returns the handle to a new FRMMAIN or the handle to
%      the existing singleton*.
%
%      FRMMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRMMAIN.M with the given input arguments.
%
%      FRMMAIN('Property','Value',...) creates a new FRMMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before frmMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to frmMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help frmMain

% Last Modified by GUIDE v2.5 14-May-2019 11:20:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frmMain_OpeningFcn, ...
                   'gui_OutputFcn',  @frmMain_OutputFcn, ...
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


% --- Executes just before frmMain is made visible.
function frmMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to frmMain (see VARARGIN)

% Choose default command line output for frmMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes frmMain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = frmMain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Testing_Callback(hObject, eventdata, handles)
% hObject    handle to Testing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
frmTesting

% --------------------------------------------------------------------
function Training_Callback(hObject, eventdata, handles)
% hObject    handle to Training (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

frmTrain



