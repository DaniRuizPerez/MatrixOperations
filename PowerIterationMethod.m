%Implementation of the power method for calculating the eigenvectors and eigenvalues of a matrix stored in morse

function y = MxV(a,arrow,acol,q)
    y = zeros(1,size(q,1));
    %q es el vector por el que queremos multiplicar la matriz
    %arrow tiene un elemento mas, que es una unidad mayor al ultimo
    for i=1:size(q,1)
       sum = 0;
       for k=1:(arrow(i+1)-arrow(i))
           % lo que esta mal es esto elr esto bien creo *a(acol(k+arrow(i)-1))
           sum = sum + q(acol(k+arrow(i)-1))*a(k+arrow(i)-1);
       end
       y(i) =  sum;
    end
    y = y';
end


function potenciaIterada(a,arrow,acol)
n = size(arrow,2)-1; %tamaño de la matriz

q0 = ones(n,1);
E = 0.000000001;
ind = 0;
for p = 1:100
    p
    x = MxV(a,arrow,acol,q0);
    %busco la componente con mayor modulo(haciendo la normal infinito)
    ind = 1;
    aux = 0;
    for i=1:size(x,1)
        if abs(x(i)) > aux
            aux = abs(x(i));
            ind = i;
        end
    end
    %b es el autovalor con mayor modulo
    b = x(ind);
    b
    %q es el autovector asociado al mayor autovalor
    q = x/b;
    e = norm(((q-q0)/q),Inf);
    x
    if e < E
        breakk = 'break'
       break 
    end
    q0 = q;
    q
end
end


% Execute this code to try the method

%{
a = [10 4 -9 2 2 1 -1 2]
arrow = [1 3 6 9]
acol = [1 3 1 2 3 1 2 3]
potenciaIterada(a,arrow,acol)


a = [4 2 2 2 3 4 1 3 2 2 4 1 1 2 3 4 ]
arrow = [1 5 9 13 17]
acol = [1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4]
potenciaIterada(a,arrow,acol)

 %}