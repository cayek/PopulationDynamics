// données expérimentales
levureK=[ 9,10,23,25.5,42,45.5,66,87,111,135 ; 1.27,1,1.7,2.33,2.73,4.56,4.87,5.67,5.8,5.83];

//Ouvre une nouvelle fenêtre graphique
clf();
// graphiques
// affichage des points (symbole croix) 
plot2d(levureK(1,:),levureK(2,:),style=[-2]);

// Paramètre du modèle
P0 = 0.5
k = 0.05
M = 6
// définition de la fonction P
function res=P(t)
  res = M .* 1 ./ ( 1 + (M./P0 - 1)*exp(-k.*t));
endfunction


// définition du vecteur t, les temps pour lesquel on veut calculer la fonction
t0=0;
tmax=140;
dt=0.1;
t=[t0:dt:tmax];
// plot
plot2d(t, P(t), style=[5]);



x0 = [0.5;1;5.9];//ICI mettre une estimation grossiere des paramètres [PO,r,M]
param_opti=trouve_param_optimaux(levureK(1,:)',levureK(2,:)',x0)
