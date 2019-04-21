clc;
clear all;
s = sqrt(15156331000);

v0 = [s 0  0]';  %initial velocity
tspan = 0:.00000001:0.0000400;
B = [0 0 0.000005]';  %magnitude of B
E = [0 0 0]'
%E = 0*sin(0.005*tspan);
%F = E'*[1 0 1];
m = 9.31e-31;  
q = 1.6e-19;  %charge on particle
r0 = [0 300000 0]'; %initial position of particle 
y0 = [r0; v0];
f = @(t,y) [y(4:6); E + (q/m)*cross(y(4:6),B)];
[t,y] = ode45(f,tspan,y0);
figure(1)
plot3(y(:,1),y(:,2),y(:,3))
grid;
axis equal;
zci = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0);                    % Returns Zero-Crossing Indices Of Argument Vector
zx = zci(y(:,1))
timeperiod = 2*(zx(3)-zx(2))* .00000001
radius = max(y(:,1)) % calculated from plot 


figure(2)
plot(t,y(:,1))