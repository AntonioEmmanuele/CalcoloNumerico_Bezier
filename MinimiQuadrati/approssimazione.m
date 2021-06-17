function [polinomio,coefficienti,errore_righe] = approssimazione_pol(x,y,grado)
%approsimazione_pol ritorna un polinomio approssimante ed i suoi coefficienti.
%Input:
%x:Intervallo delle x
%y:valori della funzione da approssimare
%grado:grado del polinomio interpolante da usare.
[n,m]=size(x);
[n1,m1]=size(y);
%controlla gli ingressi
if n~=1 | n1 ~=1  %Deve essere un unico vettore riga.
    errore_righe=1;
    polinomio=zeros(1,1);
    coefficienti=zeros(1,1);
elseif m~=m1 %Non sono uguali in dimensioni
    errore_colonne=1;
    polinomio=zeros(1,1);
    coefficienti=zeros(1,1);
else
    coefficienti=polyfit(x,y,grado);
    polinomio=polyval(coefficienti,x);
end
end

