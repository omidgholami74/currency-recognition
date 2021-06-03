function out = balance_color(img,name)

R =img(:,:,1);
G =img(:,:,2);
B =img(:,:,3);


if   mean(R(:)) <150 &&  mean(G(:)) <150 &&  mean(B(:)) <150 
    out =img+30;
elseif  mean(R(:)) >200 &&  mean(G(:)) >200 &&  mean(B(:)) >200 
    out = img-20;
else
    out =img;
end

