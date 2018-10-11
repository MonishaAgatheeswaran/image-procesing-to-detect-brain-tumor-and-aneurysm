function [psuper pselect]=superimpose(pic,barr,nReg)
color_map=[
    0 0 255;        
    255 0 0;
    0 255 0;
];
cms=size(color_map,1);

reg=zeros([size(barr{1}) 3],'uint8');
pselect=false(size(barr{1}));
bRGB=reg;
scale=round(255/(nReg/3));
for r=1:1:nReg
    
    map=rem(r,cms)+1;
    pselect=pselect|barr{r}>0;
    reg(:,:,1)=barr{r}*color_map(map,1);
    reg(:,:,2)=barr{r}*color_map(map,2);
    reg(:,:,3)=barr{r}*color_map(map,3);
        bRGB=bRGB+abs(reg-(scale*(floor((r-1)/3))));
end
    psuper=pic+bRGB;
end


% s=zeros(30,360,3);
% n=0;
% s(:,2+60*n:60*(n+1),1)=150;
% s(:,2+60*n:60*(n+1),2)=0;
% s(:,2+60*n:60*(n+1),3)=0;
% 
% n=n+1;
% s(:,2+60*n:60*(n+1),1)=0;
% s(:,2+60*n:60*(n+1),2)=150;
% s(:,2+60*n:60*(n+1),3)=0;
% 
% n=n+1;
% s(:,2+60*n:60*(n+1),1)=0;
% s(:,2+60*n:60*(n+1),2)=0;
% s(:,2+60*n:60*(n+1),3)=150;
% 
% n=n+1;
% s(:,2+60*n:60*(n+1),1)=0;
% s(:,2+60*n:60*(n+1),2)=150;
% s(:,2+60*n:60*(n+1),3)=150;
% 
% n=n+1;
% s(:,2+60*n:60*(n+1),1)=150;
% s(:,2+60*n:60*(n+1),2)=0;
% s(:,2+60*n:60*(n+1),3)=150;
% 
% n=n+1;
% s(:,2+60*n:60*(n+1)-1,1)=150;
% s(:,2+60*n:60*(n+1)-1,2)=150;
% s(:,2+60*n:60*(n+1)-1,3)=0;
% 
% s(1,:,:)=0;
% s(end,:,:)=0;
% figure('Color',[1 1 1])
% imshow(s)
% xlabel({'\textbf{Decreasing Peak Number $\longrightarrow$}'},'Visible','on','Interpreter','latex',...
%     'FontSize',12);
