clear;
clc;
syms t;
pt=[4 2];
pt2=[6 7];
MatricePunti=[pt;pt2];
figure(1);
bezierPlot(MatricePunti,t);
pt3=[10, 5];
figure(2);
MatricePunti=[MatricePunti;pt3];
bezierPlot(MatricePunti,t);
figure(3)
pt4=[11 10];
pt5=[15 7];
MatricePunti=[MatricePunti;pt4];
bezierPlot(MatricePunti,t);
figure(4);
MatricePunti=[MatricePunti;pt5];
bezierPlot(MatricePunti,t);
pt=[4 2 7];
pt2=[6 7 10];
pt3=[8 9 11];
MatricePunti=[pt;pt2;pt3];
figure(5);
[curva,err]=bezierPlot(MatricePunti,t);








                        
