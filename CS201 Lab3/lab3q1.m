clc;
clear all;
close all;

u0=zeros(2,1);
u0(1)=0.5;
u0(2)=0.2;
g=9.8;
l=1;

theta=zeros(500,1);
omega=zeros(500,1);

[t,u]=ode45(@SHM,[0:0.01:5],u0);
plot(u(:,1),u(:,2));