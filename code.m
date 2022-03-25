
Ra=2.58; %Résistance de l'induit
La= 0.028; %Inductance de l'induit
j= 0.02215; %Inertie du rotor
f = 0.002953; %Cœfficient de frottement
K=1.0113;
A=[-Ra/La 0 -K/La;0 0 1;K/j 0 -f/j]
B=[1/La;0;0]
Bd=[0;0;-1/j];
eig(A) %mat A stable

comm=[B A*B A*A*B];
rank(comm) %commandable
BF_Poles=[-40 -46.0517-48.2939i -46.0517+48.2939i];
K1 = place(A, B, BF_Poles) %les k qui donnent les poles désirés
    
 h1 = tf(1630.6,[1 92.26 1660.12])
 hd1 =c2d(h1,0.1, 'zho')   
    
    step(h1,'--',hd1,'-')
    m1=[1           0       0       0;
        -0.087      1       0.85    0;
        9.84e-5     -0.087  0.46    0.85;
        0           9.84e-5 0       0.46]
    
    pole1=[1;-0.124;0.015;0];
    rst=inv(m1)*pole1
    