function corrs = temp_matching(templates,folder,img)
   img=rgb2gray(img);
   values=[];
   for i=1:length(templates)
         name =templates(i).name;
        %load image from train folder
        template=imread(strcat('train/',folder,'/',name));
        template=rgb2gray(template);
        [height, width, k]=size(template);
        templateWidth = width;
        templateHeight = height;
        channelToCorrelate = 1;  % Use the red channel.
        correlationOutput = normxcorr2(template, img);

        % Find out where the normalized cross correlation image is brightest.
        [maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
        [yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
         % Because cross correlation increases the size of the image, 
         % we need to shift back to find out where it would be in the original image.
      corr_offset = [(xPeak-size(template,2)) (yPeak-size(template,1))];
      
         % Calculate the rectangle for the template box.  Rect = [xLeft, yTop, widthInColumns, heightInRows]
       boxRect = [corr_offset(1) corr_offset(2) templateWidth, templateHeight];
            if (boxRect(2) <50  || boxRect(2) > 150) && ...
                    (boxRect(1) <100 || boxRect(1)>300) ...
                   && (boxRect(3)> boxRect(4)) && maxCorrValue >= 0.6 && boxRect(4) <=50 ...
                   && boxRect(1) > 0 && boxRect(2) > 0
           
%                 axis on; % Show tick marks giving pixels
%                  hold on; % Don't allow rectangle to blow away image.
                % rectangle('position', boxRect, 'edgecolor', 'g', 'linewidth',2);
                 values = [values,maxCorrValue]; 
            end
   end

% %      imshow(img); 
  
    
    corrs=values;

end

