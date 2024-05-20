function [A, B] = steady_state_bonus_function(temperature, dimensions, nodes)

% Parameters
Lx = dimensions(1); % Length of the domain in x-direction
Ly = dimensions(2); % Length of the domain in y-direction
nx = nodes(1);      % Number of grid points in x-direction
ny = nodes(2);      % Number of grid points in y-direction

% Boundary conditions
T_top = temperature(1);    % Temperature at the top boundary
T_left = temperature(2);   % Temperature at the left boundary
T_bottom = temperature(3); % Temperature at the bottom boundary
T_right = temperature(4);  % Temperature at the right boundary

% Grid spacing
dx = Lx / (nx - 1);
dy = Ly / (ny - 1);

% Number of interior points
N = (nx-2) * (ny-2);

% Initialize A matrix and B vector
A = zeros(N, N);
B = zeros(N, 1);


% Helper function to convert 2D index to 1D index
index = @(i, j) (i-2) * (ny-2) + (j-2) + 1;

% Construct the coefficient matrix A, the right-hand side vector B,
for i = 2:nx-1
    for j = 2:ny-1
        k = index(i, j);
         

        A(k, k) = -2*(1/dx^2 + 1/dy^2); % Diagonal element

        if i > 2
            A(k, index(i-1, j)) = 1/dx^2; % Left neighbor
        else
            B(k) = B(k) - T_left/dx^2;
        end

        if i < nx-1
            A(k, index(i+1, j)) = 1/dx^2; % Right neighbor
        else
            B(k) = B(k) - T_right/dx^2;
        end

        if j > 2
            A(k, index(i, j-1)) = 1/dy^2; % Bottom neighbor
        else
            B(k) = B(k) - T_bottom/dy^2;
        end

        if j < ny-1
            A(k, index(i, j+1)) = 1/dy^2; % Top neighbor
        else
            B(k) = B(k) - T_top/dy^2;
        end
    end
end

end