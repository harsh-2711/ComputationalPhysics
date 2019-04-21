clc;
clear all;
close all;

u0=zeros(2,1);
u0(1)=10; % x
u0(2)=0; % v

[t,u]=ode45(@SHM,[0:0.01:10],u0);

plot(u(:,1),u(:,2));