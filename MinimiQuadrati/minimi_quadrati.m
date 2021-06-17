clear;
clc;
x=0:0.1:2*pi; %Definisco intervallo
funzione=sin(2*x);%retta
figure(1);
plot(x,funzione);
funzione_perturbata=(1/5)*rand(size(x))+funzione; %introduco perturbazione tramite rand()
[polinomio_approssimato,coefficienti]=approssimazione(x,funzione_perturbata,7); %vado ad approssimare
figure(2);
plot(x,funzione_perturbata);
figure(3);
plot(x,polinomio_approssimato);
polinomio_interpolato=interp1(x,funzione_perturbata,x);
figure(4);
plot(x,polinomio_interpolato);








