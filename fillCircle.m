function a = fillCircle(xc,yc,r,a)
x=0;
y=r;
p=1-r;


while x<y
   x=x+1;
   if p<0
       p=p+2*x+1;
   else
       y=y-1;
       p=p+2*(x-y)+1;
   end
   
   a(xc-x:xc+x,yc+y)=1;
   a(xc-x:xc+x,yc-y)=1;
   a(xc-y:xc+y,yc+x)=1;
   a(xc-y:xc+y,yc-x)=1;
end
a(xc-r:xc+r,yc)=1;
a(xc,yc-r:yc+r)=1;

end

