%% TRANSFORMER DESIGN
% EE564 Project#1 Q2
% by G. Hande Bayazit
%% Parameters

B_op=0.2; %T
mu=1.83/800;
f=100e3; %Hz
P1= 15; %W
V1=207; %V
V2=15; %V
I1=P1/V1; %A
J=4; %A/mm^2
a_cable=I1/J; %mm^2
fprintf('Cable area should be around %d mm^2.\n',a_cable);

% This value is close to AWG34 size.

a_cable=0.0201; %mm^2
dia_cable=0.1601; %mm
res_cable=856; %Ohms/km

%% Sizing

% Recalling the equation: V_ind=2*pi/sqrt(2)*f*B*A*N
% A*N is constant and they are dependent on each other. Optimum values of
% them will be found with an optimization parameter "k".

ff=0.5; %fill factor
dens_ferrite=7650; %kg/m^3
dens_copper=8940; %kg/m^3
core_loss_dens=380; %W/m^3
coef=1/4800;%m^3/kg;
core_loss_dens=core_loss_dens*coef; %kW/kg
price_steel=3; %$/kg
price_copper=7; %$/kg

i=1;
for k=1:10
    
    N1(:,i)=7*k;
    N2(:,i)=1*k;
    A(:,i)=V2*sqrt(2)/(2*pi*f*B_op*N1(:,i)); %m^2
    
    % Window area
    
    x1(:,i)=dia_cable*7/ff/1000; %m
    x2(:,i)=dia_cable*k/ff/1000; %m
    x3(:,i)=ceil(sqrt(A(:,i)*10000))/100; %m
    
    w1(:,i)=x1(:,i);
    w2(:,i)=2*x2(:,i)+0.03;
    
%     fprintf('Window area is %d m^2.\n',w1(:,i)*w2(:,i));
    
    % Overall dimensions
    
    e1(:,i)=w1(:,i)+2*x3(:,i);
    e2(:,i)=w2(:,i)+2*x3(:,i);
    
%     fprintf('Dimensions of the transformer is %d x %d x %d m.\n',e1(:,i),e2(:,i),x3(:,i));
    
    vol(:,i)=(e1(:,i)*e2(:,i)-w1(:,i)*w2(:,i))*x3(:,i);
    
    m_steel(:,i)=dens_ferrite*vol(:,i);
    
%     fprintf('Steel mass is %d kg.\n',m_steel(:,i));
    
    core_loss(:,i)=core_loss_dens*m_steel(:,i);
    
%     fprintf('Core loss is %d Watts.\n',core_loss(:,i));
    
    % Cable length
    
    mean_length(:,i)=2*(x2(:,i)/2+x3(:,i))+pi*x3(:,i)*sqrt(2); %m
    l1(:,i)=mean_length(:,i)*N1(:,i);
    l2(:,i)=mean_length(:,i)*N2(:,i);
    
    r1(:,i)=l1(:,i)*res_cable/1000; %Ohms
    r2(:,i)=r1(:,i)*(N2(:,i)/N1(:,i))^2; %Ohms
    
    vol_copper(:,i)=2*l1(:,i)*a_cable/1000000; %m^3
    m_copper(:,i)=vol_copper(:,i)*dens_copper; %kg
    
%     fprintf('Copper mass is %d kg.\n',m_copper(:,i));
    
    copper_loss(:,i)=I1^2*r1(:,i)*2; %W
    
%     fprintf('Copper loss is %d Watts.\n',copper_loss(:,i));
    
    % Inductances
    
    % Assuming L1 and L2 are 0.02 pu;
    
    ind1=V1^2/(P1*2*pi*f)*0.02; %H
    ind2=ind1*(N2/N1)^2; %H
    
    Leff(:,i)=2*(w1(:,i)+w2(:,i)+2*x3(:,i)); %m
    
    ind_m(:,i)=N1(:,i).^2*mu*A(:,i)/Leff(:,i); %H
    
    % Efficiency
    
    eff(:,i)=P1/(P1+core_loss(:,i)+copper_loss(:,i))*100; %percent
    
    % Cost
    
    cost(:,i)=price_copper*m_copper(:,i)+price_steel*m_steel(:,i); %$ 
    
    %Unit price of electricity: 0.4482 TL = 0.1125 USD
    
    lost_power(:,i)=P1*(100-eff(:,i))/1000; %kW
    
    lost_energy(:,i)=lost_power(:,i)*24*365*20*0.1125; %$
    
    cost_actual(:,i)=cost(:,i)+lost_energy(:,i); %$
    
    
    i=i+1;
