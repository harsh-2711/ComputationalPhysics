clc;
clear all;
close all;

u0 = zeros(2,1);
u0(1) = 5;
u0(2) = 10;

dt = 0.01;
t = 15;

b = 20;
k = 1;
m = 1;

[t,u] = ode45(@(t,u) damped_osc(t,u,m,k,b), [0:dt:t], u0);

figure(2)
plot(t,u(:,2));
title("Damped Motion of a pendulum")

figure(3)
plot(u(:,1),u(:,2));
title("Phase plot of damped pendulum");

%%%%%%%%%%%%%%%%%%%%%%%%%%

A = 5;
dt = 0.001;
t = [0:dt:10];

% Underdamped

b = 10;
k = 1;
m = 1;

w_ = sqrt((k/m) - ((b*b)/(4*m*m)));

u_x = A .* exp(-(b/(2*m)) .* t) .* cos(w_ .* t);

% Critically damped

b = 2;
k = 1;
m = 1;

w_ = sqrt((k/m) - ((b*b)/(4*m*m)));

c_x = A .* exp(-(b/(2*m)) .* t) .* cos(w_ .* t);

% Overdamped

b = 2;
k = 10;
m = 1;

w_ = sqrt((k/m) - ((b*b)/(4*m*m)));

o_x = A .* exp(-(b/(2*m)) .* t) .* cos(w_ .* t);

figure(4)
plot(t,u_x,'r-',t,c_x,'b-',t,o_x,'g-');
legend('Over damped', 'Critically damped', 'Under damped');
title('Damped oscillations');

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Changing m

u0 = zeros(2,1);
u0(1) = 5;
u0(2) = 10;

dt = 0.01;
tx = 15;
k = 0.5;

for i = 1:5

    b = 20;
    m = i;

    [t,u] = ode45(@(t,u) damped_osc(t,u,m,k,b), [0:dt:tx], u0);

    figure(5)
    subplot(5,1,i);
    plot(t,u(:,2));

    figure(6)
    subplot(5,1,i);
    plot(u(:,1),u(:,2));

end


% Changing k

u0 = zeros(2,1);
u0(1) = 5;
u0(2) = 10;

dt = 0.01;
tx = 15;
m = 20;

for i = 5:5:25

    b = 20;
    k = i;

    [t,u] = ode45(@(t,u) damped_osc(t,u,m,k,b), [0:dt:tx], u0);

    figure(7)
    subplot(5,1,i/5);
    plot(t,u(:,2));

    figure(8)
    subplot(5,1,i/5);
    plot(u(:,1),u(:,2));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Changing b

u0 = zeros(2,1);
u0(1) = 5;
u0(2) = 10;

dt = 0.01;
tx = 15;
m = 1;
k = 1;

for i = 1:5

    b = i-1;

    [t,u] = ode45(@(t,u) damped_osc(t,u,m,k,b), [0:dt:tx], u0);

    figure(9)
    subplot(5,1,i);
    plot(t,u(:,1));

end

%%%%%%%%%%%%%%%%%%%%%%%%%

u0 = zeros(2,1);
u0(1) = 5;
u0(2) = 10;

dt = 0.01;
tx = 15;
m = 20;

b = 50;
k = 10;

[t,u] = ode45(@(t,u) damped_osc(t,u,m,k,b), [0:dt:tx], u0);

array = [];
j = 1;

for i = 1:length(u(:,1)) - 1
    if (j && u(i+1,1) <= u(i,1))
       array = [array,u(i,1)];
       j = 0;
    end
    
    if (u(i+1,1) > u(i,1))
       j = 1; 
    end
end

figure(10)
subplot(2,1,1)
plot(t,u(:,1))
subplot(2,1,2)
stem(array);

%%%%%%%%%%%%%%%%%%%%%%%%%%

m = 1;
k = 1;
b = 5;

t = 100;
dt = 0.1;

u0 = zeros(2,1);
u0(1) = 1;
u0(2) = 1;

[t,u] = ode45(@(t,u) sliding_fric(t,u,m,k,b), [0:dt:t], u0);

figure(11)
plot(t,u(:,1));
title("Sliding Friction on body");

figure(12);
plot(u(:,1),u(:,2));
title("Phase Space plot");

