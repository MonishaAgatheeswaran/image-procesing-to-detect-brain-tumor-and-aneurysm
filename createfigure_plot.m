clear all
close all
clc
%%
load('data_comparison','k_comp')
k_sen=[k_comp{1,1}(:,1) k_comp{1,2}(:,1) k_comp{1,3}(:,1) ...
    k_comp{1,4}(:,1) k_comp{1,5}(:,1)]; 
k_sel=[k_comp{1,1}(:,2) k_comp{1,2}(:,2) k_comp{1,3}(:,2) ...
    k_comp{1,4}(:,2) k_comp{1,5}(:,2)]; 
k_acc=[k_comp{1,1}(:,3) k_comp{1,2}(:,3) k_comp{1,3}(:,3) ...
    k_comp{1,4}(:,3) k_comp{1,5}(:,3)]; 

createfigure(k_sen,'Parameter $k$','Sensitivity',[0:10:100],...
    [0:0.1:1],3,1,'East','k_sen')
createfigure(k_sel,'Parameter $k$','Specificity',[0:10:100],...
    [0:0.1:1],3,1,'East','k_sel')
createfigure(k_acc,'Parameter $k$','Accuracy (\%) ',[0:10:100],...
    [0:5:100],3,1,'East','k_acc')

%%
load('data_comparison','C_comp')
C_sen=[C_comp{1,1}(:,1) C_comp{1,2}(:,1) C_comp{1,3}(:,1) ...
    C_comp{1,4}(:,1) C_comp{1,5}(:,1)]; 
C_sel=[C_comp{1,1}(:,2) C_comp{1,2}(:,2) C_comp{1,3}(:,2) ...
    C_comp{1,4}(:,2) C_comp{1,5}(:,2)]; 
C_acc=[C_comp{1,1}(:,3) C_comp{1,2}(:,3) C_comp{1,3}(:,3) ...
    C_comp{1,4}(:,3) C_comp{1,5}(:,3)]; 

createfigure(C_sen,'Parameter $C$','Sensitivity',[0:10:100],...
    [0:0.1:1],0.55,100,'East','C_sen')
createfigure(C_sel,'Parameter $C$','Specificity',[0:10:100],...
    [0:0.1:1],0.55,100,'East','C_sel')
createfigure(C_acc,'Parameter $C$','Accuracy (\%) ',[0:10:100],...
    [0:10:100],0.55,100,'East','C_acc')
%%
load('data_comparison','peak_comp')
peak_sen=[peak_comp{1,1}(:,1) peak_comp{1,2}(:,1) peak_comp{1,3}(:,1) ...
    peak_comp{1,4}(:,1) peak_comp{1,5}(:,1)]; 
peak_sel=[peak_comp{1,1}(:,2) peak_comp{1,2}(:,2) peak_comp{1,3}(:,2) ...
    peak_comp{1,4}(:,2) peak_comp{1,5}(:,2)]; 
peak_acc=[peak_comp{1,1}(:,3) peak_comp{1,2}(:,3) peak_comp{1,3}(:,3) ...
    peak_comp{1,4}(:,3) peak_comp{1,5}(:,3)]; 

createfigure(peak_sen,'Parameter $Peak\; Depth$','Sensitivity',[0:2:20],...
    [0:0.1:1],3,1,'SouthWest','Peak_sen')
createfigure(peak_sel,'Parameter $Peak\; Depth$','Specificity',[0:2:20],...
    [0:0.1:1],3,1,'SouthWest','Peak_sel')
createfigure(peak_acc,'Parameter $Peak\; Depth$','Accuracy (\%) ',[0:2:20],...
    [0:10:100],3,1,'SouthWest','Peak_acc')
%%
load('data_comparison','NeighbourhoodDepth_comp')
NeighbourhoodDepth_sen=[NeighbourhoodDepth_comp{1,1}(:,1) NeighbourhoodDepth_comp{1,2}(:,1) NeighbourhoodDepth_comp{1,3}(:,1) ...
    NeighbourhoodDepth_comp{1,4}(:,1) NeighbourhoodDepth_comp{1,5}(:,1)]; 
NeighbourhoodDepth_sel=[NeighbourhoodDepth_comp{1,1}(:,2) NeighbourhoodDepth_comp{1,2}(:,2) NeighbourhoodDepth_comp{1,3}(:,2) ...
    NeighbourhoodDepth_comp{1,4}(:,2) NeighbourhoodDepth_comp{1,5}(:,2)]; 
NeighbourhoodDepth_acc=[NeighbourhoodDepth_comp{1,1}(:,3) NeighbourhoodDepth_comp{1,2}(:,3) NeighbourhoodDepth_comp{1,3}(:,3) ...
    NeighbourhoodDepth_comp{1,4}(:,3) NeighbourhoodDepth_comp{1,5}(:,3)]; 

createfigure(NeighbourhoodDepth_sen,'Parameter $Neighborhood\; Depth$','Sensitivity',[0:1:10],...
    [0:0.1:1],1,1,'SouthWest','ND_sen')
