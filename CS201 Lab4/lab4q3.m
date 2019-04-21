clc;
clear all;
close all;

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

dt = 0.01;
t = 30;

b = 2;
k = 1;
m = 1;
F0 = 1.5;
w = 1.01;

[t,u] = ode45(@(t,u) damped_motion(t,u,m,k,b,F0,w), [0:dt:t], u0);

figure(1)
plot(t,u(:,2));
title("Damped Motion of a pendulum")

figure(2)
plot(u(:,1),u(:,2));
title("Phase plot of damped pendulum");

KE = (1/2) .* m .* (u(:,2) .* u(:,2));

figure(3)
subplot(3,1,1)
plot(t,KE);
title("Kinetic Energy with time");


PE = (1/2) .* k .* (u(:,1) .* u(:,1));

subplot(3,1,2)
plot(t,PE);
title("Potential Energy with time");

subplot(3,1,3)
plot(u(:,1),PE);
title("Potential Energy with displacement");

%%%%%%%%%%%%%%%%%%%%%%%%

% w0 < w
u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

dt = 0.01;
t = 30;

b = 2;
k = 1;
m = 1;
F0 = 1.5;
w = 1.5;

[t,u] = ode45(@(t,u) damped_motion(t,u,m,k,b,F0,w), [0:dt:t], u0);

figure(4)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Displacement", "Velocity");
title("w0 < w")

figure(5)
plot(u(:,1),u(:,2));
title("Phase plot of damped pendulum");


% w0 > w
u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

dt = 0.01;
t = 30;

b = 2;
k = 1;
m = 1;
F0 = 1.5;
w = 0.5;

[t,u] = ode45(@(t,u) damped_motion(t,u,m,k,b,F0,w), [0:dt:t], u0);

figure(6)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Displacement", "Velocity");
title("w0 > w")

figure(7)
plot(u(:,1),u(:,2));
title("Phase plot of damped pendulum");


% w0 = w
u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

dt = 0.01;
t = 30;

b = 2;
k = 1;
m = 1;
F0 = 1.5;
w = 1;

[t,u] = ode45(@(t,u) damped_motion(t,u,m,k,b,F0,w), [0:dt:t], u0);

figure(8)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Displacement", "Velocity");
title("w0 = w")

figure(9)
plot(u(:,1),u(:,2));
title("Phase plot of damped pendulum");

%%%%%%%%%%%%%%%%%%%%%%%%%%

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

dt = 0.01;
t = 30;

b = 2;
k = 1;
m = 1;
F0 = 1.5;
w = 1.01;

[t,u] = ode45(@(t,u) damped_motion(t,u,m,k,b,F0,w), [0:dt:t], u0);

f = fftshift(fft(u(:,1)));
f = abs(f);
figure(10)
plot(f);

array = [];
w_arr = [];
j = 1;

for i = 1:length(u(:,1)) - 1
    if (j && u(i+1,1) <= u(i,1))
       array = [array,u(i,1)];
       w_arr = [w_arr,2*pi*f(1)];
       j = 0;
    end
    
    if (u(i+1,1) > u(i,1))
       j = 1; 
    end
end

disp(array);
figure(11)
plot(w_arr,array);