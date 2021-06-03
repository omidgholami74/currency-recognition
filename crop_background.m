function image = crop_background(img)
  imgGray=rgb2gray(img);
  % find edges
  edges=edge(imgGray,'canny',0.4);
  binaryImage = bwareafilt(edges, 1);
  [rows, columns] = find(binaryImage);
  row1 = min(rows);
  row2 = max(rows);
  col1 = min(columns);
  col2 = max(columns);
  handles = guidata(gcf);
  set(handles.text21,"string","Y1 : "+num2str(row1)+ "      "+"Y2 : "+"      "+num2str(row2) ...
      +newline+ "X1 : "+num2str(col1)+"       "+"X2 : "+"     "+ num2str(col2));
  [height_img,width_img,k]=size(img);
  w=col2-col1;
  h =row2-row1;
  if  w/h >4
     h= floor(((w/h)*h)/1.9);
     row2 =h+row1;
  end
  if w < 1.6*h
      if width_img*0.35 >col1
          col2=col2+w;
      else
          col1=col1-w;
      end
  end
  
  if width_img/w >5
      if width_img*0.4 >col1
          col2=col2+2*w;
      else
          col1=col1-2*w;
      end
  end
  if height_img/h >5
      if height_img*0.4 >row1
          row2=row2+2*h;
      else
          row1=row1-2*h;
      end
  end

%Crop
    cropped = img(row1:row2, col1:col2, :);
    [height,width,k]=size(cropped);
    if height >97
        image=cropped;  
    else
        image =img;
    end
    %imshow(image);

end

