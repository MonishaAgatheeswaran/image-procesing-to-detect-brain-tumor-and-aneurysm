function hMat=genCircleHierarchy(a,h)
b=makeCircleStack(h);
[rs cs]=size(a);
hMat=zeros(rs,cs);

for row=1:1:rs
    for col=1:1:cs
        
        if a(row,col)==1
            cx=row;cy=col;
            flag=1;
            rad=0;count=0;
            while flag && count<h
                rad=rad+1;
                c=b{rad};
                c(:,1)=c(:,1)+cx;
                c(:,2)=c(:,2)+cy;
                
                if (cx+rad<=rs && cx-rad>0 && cy+rad<=cs && cy-rad>0)
                    flag=1;                        
                    for r=1:1:size(c,1)
                        flag=flag & (a(c(r,1),c(r,2)));
                    end
                else
                    flag = 0;
                end
                count=count+flag;
            end
            hMat(row,col)=count;
        end
    end
end

end