clc; 
close all;
clear all;
imtool close all;
workspace;
format long g;
format compact;
fontSize = 20;
warning('off', 'MATLAB:MKDIR:DirectoryExists');

files =[dir('test/*.jpg');dir('test/*.jpeg');dir('test/*.png')]; % list of test images

for i=1:length(files)
    imgPadding=zeros(240,440,3);
%     imgPaddind(:)=255;
  name =files(i).name;
  img=imread(strcat('test/',name)); %load image of test folder
  img_org =img; % copy from image 
   [height ,width ,k] = size(img);
  
   if height > width    % if is it portraint ,rotate to landscape
        img =imrotate(img,90);
   end
   check=check_size(img);
   
   if check =="half"
       mkdir ("half");
       movefile(name,"half");
       continue;
   elseif check =="hasBackground"
      img=crop_background(img,name); 
   end
 img=imresize(img,[200,400]);  %resize image
 img=balance_color(img,name);
 dir =processing(img);% cat by mean of colors
 
 imwrite(img_org,name);
 mkdir (dir);
 movefile(name,dir);
end


