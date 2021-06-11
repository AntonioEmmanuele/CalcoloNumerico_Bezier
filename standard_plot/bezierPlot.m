function [curva,erroreDimensioni] = bezierPlot(matricePuntiControllo,variabileSimbolica)
%Per andare a rappresentare in matlab una curva di Bèzier abbiamo bisogno
%di una matrice dei punti di controllo ed una matrice di polinomi di
%Bernstein.
%La matrice dei punti di controllo sarà una matrice nxm avente come n righe
%gli N+1 punti di controllo e come colonne le coordinate del punto di
%controllo.
%Se si vuole andare ad esempio a fornire una rappresentazione in due
%dimensioni di una curva di Bernstein di grado uno con due punti di
%controllo e moltiplicarlo ad un vettore riga avente come j-esima colonna la 
%j-esima funzione di base 
% |(1-t)(t)|   |P0x P0y| = |(1-t)*P0x +t*P1x , (1-t)P0y +t*P1y|
%              |P1x P1y|
%Ossia si ottiene alla fine un vettore riga avente come j-esima colonna
%l'iesima componente del vettore parametrizzato in t che fornisce la curva
%di Bézier (Si noti che ho due punti quindi entrambe le componenti sono dei
%polinomi di Bérnstein di grado 1).

%Per come si è detto essere composta la matrice dunque con size si ottiene 
%il numero di punti di controllo come numero
%righe e come  colonne il numero di dimensioni in cui vogliamo rappresentarlo
[numeroPuntiControllo,dimensioni]=size(matricePuntiControllo); 
if dimensioni<2 | dimensioni >3 %Controlla dimensioni
    erroreDimensioni=true;
else
    %La funzione bernstein matrix prende in ingresso il grado del polinomio
    %ossia il numero di punti di controllo -1 e la variabile simbolica con cui
    %ritornare il vettore riga.
    vettorePolinomi=bernsteinMatrix(numeroPuntiControllo-1,variabileSimbolica);
    curva=simplify(vettorePolinomi*matricePuntiControllo);
    if dimensioni==2 %Se mi trovo nel caso in cui le dimensioni siano 2
        for n= 1:numeroPuntiControllo %Per ogni punto di controllo
            plot(matricePuntiControllo(n,1),matricePuntiControllo(n,2),"*");%Stampalo
            hold on;
            if n<=numeroPuntiControllo-1 %altrimenti va in numeroPunti+1
            %Dati due punti (x1,y1) ed (x2,y2) vado a stampare il segmento
            %congiungente i due punti con :
            %plot([x1,x2],[y1,y2]); dando ossia prima il vettore delle
            %ascisse e poi qurello delle ordinate
                plot([matricePuntiControllo(n,1) matricePuntiControllo(n+1,1)],[matricePuntiControllo(n,2) matricePuntiControllo(n+1,2)]);  
                hold on;
            end
        end
        fplot(curva(1),curva(2),[0,1]);%stampa la curva facendo variare t tra 0 ed 1.
    elseif dimensioni==3
        for n= 1:numeroPuntiControllo %Per ogni punto di controllo
            plot3(matricePuntiControllo(n,1),matricePuntiControllo(n,2),matricePuntiControllo(n,3),"*");%Stampalo
            hold on;
            if n<= numeroPuntiControllo-1
                plot3([matricePuntiControllo(n,1) matricePuntiControllo(n+1,1)],[matricePuntiControllo(n,2) matricePuntiControllo(n+1,2)],[matricePuntiControllo(n,3) matricePuntiControllo(n+1,3)]);
                hold on;
            end
        end
        fplot3(curva(1),curva(2),curva(3),[0,1]);%stampa la curva facendo variare t tra 0 ed 1.
    end
    erroreDimensioni=false;
end
end

