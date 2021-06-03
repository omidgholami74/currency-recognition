function varargout = curreny(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @curreny_OpeningFcn, ...
                   'gui_OutputFcn',  @curreny_OutputFcn, ...
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

function curreny_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
axes(handles.axes15);
imshow(imread('logo.jfif'));
guidata(hObject, handles);

function varargout = curreny_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

     str='';
    [imname,impath]=uigetfile({'*.jpg;*.jpeg;*.png'});
    imgPath =strcat(impath,imname);
    img = imread(imgPath);
    
   [height ,width ,k] = size(img);
   set(handles.text18,'string',"Width : "+num2str(height)+ "   "+"Height : "+num2str(width));
   if height > width    % if is it portraint ,rotate to landscape
       str= "orientation of your image is Portrait"+newline+"The photo was rotated 90 degrees"+newline;
        img =imrotate(img,90);
   else
       str= "orientation of your image is Landscape"+newline;
   end
   
    axes(handles.axes2);imshow(img);
    axes(handles.axes4);imhist(img(:,:,1));
    axes(handles.axes5);imhist(img(:,:,2));
    axes(handles.axes11);imhist(img(:,:,3));
   
     check= check_size(img); 
     check="image size of your money is :   "+check+newline;
     edges=edge(rgb2gray(img),'sobel');
     axes(handles.axes9);
     imshow(edges);
     
     img=pre_processing(img);
     [height_pre ,width_pre ,k] = size(img);
     str=str+ "image resize to "+num2str(height_pre)+' x '+num2str(width_pre)+newline;
     set(handles.text20,'string',strcat(num2str(height_pre),'x',num2str(width_pre)));
     axes(handles.axes10);
     imshow(img);
     
     axes(handles.axes13);
     [meanR,meanG,meanB]=mean_color(img);
     mean_matrix=zeros(100,200,3,'uint8');
     mean_matrix(:,:,1)= meanR;
     mean_matrix(:,:,2)= meanG;
     mean_matrix(:,:,3)= meanB;
     HSV = rgb2hsv(meanR,meanG,meanB);
     h=round(HSV(:,:,1)*360);
     s= floor(HSV(:,:,2)*100);
     I= floor(HSV(:,:,3));
     imshow(mean_matrix);
     colors ="Red : "+num2str(meanR)+newline+"Green : "+num2str(meanG)+newline ...
       +"Blue : "+num2str(meanB) +newline+newline + "Hue : "+num2str(h)+newline ...
       +"Saturation : " +num2str(s)+ "%"+newline+"Intensity : "+ num2str(I);
      set(handles.text17,'string',colors);
     
    value_of_money =processing(img);
     if  strcmpi(value_of_money, 'not_recognized')  
       set(handles.text2,'string',strcat(str,check,"Sorry ,I can't recognize your money "));
     else
       set(handles.text2,'string',strcat(str,check,"Value of your money is :   ",value_of_money, "0 IRR"));  
     end
% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
