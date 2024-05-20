function x = inverse_function(A,B)
c = size(A);
d = size(B);
if(c(2)~=d(1))
    error("size does not allow multiplication")
end
x = inv(A)*B;
end