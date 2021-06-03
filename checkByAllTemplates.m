function Value = checkByAllTemplates(img)
    
%     training data lists
[train500,train1000,train2000,train5000,train10000,train50000]=load_train();
 
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
         Value='500';
    elseif maxValue==dw1000
        Value='1000';
    elseif maxValue==dw2000
        Value='2000';
    elseif maxValue==dw5000
        Value='5000';
    elseif maxValue==dw10000
        Value ='10000';
    elseif maxValue==dw50000
        Value ='50000';
  else
        Value ='not_recognized';
      end
  
  else
      Value ='not_recognized';
  end
      

end

