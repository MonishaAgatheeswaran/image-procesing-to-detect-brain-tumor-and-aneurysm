function [b barr count]=treking(ph,neighbourDepth,peakdepth)

if nargin==1
    neighbourDepth=2;
    peakdepth=9;
elseif nargin==2
    peakdepth=9;
end

b=zeros(size(ph));
[rad ind]=max(ph(:));
count=0;

while rad>peakdepth
    %     rad
    a=false(size(ph));
    [xc yc]=ind2sub(size(ph),ind);
    a = fillCircle(xc,yc,ph(xc,yc),a);
    
    for r=rad:-1:1
       a=a|fillCirclefromCentreMatrix(a.*ph,rad-neighbourDepth);
    end
    count=count+1;
    b=b+a*count;
    ph=ph.*(~a);
    [rad ind]=max(ph(:));
    barr{count}=a;
end
if(count==0)
    barr{1}=false(size(ph));
end
end