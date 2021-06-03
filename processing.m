function folder = processing(img)
train500   =[dir('train/500/*.jpg');dir('train/500/*.jpeg');dir('train/500/*.png')];
train1000  =[dir('train/1000/*.jpg');dir('train/1000/*.jpeg');dir('train/1000/*.png')];
train2000  =[dir('train/2000/*.jpg');dir('train/2000/*.jpeg');dir('train/2000/*.png')];
train5000  =[dir('train/5000/*.jpg');dir('train/5000/*.jpeg');dir('train/5000/*.png')];
train10000 =[dir('train/10000/*.jpg');dir('train/10000/*.jpeg');dir('train/10000/*.png')];
train50000 =[dir('train/50000/*.jpg');dir('train/50000/*.jpeg');dir('train/50000/*.png')];

      R = img(:,:,1);
      G = img(:,:,2);
      B = img(:,:,3);
      
      meanR=floor(mean(R(:)));
      meanG=floor(mean(G(:)));
      meanB=floor(mean(B(:)));


      HSV = rgb2hsv(meanR,meanG,meanB);
      h=round(HSV(:,:,1)*360);
      
    if h > 114 & h <193 & meanR>130 & max(temp_matching(train1000,'1000',img))>0.7
              folder= '1000';
              
    elseif h > 189 & h < 231 & meanB>160 & max(temp_matching(train2000,'2000',img))>0.6
              folder= '2000';
              

              
    elseif h > 44 & h <86 & meanR <210 & max(temp_matching(train10000,'10000',img))>0.6
              folder= '10000';
    elseif h > 31 & h < 44 & max(temp_matching(train5000,'5000',img))>0.7
              folder= '5000';  
    elseif h > 5 & h <35 
        if max(temp_matching(train500,'500',img))>0.7  
              folder= '500'; 
        elseif max(temp_matching(train50000,'50000',img))>0.6
            folder= '50000';
        else
            folder ='not_recognized';
        end
          
        
    else 
             folder =check_by_color();
             if  strcmpi(folder, 'not_recognized')  
                 folder =catByNumber(img);
             end
            
    end 
    
    
    function folder= check_by_color()

       
    if h > 114 & h <193 & meanR>130
              folder= '1000';
              
    elseif h > 189 & h < 231 & meanB>160 
              folder= '2000';
              
    elseif h > 31 & h < 44 
              folder= '5000';
              
    elseif h > 49 & h <60 & meanR <210 
              folder= '10000';
    else 
              folder ='not_recognized';
    end 
    end


end


