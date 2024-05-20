function x = Gauss_Seidel_function(A,B,Relaxation_Factor,Acceptable_Relative_Error,max_iter)

n = length(B);
x = zeros(n, 1);

for iter = 1:max_iter
    T_old = x;
    
    for i = 1:n
        sigma = 0;
        for j = 1:n
            if j ~= i
                sigma = sigma + A(i, j) * x(j);
            end
        end
        x(i) = (1 - Relaxation_Factor) * T_old(i) + Relaxation_Factor * (B(i) - sigma) / A(i, i);
    end
    
    rel_error = norm(x - T_old) / norm(x);
    fprintf('Iteration %d, Relative error: %e\n', iter, rel_error);

    
    if rel_error < Acceptable_Relative_Error
        fprintf('Converged after %d iterations with relative error %e.\n', iter, rel_error);
        break;
    end
end

if iter == max_iter
    fprintf('Max iterations reached without convergence.\n');
end


end

