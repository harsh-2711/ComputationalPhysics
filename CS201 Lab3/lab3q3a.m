clc;
clear all;
close all;

v0 = 50;

[t,u] = ode45(@cycle, [0:0.01:5], v0);

figure(1)
plot(t,u(:,1));