syms t;
pt1=[ 2 4];
pt2=[4 10];
pt3=[7 10];
pt4=[10 6];
matricePunti=[pt1;pt2;pt3;pt4];
figure(1);
[curva,errore]=bezierPlot(matricePunti(1:2,1:2),t);
[curva2,errore]=bezierPlot(matricePunti(2:3,1:2),t);
[curva3,errore]=bezierPlot(matricePunti(3:4,1:2),t);
t=0.5; %curve per 0.5
matrice2=[subs(curva);subs(curva2);subs(curva3)];
syms t;
[curva4,errore]=bezierPlot(matrice2(1:2,1:2),t);
[curva5,errore]=bezierPlot(matrice2(2:3,1:2),t);
t=0.5; %curve per 0.5
matrice3=[subs(curva4);subs(curva5)];
syms t;
[curva6,errore]=bezierPlot(matrice3(1:2,1:2),t);
t=0.5;
vec=subs(curva6);
plot(vec(1),vec(2),"*");
syms t;
bezierPlot(matricePunti,t);



