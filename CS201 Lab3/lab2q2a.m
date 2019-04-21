clc;
clear all;
close all;

u0 = zeros(4,1);

v = 20;
theta = 30;

u0(1) = 0; % x
u0(2) = 0; % y
u0(3) = v*cos(theta); % Vx
u0(4) = v*sin(theta); %Vy

[t,u] = ode45(@projectile, [0:0.01:4], u0); % format - function, time interval, initial conditions

figure(1)
plot(t,u(:,1),'r-',t,u(:,2),'b-'); % Phase plot for x axis

figure(2)
plot(t,u(:,3),'r-',t,u(:,4),'b-'); % Phase plot for y axis

