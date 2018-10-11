s=zeros(40,270,3);
n=0;
s(:,2+90*n:90*(n+1),1)=255;
s(:,2+90*n:90*(n+1),2)=0;
s(:,2+90*n:90*(n+1),3)=0;

n=n+1;
s(:,2+90*n:90*(n+1),1)=0;
s(:,2+90*n:90*(n+1),2)=255;
s(:,2+90*n:90*(n+1),3)=0;

n=n+1;
s(:,2+90*n:90*(n+1)-2,1)=0;
s(:,2+90*n:90*(n+1)-2,2)=0;
s(:,2+90*n:90*(n+1)-2,3)=255;



s(1,:,:)=0;
s(end,:,:)=0;
figure('Color',[1 1 1])
imshow(s)
xlabel({'\textbf{Decreasing Peak Number $\longrightarrow$}'},'Visible','on','Interpreter','latex',...
    'FontSize',12);
saveas(gcf,'.\htmlR\spectrum','png')