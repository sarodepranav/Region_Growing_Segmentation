function varargout = Region_Growing_Segmentation(varargin)
% REGION_GROWING_SEGMENTATION MATLAB code for Region_Growing_Segmentation.fig
%      REGION_GROWING_SEGMENTATION, by itself, creates a new REGION_GROWING_SEGMENTATION or raises the existing
%      singleton*.
%
%      H = REGION_GROWING_SEGMENTATION returns the handle to a new REGION_GROWING_SEGMENTATION or the handle to
%      the existing singleton*.
%
%      REGION_GROWING_SEGMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGION_GROWING_SEGMENTATION.M with the given input arguments.
%
%      REGION_GROWING_SEGMENTATION('Property','Value',...) creates a new REGION_GROWING_SEGMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Region_Growing_Segmentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Region_Growing_Segmentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Region_Growing_Segmentation

% Last Modified by GUIDE v2.5 17-Apr-2019 11:33:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Region_Growing_Segmentation_OpeningFcn, ...
                   'gui_OutputFcn',  @Region_Growing_Segmentation_OutputFcn, ...
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


% --- Executes just before Region_Growing_Segmentation is made visible.
function Region_Growing_Segmentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Region_Growing_Segmentation (see VARARGIN)

% Choose default command line output for Region_Growing_Segmentation
handles.output = hObject;

% Update handles structurebgrdbGDGDGloi
guidata(hObject, handles);
% UIWAIT makes Region_Growing_Segmentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = Region_Growing_Segmentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



%No need to change anything above this
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in choose.
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global f
[namefile,pathname]=uigetfile({'*.bmp;*.tif;*.tiff;*.jpg;*.jpeg;*.gif',...
    'IMAGE Files (*.bmp,*.tif,*.tiff,*.jpg,*.jpeg,*.gif)'},...
    'Chose GrayScale Image');
f=imread(strcat(pathname,namefile));

if size(f,3)>1              %Checking if image is rgb or gray
    f = rgb2gray(f);
else
    f = f;
end
figure('Name','ORIGINAL IMAGE','NumberTitle','off');
movegui(figure(1), 'west');
imshow(f);
title('Original Image');


figure('Name','SEGMENT THIS IMAGE','NumberTitle','off');
movegui(figure(2), 'east');
imshow(f);






% --- Executes on button press in segment.
function segment_Callback(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
figure(2);
[row  ,col]=size(f);
g=zeros(row,col);
%figure(1);
%imshow((f));
[y,x]=ginput(3);
data = f(round(y), round(x));
for i=1:row-1
    for j=1:col-1
        value(i,j)=f(i,j);
        k=value(i,j);
        if abs(data-k)<=10
            value(i,j)=255;
        else
            value(i,j)=0;
        end
    end
end


figure(2), imshow((value));





% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;



% --- Executes on button press in aboutus.
function aboutus_Callback(hObject, eventdata, handles)
% hObject    handle to aboutus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a = sprintf('Project Team - \n46.  Nikhil Patil \n48.  Siddhesh Patil \n58.  Pranav Sarode \n65.  Mrunal Tambat \n\n Created under the guidance of Prof. Mrugendra Vasmatkar');
if get(hObject,'Value')
    set(handles.statictextaboutus,'Visible','On')
else
    set(handles.statictextaboutus,'Visible','Off')
end




% --- Executes on button press in closeimage.
function closeimage_Callback(hObject, eventdata, handles)
% hObject    handle to closeimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(1);
close(2);
