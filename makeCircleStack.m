function b=makeCircleStack(radius)

b=cell(radius,1);
for r=1:1:radius
    b{r}=getCircleXY(0,0,r);
end

end