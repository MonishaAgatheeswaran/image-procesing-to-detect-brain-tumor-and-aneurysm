function b=fillCirclefromCentreMatrix(a,rad)

[rs cs]=size(a);
b=zeros(rs,cs);
for r=1:1:rs
    for c=1:1:cs
        if a(r,c)>=rad
            b = fillCircle(r,c,a(r,c),b);            
        end
    end
end

