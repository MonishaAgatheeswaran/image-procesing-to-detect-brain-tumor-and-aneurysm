function varargout = nerve3(varargin)
% NERVE3 MATLAB code for nerve3.fig
%      NERVE3, by itself, creates a new NERVE3 or raises the existing
%      singleton*.
%
%      H = NERVE3 returns the handle to a new NERVE3 or the handle to
%      the existing singleton*.
%
%      NERVE3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NERVE3.M with the given input arguments.
%
%      NERVE3('Property','Value',...) creates a new NERVE3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nerve3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nerve3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nerve3

% Last Modified by GUIDE v2.5 06-Oct-2018 20:02:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nerve3_OpeningFcn, ...
                   'gui_OutputFcn',  @nerve3_OutputFcn, ...
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


% --- Executes just before nerve3 is made visible.
function nerve3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nerve3 (see VARARGIN)

% Choose default command line output for nerve3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nerve3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nerve3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[filename pathname] = uigetfile({'*.jpg';'*.tif';'*.gif';'*.png';'*.dcm'},'Select An Image');
disp (filename);
%nerveImg = imread([pathname filename]);
nerveImg=imread(filename);
axes(handles.axes1);
imshow(nerveImg);
global f;
global pic;
global f2;
global ca;
global nerveImg;
global NoOfAneurysm;
global scale;
NoOfAneurysm=2;
scale=0.3;
HierarchyHieght=15;
NeighbourhoodDepth=1;
peakDepth=3;
k=3;
C=0.55;
ca=2;
imagename='f2.dcm';
%I = imread(nerveImg);
dicomwrite(nerveImg, imagename);

 disp('Executing Autothresholding......');
    global pt;
    tic
    [pt pic ]=AutoThreshold(imagename); %threshold pic & original pic
    toc



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f;
global f2;
global ca;
global imagename;
global image8;
global pt;
axes(handles.axes2);
imshow(pt);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f;
global ca;
global f2;
global image8;
global pt;
global ph;
global scale;
global pic;
global barr;
global selReg;
global nReg;
h=15;
disp('Generating Circle Hierarchy.....');
    tic
    ph=genCircleHierarchy(pt,h); %pic of circle hierarchy
    toc
    
    neighbour=1;
    peak=3;
    k=3;
    C=0.55;
    disp('Treking the mountain range......');
    tic
    [b barr nReg]=treking(ph,neighbour,peak);
    toc
    handle=createmeshfigure(ph);
    title([' Hough Hierarchy']);
%   
    disp(['Scaling Factor : ' num2str(scale)]);

    [selReg,data,s]=Detect(barr,nReg,k,C,scale,0);
    nos=round((data*100))/100;
    disp(s);disp(num2str(nos));
    
    X=[num2str(nos)];
    msgbox(X,'Peak_no Area Compactnes Diameter');
    ps1=superimpose(pic,barr,nReg);
    axes(handles.axes3);
    imshow(ps1);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f;
global ca;
global f2;
global image8;
global pt;
global ph;
global scale;
global pic;
global nReg;
global NoOfAneurysm;
global barr;
global selReg;
global nerveImg;
global filename;
[ps2 im_reg]=superimpose(pic,barr,selReg);
axes(handles.axes4);
imshow(ps2);
[match_percentage sensitivity specificity]=Accuracy(filename,im_reg,barr,selReg,nReg,NoOfAneurysm)
if(specificity==1)
    msgbox('Specificity=1 There are more chances for the patient to be affected by Aneurysm. Kindly consult a doctor','Results');
else
    msgbox('The person is healthy','Result');
end
