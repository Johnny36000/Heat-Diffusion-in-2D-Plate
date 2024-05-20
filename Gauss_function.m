function x = Gauss_function(A,B)

[n,m] = size(A);

% Initialization
x = zeros(n,1);
l = zeros(n,n-1);

% Reducing Matrix A to upper triangular form

for k = 1:m-1
    % =========Performing Partial-pivoting=================================
        for p = k+1:n
            if (abs(A(k,k)) < abs(A(p,k)))
                A([k p],:) = A([p k],:);
                  B([k p]) = B([p k]);
            end
        end
    % =====================================================================
    for i = k+1:n
        l(i,k) = A(i,k)/A(k,k);
        for j = k+1:m
            A(i,j) = A(i,j)-l(i,k)*A(k,j);
        end  
        B(i) = B(i)-l(i,k)*B(k);
    end
end

for k = 1:n-1
    for i = k+1:n
        A(i,k) = 0;
    end
end

%==========================================================================
% Backward substitution
%==========================================================================
x(n) = B(n)/A(n,n);

for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j)*x(j);
    end
    x(i) = (B(i)- sum)/A(i,i);
end

%==========================================================================
end
    
    