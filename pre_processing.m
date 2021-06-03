function image_out = pre_processing(img)
 
   check=check_size(img);
   
  if strcmpi(check,'hasBackground')
      img=crop_background(img); 
   end
 img=imresize(img,[200,400]);  %resize image
 img=balance_color(img);
 image_out =img;
end

