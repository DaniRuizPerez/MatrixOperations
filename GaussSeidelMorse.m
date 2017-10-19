%Gauss-Seidel implementation for morse storage matrices. The method is used to solve a linear system of equations.

function gaussSeidel(a,arrow,acol,b)
n = size(arrow,1)-1; %tamaño de la matriz
% -1 porque se pasa un numero adicional
if n == 0
    n = size(arrow,2) -1;
end


D = zeros(n,1);
E = zeros(n,n);
F = zeros(n,n);

%reconstruyo la matriz
for i=1:n
    for j=1:(arrow(i+1)-arrow(i))
       A(i,acol(arrow(i)+j-1)) = a(arrow(i)+j-1);
    end  
end
%doy valores a las submatrices
for i=1:n
    D(i) = A(i,i);
end
for i=1:n
    for j=1:i-1
        E(i,j) = -A(i,j);
    end  
    for j=i+1:n
        F(i,j) = A(i,j);
    end
end

x = zeros(n,1);
xPrev = x*10;
for p=1:15
    for i=1:n
        sum1 = 0;
        for j = 1:i-1
           sum1 = sum1 + E(i,j)*x(j); 
        end
        sum2 = 0;
        for j =i+1:n
           sum2 = sum2 + F(i,j)*x(j) ;
        end
       x(i) = (b(i)+sum1-sum2)/D(i) ;
       
    end

    if abs(norm(xPrev)-norm(x)) > 0.00000001
        xPrev = x;
    else
        breakk = 'break'
        break;  
    end
    x
end
x

end



% Execute this code to test the method

%{
aa =  [3 -1 -1 ; -1 3 +1 ; 2  1 4];
a = [3 -1 -1 -1 3 1 2 1 4];
arrow = [1 4 7 10];
acol = [1 2 3 1 2 3 1 2 3];
b = [1 3 7];
gaussSeidel(a,arrow,acol,b)


%A = [1 0 0 2 0; 3 4 0 -5 0; 6.2 0 7 8 -9.1; 0 0 10 11 0; 0 0 0 0 12.3]
%jr = [1 3 6 10 12 13]
%jac = [1 4 1 2 4 1 3 4 5 3 4 5]
%aa =[1 2 3 4 -5 6.2 7 8 -9.1 10 11 12.3]
%b = [1 2 3 4 5]

%gaussSeidel(aa,jr,jac,b);
%}