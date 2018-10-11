clear all
clc
for r=1:1:5
path=['CA' num2str(r) '.dcm'];
p=dicomread(path);
p=p(:,:,1);
imwrite(sauvola(p),['.\htmlT\CA' num2str(r) 'ThresholdSauvola.png']);
imwrite(im2bw(p,graythresh(p)),['.\htmlT\CA' num2str(r) 'ThresholdOtsu.png']);
imwrite(~AutoThreshold(path),['.\htmlT\CA' num2str(r) 'ThresholdAT.png']);
end

