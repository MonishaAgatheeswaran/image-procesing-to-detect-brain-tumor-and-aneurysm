function [selReg,data,s]=Detect(barr,nReg,k,C1,scale,display)

data=zeros(4,nReg);
logicAreaFail=false(1);logicCompFail=false(1);
areaMin=0;
selReg=nReg;
for peakno=1:1:nReg
    
    im=barr{peakno};
    %         imshow(im);
    %         title([filename,' peak = ',num2str(peakno)]);
    %         snapnow;
    imb=bwperim(im);
    peri=sum(imb(:));
    area=sum(im(:));
    comp=(2*pi*area)/(peri*peri);
    
    %         comp=round(comp*100)/100;
    if peakno==1;
        areaMin=floor(area/100)*100/k;
    end
    
    if area<areaMin
        logicAreaFail=true(1);
    end
    
    if comp<C1
    logicCompFail=true(1);
    end
%     if comp<C1%if area<=A1 && comp<C1
%         logicCompFail=true(1);
%     elseif  comp<C2%elseif  area>A1 && area<=A2 && comp<C2
%         logicCompFail=true(1);
%     elseif  comp<C3%elseif  area>A2 && area<=A3 && comp<C3
%         logicCompFail=true(1);
%     elseif  comp<C4%elseif  area>A3 && comp<C4
%         logicCompFail=true(1);
%     end
    
    if (logicAreaFail||logicCompFail) && selReg==nReg
        selReg=peakno-1;
    end
        D=2*sqrt(area/pi)*scale;
    if selReg>peakno
        if D>=50
            s=['Aneurysm area = ',num2str(area),'.....Giant Aneurysm'];
        elseif D>=25
            s=['Aneurysm area = ',num2str(area),'.....Giant Aneurysm'];
        elseif D>=15
            s=['Aneurysm area = ',num2str(area),'.....Large Aneurysm'];
        elseif D>=7
            s=['Aneurysm area = ',num2str(area),'.....Medium Aneurysm'];
        else
            s=['Aneurysm area = ',num2str(area),'.....Small Aneurysm'];
        end
        if(display)
            disp(s);
        end
    end
    data(:,peakno)=[peakno area comp D s];
    %t=table(peakno,area,comp,D);
end
s=['Peak_No  ' 'Area  ' 'Compactness  ' 'Diameter  '];
data=data';





