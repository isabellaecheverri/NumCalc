function Tridiag(A,b)
    n=length(b);
    %Check if matrix is tridiagonal
    for i=1:n
        for j=1:n
            aij=A(i,j);
            if i==j || i-1==j || i+1==j
                if aij==0
                    disp("The given matrix is not tridiagonal")
                    return
                end
            else
                if aij~=0
                    disp("The given matrix is not tridiagonal")
                    return
                end
            end
        end
    end
    Ab=[A b];
    disp('Stage 0')
    disp(Ab)
    diagp=zeros(n,1); %principal diagonal
    diagu=zeros(n-1,1);  %diagonal above the principal diagonal
    diagl=zeros(n-1,1);  %diagonal below the principal diagonal
    diagp(1)=A(1,1);
    for i=2:n
        %Extract the elmenents from each diagonal
        diagl(i-1)=Ab(i,i-1);
        diagp(i)=Ab(i,i);
        diagu(i-1)=Ab(i-1,i);
        %Making the diagonal below zeros
        M=diagl(i-1)/diagp(i-1); %Multiplier
        diagp(i)=diagp(i)-M*diagu(i-1);
        diagl(i-1)=diagl(i-1)-M*diagp(i-1);
        b(i)=b(i)-M*b(i-1);
        Ab(i,i-1:i+1)=[diagl(i-1) diagp(i) diagu(i-1)];
        Ab(i,end)=b(i);
        disp('Stage '+string(i))
        disp(Ab)
    end

    %Substitution
    x(n)=b(n)/diagp(n);
    for i=n-1:-1:1
        x(i)=(b(i)-diagu(i)*x(i+1))/diagp(i);
    end
    disp('Solution')
    disp(x)
end