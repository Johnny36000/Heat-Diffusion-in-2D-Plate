function [X,Y] = plot_function(T, dimensions, nodes)

% Parameters
Lx = dimensions(1); % Length of the domain in x-direction
Ly = dimensions(2); % Length of the domain in y-direction
nx = nodes(1);      % Number of grid points in x-direction
ny = nodes(2);      % Number of grid points in y-direction

% Grid spacing
dx = Lx / (nx - 1);
dy = Ly / (ny - 1);

T = reshape(T,[nodes(2)-2,nodes(1)-2]);

% Plot the temperature distribution
[X, Y] = meshgrid(0:dx:Lx, 0:dy:Ly);

[Tx,Ty] = size(T);

X = X(2:Tx+1,2:Ty+1);
Y = Y(2:Tx+1,2:Ty+1);

figure;
contourf(X, Y, T, 20);
colorbar;
title('Temperature Distribution');
xlabel('X');
ylabel('Y');

end

