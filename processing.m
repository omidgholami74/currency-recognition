function Value = processing(img)
[train500,train1000,train2000,train5000,train10000,train50000]=load_train();

    [meanR,meanG,meanB]=mean_color(img);
      HSV = rgb2hsv(meanR,meanG,meanB);
      h=round(HSV(:,:,1)*360);
      
            Value =check_by_color_and_template();
            if strcmpi(Value, 'not_recognized') 
                Value =check_by_color();
                    if  strcmpi(Value, 'not_recognized')  
                     Value =checkByAllTemplates(img);
                    end
            end
            
            
            
            
            
            
            
            
            
            
                   
            
            
    function value= check_by_color_and_template()

            if h > 114 & h <193 & meanR>130 & max(temp_matching(train1000,'1000',img))>0.7
                      value= '1000';      
            elseif h > 189 & h < 231 & meanB>160 & max(temp_matching(train2000,'2000',img))>0.6
                      value= '2000';      
            elseif h > 44 & h <86 & meanR <210 & max(temp_matching(train10000,'10000',img))>0.6
                      value= '10000';
            elseif h > 31 & h < 44 & max(temp_matching(train5000,'5000',img))>0.7
                      value= '5000';  
            elseif h > 5 & h <35 
                    if max(temp_matching(train500,'500',img))>0.7  
                          value= '500'; 
                    elseif max(temp_matching(train50000,'50000',img))>0.6
                        value= '50000';
                    else
                        value ='not_recognized';
                    end   
            else
                 value ='not_recognized'     
            end
    end
    
    function value= check_by_color()

       
        if h > 114 & h <193 & meanR>130
                  value= '1000';

        elseif h > 189 & h < 231 & meanB>160 
                  value= '2000';

        elseif h > 31 & h < 44 
                  value= '5000';

        elseif h > 49 & h <60 & meanR <210 
                  value= '10000';
        else 
                  value ='not_recognized';
        end 
    end
        
end 

    
    
    



















