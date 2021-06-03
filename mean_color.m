function [R_out,G_out,B_out] = mean_color(img)
      R = img(:,:,1);
      G = img(:,:,2);
      B = img(:,:,3);
      
      meanR=floor(mean(R(:)));
      meanG=floor(mean(G(:)));
      meanB=floor(mean(B(:)));
      R_out =meanR;
      G_out =meanG;
      B_out =meanB;
      
end