end

%% Conclusion

% Considering the optimizaton results, optimum case for the design seems to
% be i=6, k=10. Transformer parameters are as follows:

k=14;
i=10;

    N1(:,i)=7*k;
    N2(:,i)=1*k;
    A(:,i)=V2*sqrt(2)/(2*pi*f*B_op*N1(:,i)); %m^2
    
    
    
    % Window area
    
    x1(:,i)=dia_cable*23/ff/1000; %m
    x2(:,i)=dia_cable*3*k/ff/1000; %m
    x3(:,i)=ceil(sqrt(A(:,i)*10000))/100; %m
    
    w1(:,i)=x1(:,i);
    w2(:,i)=2*x2(:,i)+0.03;
   
    
    % Overall dimensions
    
    e1(:,i)=w1(:,i)+2*x3(:,i);
    e2(:,i)=w2(:,i)+2*x3(:,i);
    
    vol(:,i)=(e1(:,i)*e2(:,i)-w1(:,i)*w2(:,i))*x3(:,i);
    
    m_steel(:,i)=dens_ferrite*vol(:,i);
    
    core_loss(:,i)=core_loss_dens*m_steel(:,i);
    
    % Cable length
    
    mean_length(:,i)=2*(x2(:,i)/2+x3(:,i))+pi*x3(:,i)*sqrt(2); %m
    l1(:,i)=mean_length(:,i)*N1(:,i);
    l2(:,i)=mean_length(:,i)*N2(:,i);
    
    r1(:,i)=l1(:,i)*res_cable/1000; %Ohms
    r2(:,i)=r1(:,i)*(N2(:,i)/N1(:,i))^2; %Ohms
     
    vol_copper(:,i)=2*l1(:,i)*a_cable/1000000; %m^3
    m_copper(:,i)=vol_copper(:,i)*dens_copper; %kg
    
    copper_loss(:,i)=I1^2*r1(:,i)*2; %W
    
    % Inductances
    
    % Assuming L1 and L2 are 0.02 pu;
    
    ind1=V1^2/(P1*2*pi*f)*0.02; %H
    ind2=ind1*(N2/N1)^2; %H
    
    Leff(:,i)=2*(w1(:,i)+w2(:,i)+2*x3(:,i)); %m
    
    ind_m(:,i)=N1(:,i).^2*mu*A(:,i)/Leff(:,i); %H
    
    % Efficiency
    
    eff(:,i)=P1/(P1+core_loss(:,i)+copper_loss(:,i))*100; %percent
    
    % Cost
    
    cost(:,i)=price_copper*m_copper(:,i)+price_steel*m_steel(:,i); %$ 
    
      
    %Unit price of electricity: 0.4482 TL = 0.1125 USD
    
    lost_power(:,i)=P1*(100-eff(:,i))/1000; %kW
    
    lost_energy(:,i)=lost_power(:,i)*24*365*20*0.1125; %$
    
    cost_actual(:,i)=cost(:,i)+lost_energy(:,i); %$
    
    fprintf('Turns ratio is %d : %d. \n',N1(:,i),N2(:,i));
    
    fprintf('Window area is %d m^2.\n',w1(:,i)*w2(:,i));
    
    fprintf('Dimensions of the transformer is %d x %d x %d m.\n',e1(:,i),e2(:,i),x3(:,i));
    
    fprintf('Steel mass is %d kg.\n',m_steel(:,i));
    
    fprintf('Core loss is %d Watts.\n',core_loss(:,i));
    
    fprintf('R1= %d Ohms, R2= %d Ohms. \n',r1(:,i),r2(:,i));
    
    fprintf('Copper mass is %d kg.\n',m_copper(:,i));
    
    fprintf('Copper loss is %d Watts.\n',copper_loss(:,i));
    
    fprintf('L1= %d H, L2= %d H, Lm= %d H. \n',ind1,ind2,ind_m(:,i));
    
    fprintf('Efficiency is %d percent. \n',eff(:,i));
    
    fprintf('Material cost is %d USD. Lost money in 20 years is %d USD. \n',cost(:,i),cost_actual(:,i));

