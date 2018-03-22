%% Parameters

in_dia= 19 %mm
out_dia= 38.1 %mm
ht= 6.11 %mm

Leff=82.9 %mm
Aeff=56.1 %mm^2 

AL=4400 %nH/turns^2

reluctance=1/(4400e-9);

mu_r=Leff/(Aeff*reluctance*pi*4e-7);
