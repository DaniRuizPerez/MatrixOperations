%LU decomposition that factors a matrix as the product of a lower triangular matrix and an upper triangular one. This can be used to solve linear systems of equations.

function LUFact(A)
l = size(A);

for i=2:l(1)
    
    for j=1:(i-1)
        
        s = 0;
        for k = 1:(j-1)
            s = s + A(i,k) *A(k,j);
        end
        
        A(i,j) = (A(i,j) - s) / A(j,j);
 
    end
            
            
    %si stamos en la diagonal
    
    s = 0;
        for k = 1:(i-1)
        s = s + A(i,k) *A(k,i);
    end

    A(i,i) = A(i,i) -s;
    
    
    for j=(i+1):l(1)
        s = 0;
        for k = 1:(i-1)
            s = s + A(i,k) *A(k,j);
        end
        
        A(i,j) = (A(i,j) - s);         
            
    end
end
A
end


% Execute this code to try the method
%{
aa =  [3 -1 -1 ; -1 3 +1 ; 2  1 4];
LUFact(aa)
lu(aa)
%}