function [match_percentage,sensitivity,specificity]=Accuracy(filename,im_reg,barr,selReg,nReg,NoOfAneurysm)
%im_ori=imread(['.\manual\' 'myfile' '_manual.dat']);
im_ori=importdata(filename);
im_ori=im_ori<150;
im_dist=bwdist(~im_ori,'euclidean');
total_im_dist=sum(im_dist(:));

total_roi=im_dist.*im_reg;
total_roi=sum(total_roi(:));
total_im_ori=sum(im_ori(:));
total_im_reg=sum(im_reg(:));

match_percentage=(total_roi/total_im_dist)*100;

Tp=0;
for r=1:1:selReg
im_Tp=barr{r}.*im_ori;
Tp=Tp+double(sum(im_Tp(:))>5);
end
Tp=min(Tp,NoOfAneurysm);
Fp=selReg-Tp;
Fn=NoOfAneurysm-Tp;
Tn=nReg-Tp-Fp-Fn;
sensitivity=Tp/(Tp+Fn);
specificity=Tn/(Tn+Fp);

if(Tn==0 & (Tn+Fp)==0)specificity=0;
end
if(Tp==0 & (Tp+Fn)==0)sensitivity=0;
end