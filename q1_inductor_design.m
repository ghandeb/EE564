%% Parameters

in_dia= 19; %mm
in_rad=in_dia/2*1e-3;
out_dia= 38.1; %mm
out_rad=out_dia/2*1e-3;
ht= 6.11; %mm

Leff=82.9; %mm
Aeff=56.1; %mm^2 

N=15 ;% turns
I=0.3; % A

mu_r=5000;
mu_0=4*pi*1e-7;

AL=4400; %nH/turns^2

%% Part A

% 
% # 1

reluctance=Leff*1e-3/(Aeff*1e-6*mu_r*mu_0);

L=N^2/reluctance; %H

fprintf('Inductance assuming homogeneous distribution is %d H. \n', L);

% # 2
% In this part, H.dl should be integrated over over the cross-section of
% coaxial circles with radii from in_dia/2 to out_dia/2.
% H*2*pi*(out_rad-in_rad)=N.I

index=linspace(in_rad,out_rad,500);
for i=1:numel(index)

    H(:,i)=N*I/(2*pi*index(:,i));
    B(:,i)=mu_0*mu_r*H(:,i); %T
    Phi(:,i)=B(:,i)*ht*1e-3*(out_rad-in_rad)/500; %Wb
end

tot_phi=0;

for k=1:500
    
   tot_phi=tot_phi+Phi(:,i);
    
end

L_2=tot_phi*N/I;

fprintf('Inductance assuming non-homogeneous distribution is %d H. \n', L_2);
% 
% # 3_1
%
I_2=I*1.5;

H_2=N*I_2/(Leff*1e-3);

B_2=interp1(B_nl,H_nl,H_2);

phi_2=Aeff*1e-6*B_2;

L_3=N*phi_2/I_2;

fprintf('Inductance assuming homogeneous distribution & non-homogeneous material is %d H. \n', L_3);

% 
% # 3_2
%


index=linspace(in_rad,out_rad,500);
for i=1:numel(index)

    H_3(:,i)=N*I_2/(2*pi*index(:,i));
    B_3(:,i)=interp1(B_nl,H_nl,H_3(:,i));
    Phi(:,i)=B_3(:,i)*ht*1e-3*(out_rad-in_rad)/500; %Wb
end

tot_phi=0;

for k=1:500
    
   tot_phi=tot_phi+Phi(:,i);
    
end

L_4=tot_phi*N/I_2;

fprintf('Inductance assuming non-homogeneous distribution & non-homogeneous material is %d H. \n', L_4);

%
% # 4
%

rel_gap=2e-3/(mu_0*Aeff*1e-6);
rel_core=(Leff-2)*1e-3/(Aeff*1e-6*mu_r*mu_0);
rel_tot=rel_gap+rel_core;

L_5=N^2/rel_tot;

fprintf('Inductance of the gapped core assuming homogeneous distribution is %d H. \n', L_5);

%
% # 5
%








