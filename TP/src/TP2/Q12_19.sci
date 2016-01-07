clear;

// *********************************************************************************************
// 1_competition.sce
//
// Simulation de populations en competition
//

//Les paramètres du modèle 
//taux d'acroissement
k1=0.1
k2=1
//Capacité biotique
M=3
//Coeficient d'interaction interspecifique
alpha=1
beta=1

// *********************************************************************************************
// définition de la fonction vectorielle 
function Pprim=f(t,P)
  P1=P(1); P2=P(2);
  P1prim=k1*P1*(M-P1)/M - alpha * P1 * P2 ;
  P2prim=-k2*P2 + beta * P1 * P2 ;
  Pprim=[P1prim;P2prim];
endfunction

// tracé du champ de vecteurs
P1min=0; P1max=5; dP1=2; P2min=0; P2max=5; dP2=2;
xr=P1min:dP1:P1max; yr=P2min:dP2:P2max;
xset("window",0)
clf()
fchamp(f,0,xr,yr);
xtitle('Evolution de populations en compétition','Espece 1','Espece 2')

// tracé des trajectoires
t0=0; tf=200; dt=0.05;
T=t0:dt:tf;
fini=%f;
while(~fini)
  //acquisition du nouveau point
  [c_i,x0,y0]=xclick();
  if ~(x0>=P1min & x0<=P1max & y0>=P2min & y0<=P2max) then
    //le point est en dehors du cadre : on arrête l'itération
    fini=%t;
  else
    //le point est pris en compte : calcul de la solution
    sol=ode([x0;y0],t0,T,f);
    //tracé de la courbe paramétrée
    plot2d(sol(1,:),sol(2,:),2,'000');
  end
end

