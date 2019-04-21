clc;
clear all;
close all;

T = 1000;
q = 1.6;
m = 9.1;
K = 3.8;

% Along X axis
Ex = 0;
Ey = 0;
Ez = 0;
E = [Ex Ey Ez];

% Along poles => Z axis
Bx = 0;
By = 0;
Bz = 0.00005;
B = [Bx By Bz];

% Perpendicular to horizontal surface => Y axis
ux = 0;
uy = (K * T) / m;
uz = 0;
u = [ux uy uz];

x0 = 0;
y0 = 3;
z0 = 0;
r0 = [x0 y0 z0];

t0 = 0;
tf = 0.001;
dt = 0.000000001;
tspan = t0 : dt : tf;

p0 = [x0;y0;z0;ux;uy;uz;Bx;By;Bz;Ex;Ey;Ez];

[t,p] = ode45(@A1Lorentz,tspan,p0);

plot3(p(:,1),p(:,2),p(:,3));