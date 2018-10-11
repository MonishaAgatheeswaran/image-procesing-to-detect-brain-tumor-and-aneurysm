function [bwp bwa]=sobel(p)
% p=imread('.\hough\dsa1.jpg');
% p=p(:,:,1);
% clc
% p=p<=level;
% m1=[1 2 1;0 0 0;-1 -2 -1];
% m2=[1 0 -1;2 0 -2;1 0 -1];
m1=[0 1 0;1 -4 1;0 1 0];
m2=[1 0 1;0 -4 0;1 0 1];
[rs cs]=size(p);
% level = graythresh(p);
% p = im2bw(p,level);
np=double(padarray(p,[1 1]));
bwp=zeros(rs,cs);bwa=bwp;

for  r=2:1:rs+1
    for c=2:1:cs+1
        tmp1=m1.*np(r-1:1:r+1,c-1:1:c+1);
        tmp2=m2.*np(r-1:1:r+1,c-1:1:c+1);
        s1=sum(tmp1(:))/9;
        s2=sum(tmp2(:))/9;
        sq=sqrt(s1*s1+s2*s2);
        bwa(r-1,c-1)=atan2(s2,s1)*180/pi;
        bwp(r-1,c-1)=sq;
    end
end
% bwp=bwp>0;
% bw = edge(p,'sobel',0.45);
end