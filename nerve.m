function varargout = nerve(varargin)
% NERVE MATLAB code for nerve.fig
%      NERVE, by itself, creates a new NERVE or raises the existing
%      singleton*.
%
%      H = NERVE returns the handle to a new NERVE or the handle to
%      the existing singleton*.
%
%      NERVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NERVE.M with the given input arguments.
%
%      NERVE('Property','Value',...) creates a new NERVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nerve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nerve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nerve

% Last Modified by GUIDE v2.5 27-Sep-2018 09:41:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nerve_OpeningFcn, ...
                   'gui_OutputFcn',  @nerve_OutputFcn, ...
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


% --- Executes just before nerve is made visible.
function nerve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nerve (see VARARGIN)

% Choose default command line output for nerve
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nerve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nerve_OutputFcn(hObject, eventdata, handles) 
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
global nerveImg
%clear all
clc
diary off
filename{1}='CA1';NoOfAneurysm{1}=2;scale{1}=0.6;
filename{2}='CA2';NoOfAneurysm{2}=2;scale{2}=0.4;
filename{3}='CA3';NoOfAneurysm{3}=2;scale{3}=0.6;
filename{4}='CA4';NoOfAneurysm{4}=3;scale{4}=0.3;
filename{5}='CA5';NoOfAneurysm{5}=1;scale{5}=0.6;

HierarchyHieght=15;
NeighbourhoodDepth=1;
peakDepth=3;
k=3;
C=0.55;
[filename pathname] = uigetfile({'*.jpg';'*.tif';'*.gif';'*.png';'.dcm'},'Select An Image');
if filename=="CA1"
    ca=1;
else if filename=="CA2"
        ca=2;
    else if filename=="CA3"
            ca=3;
        else if filename=="CA4"
                ca=4;
            else if filename=="CA5"
                    ca=5;
                end
            end
        end
    end
end
nerveImg = imread([pathname filename]);
axes(handles.axes1);
imshow(nerveImg);
axis off
[m n c] = size(nerveImg);
if c == 3
    nerveImg  = rgb2gray(nerveImg);
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nerveImg
 tic
    [pt pic ]=AutoThreshold(nerveImg); %threshold pic & original pic
 toc
 axes(handles.axes2);
imshow(pt);
 h=HierarchyHieght;
 disp('Generating Circle Hierarchy.....');
    tic
    ph=genCircleHierarchy(pt,h); %pic of circle hierarchy
    toc
    
    neighbour=NeighbourhoodDepth;
    peak=peakDepth;
    
    

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Treking the mountain range......');
    tic
    [b barr nReg]=treking(ph,neighbour,peak);
    toc
    
    handle=createmeshfigure(ph);
    disp(['Scaling Factor : ' num2str(scale{ca})]);

    [selReg,data,s]=Detect(barr,nReg,k,C,scale{ca},0);
    nos=round((data*100))/100;
    disp(s);disp(num2str(nos));
    ps1=superimpose(pic,barr,nReg);
%     imwrite(ps1,['./htmlR/CA' num2str(ca) 'MultiDetect.png'])
    
    axes(handles.axes3);
    imshow(ps1);
    


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ps2 im_reg]=superimpose(pic,barr,selReg);
%     imwrite(ps2,['./htmlR/CA' num2str(ca) 'FullDetect.png'])
axes(handles.axes4);
    imshow(ps2)
    %title([filename{ca},': Aneurysm Regions']);
    %         snapnow;

    
[match_percentage sensitivity specificity]=Accuracy(f,im_reg,barr,selReg,nReg,NoOfAneurysm{ca})
beep;
%%