createfigure(NeighbourhoodDepth_sel,'Parameter $Neighborhood\; Depth$','Specificity',[0:1:15],...
    [0:0.1:1],1,1,'SouthWest','ND_sel')
createfigure(NeighbourhoodDepth_acc,'Parameter $Neighborhood\; Depth$','Accuracy (\%) ',[0:1:15],...
    [0:10:100],1,1,'SouthWest','ND_acc')
%%
load('data_comparison','HH_comp')
HH_sen=[HH_comp{1,1}(:,1) HH_comp{1,2}(:,1) HH_comp{1,3}(:,1) ...
    HH_comp{1,4}(:,1) HH_comp{1,5}(:,1)]; 
HH_sel=[HH_comp{1,1}(:,2) HH_comp{1,2}(:,2) HH_comp{1,3}(:,2) ...
    HH_comp{1,4}(:,2) HH_comp{1,5}(:,2)]; 
HH_acc=[HH_comp{1,1}(:,3) HH_comp{1,2}(:,3) HH_comp{1,3}(:,3) ...
    HH_comp{1,4}(:,3) HH_comp{1,5}(:,3)]; 

createfigure(HH_sen,'Parameter $Hierarchy\; Height$','Sensitivity',[0:5:50],...
    [0:0.1:1],15,1,'East','HH_sen')
createfigure(HH_sel,'Parameter $Hierarchy\; Height$','Specificity',[0:5:50],...
    [0:0.1:1],15,1,'East','HH_sel')
createfigure(HH_acc,'Parameter $Hierarchy\; Height$','Accuracy (\%) ',[0:5:50],...
    [0:10:100],15,1,'East','HH_acc')

%%
load('data_comparison','T_sen')
load('data_comparison','T_sel')
load('data_comparison','T_acc')
AutoThres=[80 71 48 73 114];
OtsuThres=[106 88 80 96 91];

createfigureThres(T_sen(:,1),AutoThres(1),OtsuThres(1),'Sensitivity','T1_sen')
createfigureThres(T_sel(:,1),AutoThres(1),OtsuThres(1),'Specificity','T1_sel')
createfigureThres(T_acc(:,1),AutoThres(1),OtsuThres(1),'Accuracy','T1_acc')

createfigureThres(T_sen(:,2),AutoThres(2),OtsuThres(2),'Sensitivity','T2_sen')
createfigureThres(T_sel(:,2),AutoThres(2),OtsuThres(2),'Specificity','T2_sel')
createfigureThres(T_acc(:,2),AutoThres(2),OtsuThres(2),'Accuracy','T2_acc')

createfigureThres(T_sen(:,3),AutoThres(3),OtsuThres(3),'Sensitivity','T3_sen')
createfigureThres(T_sel(:,3),AutoThres(3),OtsuThres(3),'Specificity','T3_sel')
createfigureThres(T_acc(:,3),AutoThres(3),OtsuThres(3),'Accuracy','T3_acc')

createfigureThres(T_sen(:,4),AutoThres(4),OtsuThres(4),'Sensitivity','T4_sen')
createfigureThres(abs(T_sel(:,4)),AutoThres(4),OtsuThres(4),'Specificity','T4_sel')
createfigureThres(T_acc(:,4),AutoThres(4),OtsuThres(4),'Accuracy','T4_acc')

createfigureThres(T_sen(:,5),AutoThres(5),OtsuThres(5),'Sensitivity','T5_sen')
createfigureThres(T_sel(:,5),AutoThres(5),OtsuThres(5),'Specificity','T5_sel')
createfigureThres(T_acc(:,5),AutoThres(5),OtsuThres(5),'Accuracy','T5_acc')

%%
load('data_comparison','k_comp')
k_sen=[k_comp{1,1}(:,1) k_comp{1,2}(:,1) k_comp{1,3}(:,1) ...
    k_comp{1,4}(:,1) k_comp{1,5}(:,1)]; 
k_sel=[k_comp{1,1}(:,2) k_comp{1,2}(:,2) k_comp{1,3}(:,2) ...
    k_comp{1,4}(:,2) k_comp{1,5}(:,2)]; 
k_acc=[k_comp{1,1}(:,3) k_comp{1,2}(:,3) k_comp{1,3}(:,3) ...
    k_comp{1,4}(:,3) k_comp{1,5}(:,3)]; 
load('data_comparison','C_comp')
C_sen=[C_comp{1,1}(:,1) C_comp{1,2}(:,1) C_comp{1,3}(:,1) ...
    C_comp{1,4}(:,1) C_comp{1,5}(:,1)]; 
C_sel=[C_comp{1,1}(:,2) C_comp{1,2}(:,2) C_comp{1,3}(:,2) ...
    C_comp{1,4}(:,2) C_comp{1,5}(:,2)]; 
C_acc=[C_comp{1,1}(:,3) C_comp{1,2}(:,3) C_comp{1,3}(:,3) ...
    C_comp{1,4}(:,3) C_comp{1,5}(:,3)]; 
