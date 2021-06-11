function [curva,errorePunti] = decasteljau(puntiRappresentativi,variabileSimbolica)
%Funzione di interfaccia per algoritmo, viene usata per disaccoppiare
%funzione chiamata da utente da implementazionve vera e propria
%dell'algoritmo.
%input: puntiRappresentativi=> Vettore di punti rappresentativi.
%I punti rappresentativi saranno almeno in due dimensioni quindi sarà una
%matrice di dimensioni: NumeroPunti X Dimensionalità
[numeroPunti,dimensioni]=size(puntiRappresentativi);
if dimensioni <2 | dimensioni >3 %Se le dimensioni non sono valide termina l'esecuzione.
    errorePunti=true;
    curva=0;
else %Altrimenti
    errorePunti=false;
    curva=variabileSimbolica*zeros(1,dimensioni); %Moltiplicazione necessaria, altrimente non lo vede come sym
    for n =1:dimensioni %per ogni colonna,ossia dimensione
        matrice=variabileSimbolica*zeros(numeroPunti,numeroPunti); %Inizializza la matrice usata dall'algo
        matrice(:,1)=puntiRappresentativi(:,n); %Inizializza la prima colonna
        curva(n)=decasteljau_raw(matrice,variabileSimbolica,1);
        disp("La curva è");
        disp(curva);
    end
 
end
end

