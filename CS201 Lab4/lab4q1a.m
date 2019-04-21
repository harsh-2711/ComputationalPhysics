clc;
clear all;
close all;

dt = 0.01;
t = 25; %s

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

[t,u] = ode45(@shm_linear, [0:dt:t], u0);

figure(1)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1kg, K = 1 N/m");

% Increased Mass
t = 25; %s

[t,u] = ode45(@shm_linear_increased_mass, [0:dt:t], u0);

figure(2)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 10Kg, K = 1 N/m");

% Increased Spring Constant
t = 25; %s

[t,u] = ode45(@shm_linear_increased_sconstant, [0:dt:t], u0);

figure(3)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1Kg, K = 10 N/m");

% Changing initial conditions
dt = 0.01;
t = 25; %s

u0 = zeros(2,1);
u0(1) = 1;
u0(2) = 1;

[t,u] = ode45(@shm_linear, [0:dt:t], u0);

figure(4)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1kg, K = 1 N/m with changed initial conditions");

% Calculating Amplitude and Frequency using FFT
freq_sig = fftshift(fft(u(:,1)));
freq_sig = abs(freq_sig);
figure(5)
plot(freq_sig);
title("FFT of signal");

% Observing for different values of dt and t

% Changing dt
dt = 0.1;
t = 25; %s

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

[t,u] = ode45(@shm_linear, [0:dt:t], u0);

figure(6)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1kg, K = 1 N/m and dt = 0.1 with t = 25");

% New dt
dt = 1;
t = 25; %s

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

[t,u] = ode45(@shm_linear, [0:dt:t], u0);

figure(7)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1kg, K = 1 N/m and dt = 1 with t = 25");

% Changing t

dt = 0.01;
t = 10; %s

u0 = zeros(2,1);
u0(1) = 0;
u0(2) = 1;

[t,u] = ode45(@shm_linear, [0:dt:t], u0);

figure(8)
plot(t,u(:,1),'r-',t,u(:,2),'b-');
legend("Distance","Velocity");
title("M = 1kg, K = 1 N/m and dt = 0.01 with t = 10");

