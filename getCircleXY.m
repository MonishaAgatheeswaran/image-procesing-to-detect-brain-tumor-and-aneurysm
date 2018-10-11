function a = getCircleXY(xc,yc,r)

if r==1
    a =[1     0;
        -1     0;
        0     1;
        0    -1];
    a(:,1)=a(:,1)+xc;
    a(:,2)=a(:,2)+yc;
    return;
end

x=0;
y=r;
p=1-r;
count=0;

while x<y
    x=x+1;
    if p<0
        p=p+2*x+1;
    else
        y=y-1;
        p=p+2*(x-y)+1;
    end
    
    a(count+1,:)=[xc+x yc+y];
    a(count+2,:)=[xc-x yc+y];
    a(count+3,:)=[xc+x yc-y];
    a(count+4,:)=[xc-x yc-y];
    a(count+5,:)=[xc+y yc+x];
    a(count+6,:)=[xc-y yc+x];
    a(count+7,:)=[xc+y yc-x];
    a(count+8,:)=[xc-y yc-x];
    
    count=count+8;
end
end

