clc;
close all;
clear all;

height_arr = [];
velocity_arr = [];
target_distance = 10; %meters

for k = 1:1:2
    
    target_height = k; %meters
    height_arr = [height_arr, target_height];
    
    check = 0;

    for j = 1:0.01:30

        u0 = zeros(4,1);

        v = j;
        
        v_min = 999;
        
        for t = 1:1:90
            
            theta = t;
            g = 9.8;

            u0(1) = 0; % x
            u0(2) = 0; % y
            u0(3) = v*cos(theta); % Vx
            u0(4) = v*sin(theta); %Vy

            [t,u] = ode45(@projectile_diff,[0:0.01:5],u0);

            t_taken = target_distance / (v*cos(theta));

            height_reached = (v*sin(theta))*t_taken - (1/2)*g*t_taken*t_taken;
            height_reached = round(height_reached);

            if height_reached == target_height
                if j < v_min
                   v_min = j; 
                end
                check = 1;
                break;
            end
        
        end
        
        velocity_arr = [velocity_arr, v_min];

    end
    
    if check == 0
        velocity_arr = [velocity_arr, 0];
    end
    
end

plot(height_arr, velocity_arr);