load('data_comparison','peak_comp')
peak_sen=[peak_comp{1,1}(:,1) peak_comp{1,2}(:,1) peak_comp{1,3}(:,1) ...
    peak_comp{1,4}(:,1) peak_comp{1,5}(:,1)]; 
peak_sel=[peak_comp{1,1}(:,2) peak_comp{1,2}(:,2) peak_comp{1,3}(:,2) ...
    peak_comp{1,4}(:,2) peak_comp{1,5}(:,2)]; 
peak_acc=[peak_comp{1,1}(:,3) peak_comp{1,2}(:,3) peak_comp{1,3}(:,3) ...
    peak_comp{1,4}(:,3) peak_comp{1,5}(:,3)]; 
load('data_comparison','NeighbourhoodDepth_comp')
NeighbourhoodDepth_sen=[NeighbourhoodDepth_comp{1,1}(:,1) NeighbourhoodDepth_comp{1,2}(:,1) NeighbourhoodDepth_comp{1,3}(:,1) ...
    NeighbourhoodDepth_comp{1,4}(:,1) NeighbourhoodDepth_comp{1,5}(:,1)]; 
NeighbourhoodDepth_sel=[NeighbourhoodDepth_comp{1,1}(:,2) NeighbourhoodDepth_comp{1,2}(:,2) NeighbourhoodDepth_comp{1,3}(:,2) ...
    NeighbourhoodDepth_comp{1,4}(:,2) NeighbourhoodDepth_comp{1,5}(:,2)]; 
NeighbourhoodDepth_acc=[NeighbourhoodDepth_comp{1,1}(:,3) NeighbourhoodDepth_comp{1,2}(:,3) NeighbourhoodDepth_comp{1,3}(:,3) ...
    NeighbourhoodDepth_comp{1,4}(:,3) NeighbourhoodDepth_comp{1,5}(:,3)]; 
load('data_comparison','HH_comp')
HH_sen=[HH_comp{1,1}(:,1) HH_comp{1,2}(:,1) HH_comp{1,3}(:,1) ...
    HH_comp{1,4}(:,1) HH_comp{1,5}(:,1)]; 
HH_sel=[HH_comp{1,1}(:,2) HH_comp{1,2}(:,2) HH_comp{1,3}(:,2) ...
    HH_comp{1,4}(:,2) HH_comp{1,5}(:,2)]; 
HH_acc=[HH_comp{1,1}(:,3) HH_comp{1,2}(:,3) HH_comp{1,3}(:,3) ...
    HH_comp{1,4}(:,3) HH_comp{1,5}(:,3)]; 
load('data_comparison','T_sen')
load('data_comparison','T_sel')
load('data_comparison','T_acc')
AutoThres=[80 71 48 73 114];
OtsuThres=[106 88 80 96 91];



columnLabels = {'Value','Test Image 1', 'Test Image 2','Test Image 3', 'Test Image 4', 'Test Image 5'};

tmp=[(1:100)'/100 C_sen];pos=unique(sort([1 51:2:69 (1:10)*10]));
matrix2latex(tmp(pos,:), '.\table\MHCT_table_C_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:100)'/100 C_sel];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_C_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:100)'/100 C_acc];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_C_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');

tmp=[(1:100)' k_sen];pos=unique(sort([1:5 (1:10)*10]));
matrix2latex(tmp(pos,:), '.\table\MHCT_table_k_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:100)' k_sel];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_k_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:100)' k_acc];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_k_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');

matrix2latex([(1:20)' peak_sen], '.\table\MHCT_table_PeakDepth_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
matrix2latex([(1:20)' peak_sel], '.\table\MHCT_table_PeakDepth_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
matrix2latex([(1:20)' peak_acc], '.\table\MHCT_table_PeakDepth_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');

tmp=[(1:15)' NeighbourhoodDepth_sen];pos=unique(sort([1:15]));
matrix2latex(tmp(pos,:), '.\table\MHCT_table_NeighborhoodDepth_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:15)' NeighbourhoodDepth_sel];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_NeighborhoodDepth_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:15)' NeighbourhoodDepth_acc];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_NeighborhoodDepth_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');

tmp=[(1:50)' HH_sen];pos=unique(sort([1 (1:5)*10 (1:20)]));
matrix2latex(tmp(pos,:), '.\table\MHCT_table_HoughHierarchy_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:50)' HH_sel];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_HoughHierarchy_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:50)' HH_acc];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_HoughHierarchy_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');

tmp=[(1:255)' T_sen];pos=unique(sort([1 (1:25)*10 48 71 73 80 88 91 96 106 114 255]));
matrix2latex(tmp(pos,:), '.\table\MHCT_table_T_sen.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:255)' T_sel];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_T_sel.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
tmp=[(1:255)' T_acc];
matrix2latex(tmp(pos,:), '.\table\MHCT_table_T_acc.tex', 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f');
