function check = check_size(img)

        [height ,width,k] =size(img);
        
        if width < 1.5*height
            if 1.1*height> width
                check= 'half';
            else
                check='hasBackground';
            end
           
        else
            check ='complete';
        end
end

