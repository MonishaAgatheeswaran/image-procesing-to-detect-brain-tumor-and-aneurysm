


function [pt p thres mx mn]=AutoThreshold(picpath,threshold)
p=dicomread(picpath);%reads dcm format image


pt=p(:,:,1);
h=fspecial('gaussian',3,std(double(pt(:))));%gaussian filters ,3x3 matrix, std deviation of double of the pixels
pt=imfilter(pt,h,'replicate');
mn=min(pt(:));
bwp=sobel(pt);%edge detection 

   mx=max(bwp(:));
   thres=mx+mn;

if nargin==1%nargin no. of input arguments
    pt=pt<thres;
else
    pt=pt<threshold;
end
pt=medfilt2(pt);
end