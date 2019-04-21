clc
close all
clear all

%Parameters
l1=1; l2=1 ; m1=1 ; m2=1; g=9.8;

%Initial condition
tspan=14;
theta1=1.6;
theta1_prime=0;
theta2=2.2;
theta2_prime=0;
y0=[theta1 theta1_prime theta2 theta2_prime];
[t,y]=ode45(@pend, [0:0.001:tspan],y0);

l=length(y(:,1))
for i=1:l
%Position of mass 1 and mass 2 
x1(i)=l1*sin(y(i,1)); 
y1(i)=-l1*cos(y(i,1)); 
x2(i)=l1*sin(y(i,1))+l2*sin(y(i,3)); 
y2(i)=-l1*cos(y(i,1))-l2*cos(y(i,3)); 

vx1(i) = l1*cos(y(i,1))*y(i,2); 
vy1(i)= l1*sin(y(i,1))*y(i,2); 
vx2(i) = l1*cos(y(i,1))*y(i,2)+l2*cos(y(i,3))*(y(i,4)); 
vy2(i) = l1*sin(y(i,1))*y(i,2)+l2*sin(y(i,3))*(y(i,4)); 

T(i) = 0.5 * (m1) * ( vx1(i)*vx1(i) + vy1(i)*vy1(i) ) + 0.5 * (m2) * ( vx2(i)*vx2(i) + vy2(i)*vy2(i) ) + m1*g*y1(i) + m2*g*y2(i); 
end
%Plot
figure(1)
plot(x1,y1,'linewidth',2)
hold on
plot(x2,y2,'r','linewidth',2)
h=gca; 
get(h,'fontSize') 
set(h,'fontSize',14)
xlabel('X','fontSize',14);
ylabel('Y','fontSize',14);
title('Chaotic Double Pendulum','fontsize',14)
fh = figure(1);
set(fh, 'color', 'white'); 

figure(2)
plot(t,T);
ylabel('Energy');
xlabel('Time');
title('Energy vs time');

%Animation
%figure(3)
%h = animatedline('Marker','+');

%for j = 1:length(x2)
 %  addpoints(h,x2(j),y2(j)); 
  % drawnow
%end

