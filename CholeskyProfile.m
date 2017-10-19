%Cholesky decomposition of a profile stored sparse matrix into a lower triangular matrix and its conjugate transpose. Used to solve linear systems of equations. 

function [A] = getElement(diag,i,j) 
A = diag(i)-i+j;
end


function cholesky_perfil(a,diag)

[m,n] = size(diag);
   
a(1) = sqrt(a(1));
 for i=2:m
     for j = (i-diag(i)+diag(i-1)+1):i-1
        s = 0;
        for k = (i-diag(i)+diag(i-1)+1):j-1
            s = s + a(getElement(diag,i,k)) * a(getElement(diag,j,k));
        end
        a(getElement(diag,i,j)) = (a(getElement(diag,i,j))-s)/a(getElement(diag,j,j));
         
     end 
     
    s = 0;
    for k = (i-diag(i)+diag(i-1)+1):i-1
        s = s + a(getElement(diag,i,k))^2;
    end

    a(getElement(diag,i,i)) = sqrt(a(getElement(diag,i,i))-s); 
 end
real(a)
diag
end


% Execute this code to try the method

%{
    a = [2;-1;2;-1;2];
diag = [1;3;5];

matriz = [2 -1 0 ; -1 2 -1 ; 0 -1 2];
cholesky_perfil(a,diag)

%}