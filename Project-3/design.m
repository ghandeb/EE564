q=4;
alpha=15/180*pi;
pitch=1;
for h=1:7
kd(:,h)=(sin(q*alpha*0.5*h))/(q*sin(alpha*0.5*h));
kp(:,h)=sin(pitch*pi*0.5*h);
kw(:,h)=kp(:,h)*kd(:,h);
end