function half = check_size(img)

        [height ,width,k] =size(img);
        
        if width < 1.5*height
            if 1.1*height> width
                half= 'half';
            else
                half='hasBackground';
            end
           
        else
            half ='complete';
        end
end

