clc;
clear all;
close all;

u0 = zeros(4,1);

v = 20;

for i = 5:5:90
    
theta = i;

u0(1) = 0; % x
u0(2) = 0; % y
u0(3) = v*cos(theta); % Vx
u0(4) = v*sin(theta); %Vy

[t,u] = ode45(@projectile_drag, [0:0.01:10], u0); % format - function, time interval, initial conditions

x_final = sqrt(u(:,1).*u(:,1)+u(:,2).*u(:,2));

figure(i/5)
plot(t,u(:,1));
title(string(theta));
%{
subplot(1,2,1)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
title(string(theta))
legend("X axis", "Y axis")

subplot(1,2,2)
plot(t,u(:,3),'r-',t,u(:,4),'b-');
title(string(theta))
legend("Vx", "Vy")
    
%}
end