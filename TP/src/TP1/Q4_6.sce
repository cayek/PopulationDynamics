// données expérimentales
levureK=[ 9,10,23,25.5,42,45.5,66,87,111,135 ; 1.27,1,1.7,2.33,2.73,4.56,4.87,5.67,5.8,5.83];

// données expérimentales
levureC=[ 0 1.5 9 10 18 18 23 25.5 27 34 38 42 45.5 47 ; 0.37 1.63 6.2 8.87 10.66 10.97 12.5 12.6 12.9 13.27 12.77 12.87 12.9 12.7];

//L'indice de la dernière mesure qui appartient encore à la phase dite de temps court
mesureTempsCourtMax=4;
levure = levureC;
// La régression linéaire
[k,lnPO] = reglin(levure(1,1:mesureTempsCourtMax),log(levure(2,1:mesureTempsCourtMax)));

//On trace la droite
plot2d(levure(1,1:mesureTempsCourtMax),log(levure(2,1:mesureTempsCourtMax)),style=[-2]);
plot2d(levure(1,1:mesureTempsCourtMax),levure(1,1:mesureTempsCourtMax) * k + lnPO ,style=[4]);

// On calcule PO à partir lnPO
PO=exp(lnPO);

//On affiche k et PO à l'écran
disp(k);
disp(PO);
