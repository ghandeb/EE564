clc;
close all;
clear all;
a=0.5;
b=-1;
c=0.5;
mmf1=[-a a c -c -b b a -a -c c b -b -a a c -c -b b a -a -c c b -b];
mmf2=[b a -a -c c b -b -a a c -c -b b a -a -c c b -b -a a c -c -b];
mmf3=zeros(1,24);
for k=1:24
   mmf3(1,k)=mmf1(1,k)+mmf2(1,k);
end
for k=1:24

    x(1)=1;
    x(k+1)=x(k)+mmf3(1,k); 

end
slot=0:1:24;

figure;
stairs(slot,x,'Linewidth',2);
xlabel('Slots');
xlim([0 25]);
ylabel('MMF (*n A.turns)')
grid on;
title('MMF Diagram with Excitations a=0.5 b=-1 c=0.5');
