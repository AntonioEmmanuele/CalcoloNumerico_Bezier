function [curva] = decasteljau_raw(matrice,vSimb,numeroColonna)
%DECASTELJAU_RAW funzione ricorsiva che va ad implementare l'algoritmo di
%de casteljau.
%Input: Matrice su cui lavorare
%vSimb: Variabile Simbolica
%numeroColonna: Numero di colonna su cui andare a lavorare
[n,m]=size(matrice);
if m==numeroColonna %se siamo arrivati all'ultimo elemento
    curva=matrice(1,numeroColonna); %termina
else
    %Primo passo nel caso siano 4 punti di controllo: 4-1=3, secondo 4-2=2 ecc.., va bene perchè
    %in questo modo evito errore con l'indice quando i raggiunge n(con
    %i+1).
    for i =1:(n-numeroColonna)
        %Per ogni coppia aggiorna colonna successiva
        matrice(i,numeroColonna+1)=simplify((1-vSimb)*matrice(i,numeroColonna)+vSimb*matrice(i+1,numeroColonna));
    end
    curva=decasteljau_raw(matrice,vSimb,numeroColonna+1);%Richiama infine algoritmo
end
end

