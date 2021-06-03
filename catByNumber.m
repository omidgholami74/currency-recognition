function folder = catByNumber(img)
    
%     training data lists
train500   =[dir('train/500/*.jpg');dir('train/500/*.jpeg');dir('train/500/*.png')];
train1000  =[dir('train/1000/*.jpg');dir('train/1000/*.jpeg');dir('train/1000/*.png')];
train2000  =[dir('train/2000/*.jpg');dir('train/2000/*.jpeg');dir('train/2000/*.png')];
train5000  =[dir('train/5000/*.jpg');dir('train/5000/*.jpeg');dir('train/5000/*.png')];
train10000 =[dir('train/10000/*.jpg');dir('train/10000/*.jpeg');dir('train/10000/*.png')];
train50000 =[dir('train/50000/*.jpg');dir('train/50000/*.jpeg');dir('train/50000/*.png')];
 
   %dw100 = difference with 100 toman
   %Calculate template matching
  dw500=max(temp_matching(train500,'500',img));
  dw1000=max(temp_matching(train1000,'1000',img));
  dw2000=max(temp_matching(train2000,'2000',img));
  dw5000=max(temp_matching(train5000,'5000',img));
  dw10000=max(temp_matching(train10000,'10000',img));
  dw50000=max(temp_matching(train50000,'50000',img));
  %We get the max  from each and
  % then we drop all of them  within one array
  values=[dw500,dw1000,dw2000,dw5000,dw10000,dw50000];
  values=sort(values);
  maxValue=max(values);
  
  if maxValue>0.7
      if maxValue==dw500
         folder='500';
    elseif maxValue==dw1000
        folder='1000';
    elseif maxValue==dw2000
        folder='2000';
    elseif maxValue==dw5000
        folder='5000';
    elseif maxValue==dw10000
        folder ='10000';
    elseif maxValue==dw50000
        folder ='50000';
  else
        folder ='not_recognized';
      end
  
  else
      folder ='not_recognized';
  end
      

end

