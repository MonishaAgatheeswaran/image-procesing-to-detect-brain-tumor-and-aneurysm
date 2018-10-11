function varargout = gui_imp(varargin)
% GUI_IMP MATLAB code for gui_imp.fig
%      GUI_IMP, by itself, creates a new GUI_IMP or raises the existing
%      singleton*.
%
%      H = GUI_IMP returns the handle to a new GUI_IMP or the handle to
%      the existing singleton*.
%
%      GUI_IMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IMP.M with the given input arguments.
%
%      GUI_IMP('Property','Value',...) creates a new GUI_IMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_imp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_imp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_imp

% Last Modified by GUIDE v2.5 22-Sep-2018 19:49:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_imp_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_imp_OutputFcn, ...
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


% --- Executes just before gui_imp is made visible.
function gui_imp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_imp (see VARARGIN)
handles.output = hObject;
ss = ones(200,200);
axes(handles.axes2);
imshow(ss);
axes(handles.axes3);
imshow(ss);

% Choose default command line output for gui_imp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_imp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_imp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','Pick an MRI Image');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P = imread([PathName,FileName]);
    P = imresize(P,[200,200]);
   % input =imresize(a,[512 512]); 
  
  axes(handles.axes2)
  imshow(P);title('Brain MRI Image');
 % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit2,'string',Pathname);
  handles.ImgData = P;
%  handles.FileName = FileName;

  guidata(hObject,handles);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num_iter = 10;
    delta_t = 1/7;
    kappa = 15;
    option = 2;
    %disp('Preprocessing image please wait . . .');
    I = handles.ImgData;
    ad = anisodiff(I,num_iter,delta_t,kappa,option);
    axes(handles.axes3)
imshow(ad);title('Filtered image');
    l1=30;l2=37;l3=40;l4=42;q1=53;q2=39;q3=36;q4=40;z1=26;z2=16;z3=53;z4=60;
