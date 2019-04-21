clc;
close all;
clear all;

tend = 1;
dt = 0.0001;
T = 0:dt:tend;
dt2 = 0.001;
T2 = 0:dt2:tend;
dt3 = 0.01;
T3 = 0:dt3:tend;
dt4 = 0.1;
T4 = 0:dt4:tend;
initial = [0 1 2*pi 0]; % x y vx vy

[t, Y] = ode45(@ell_mot, T, initial);
[t, Y2] = ode45(@ell_mot, T2, initial);
[t, Y3] = ode45(@ell_mot, T3, initial);
[t, Y4] = ode45(@ell_mot, T4, initial);

if max(Y(:,1))>max(Y(:,2))
    a = max(Y(:,1));
    b = max(Y(:,2));
else
    a = max(Y(:,2));
    b = max(Y(:,1));
end

e = sqrt(1-(b*b)/(a*a)); % eccentricity

figure(1)
plot(Y(:, 1),Y(:, 2),'r-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
hold on
plot(Y2(:, 1),Y2(:, 2),'g-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
hold on
plot(Y3(:, 1),Y3(:, 2),'b-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
hold on
plot(Y4(:, 1),Y4(:, 2),'b-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
legend('dt = 0.0001', 'dt = 0.001','dt = 0.01','dt = 0.1');

figure(2)
subplot(4,1,1)
plot(Y(:, 1),Y(:, 2),'r-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
title('dt=0.0001')
subplot(4,1,2)
plot(Y2(:, 1),Y2(:, 2),'g-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
title('dt=0.001')
subplot(4,1,3)
plot(Y3(:, 1),Y3(:, 2),'b-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
title('dt=0.01')
subplot(4,1,4)
plot(Y4(:, 1),Y4(:, 2),'b-'),title('Earth`s orbit'),xlabel('x AU'),ylabel('y AU');
title('dt=0.1')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analysis of different planets %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% data - http://www.qrg.northwestern.edu/projects/vss/docs/space-environment/3-orbital-lengths-distances.html
venus = 0.7229;
earth = 1.0005;
mars = 1.5233;
jupiter = 5.2025;
saturn = 9.5368;
uranus = 19.1886;
neptune = 30.0702;

radius = [venus earth mars jupiter saturn uranus neptune];
name = ["venus" "earth" "mars" "jupiter" "saturn" "uranus" "neptune"];

no_of_planets = 7;
dt = 0.001;
tend = 1;
T = 0:dt:tend;
u0 = [0 1 2*pi 0]; % x y vx vy

figure(3)

for i = 1:1:no_of_planets
    r = radius(i);
    [t, u] = ode45(@(t,u) analysis(t,u,r), T, u0);
    subplot(7,1,i)
    plot(u(:,1), u(:,2));
    title(name(i));
    xlabel('x AU');
    ylabel('y AU');
end

%{
for i = 1:1:no_of_planets
    r = radius(i);
    [t, u] = ode45(@(t,u) analysis(t,u,r), T, u0);
    plot(u(:,2), u(:,1));
    hold on;
end
legend('venus','earth','mars','jupiter','saturn','uranus','neptune');
xlabel('x AU');
ylabel('y AU');
%}