%%% USER INPUT %%%
temperature = input("Please enter the temperature Ex: [Up, Left, Down, Right], [100,75,0,50]: "); 

dimensions = input("Please enter the dimension of the plate Ex: [x,y], [1, 2]: ");

nodes = input("Please enter the number of nodes in the x and y directions includng boundaries Ex: [x,y], [1, 2]: ");

method = input("Please select the method for solving the linear system. NOTE: input number only" + ...
    " 1) Gauss Elimination with Partial Pivoting 2) Gauss-Seidel 3) Inverse ");

%==================================
% Calling The steady state function to set up the temperature grid
[A, B] = steady_state_bonus_function(temperature, dimensions, nodes);
%==================================

% Choosing which numerical method to use
if (method == 1)

    T = Gauss_function(A,B);

elseif (method == 2)

    Relaxation_Factor = input("Please enter the relaxation factor (enter 1 for no relaxation): ");   
    Acceptable_Relative_Error = input("Please enter the acceptable relative error: "); 
    max_iter = input("Please enter maximum iterations: ");

    T = Gauss_Seidel_function(A,B,Relaxation_Factor,Acceptable_Relative_Error,max_iter);

elseif (method == 3)

    T = inverse_function(A,B);
end

% % % % % % % % % % % % % % % % % % % % % % % % 


%%% Calling the plot function %%%
[X,Y] = plot_function(T,dimensions,nodes);
%==================================

% Define the number of points
num_points = numel(X);

T = reshape(T,[nodes(2)-2,nodes(1)-2]);

% Create a point number vector
point_number = (1:num_points).';

% Concatenate X, Y, and T arrays into a single matrix
data_matrix = [point_number, X(:), Y(:), T(:)];

% Convert the matrix into a table
database = array2table(data_matrix, 'VariableNames', {'Point', 'X', 'Y', 'Steady State Temperature'});

% Display the table
disp(database);

