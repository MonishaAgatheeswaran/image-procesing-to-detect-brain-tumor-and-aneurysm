a=ones(400,400,3,'uint8')*255;
b=zeros(400,400,'uint8');
c1(:,:,1)=fillCircle(150,150,100,b)*255;
c1(:,:,2)=fillCircle(150,150,100,b)*0;
c1(:,:,3)=fillCircle(150,150,100,b)*0;

c2(:,:,1)=fillCircle(150,250,100,b)*0;
c2(:,:,2)=fillCircle(150,250,100,b)*255;
c2(:,:,3)=fillCircle(150,250,100,b)*0;

c3(:,:,1)=fillCircle(250,200,100,b)*0;
c3(:,:,2)=fillCircle(250,200,100,b)*0;
c3(:,:,3)=fillCircle(250,200,100,b)*255;
I=c1+c2+c3;
b(:,:,1)=I(:,:,1)==0&I(:,:,2)==0&I(:,:,3)==0;
b(:,:,2)=I(:,:,1)==0&I(:,:,2)==0&I(:,:,3)==0;
b(:,:,3)=I(:,:,1)==0&I(:,:,2)==0&I(:,:,3)==0;

I=I+b*255;
imshow(I)
imwrite(I,'.\htmlR\spectrumOverlap.png')