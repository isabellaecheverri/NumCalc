function [x]=LUFactParPiv(A,b)
    disp("LU Factorization with Partial Pivot")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [L,U,P]=LU(A);
    Pb=P*b;
    disp('Lower Triangular Matrix L')
    disp(L)
    disp('Upper Triangular Matrix U')
    disp(U)
    disp('Vector Pb')
    disp(Pb)
    z=ProgSubst(L,Pb);
    x=RegSubst(U,z');
    disp('Progressive substitution Lz=Pb')
    disp(z);
    disp('Regresive substitution Ux=z, solution')
    disp(x);
end

function [L,U, P]=LU(A)
    [f,c]=size(A);
    L=eye(f);
    P=eye(f);    
    disp('Stage 0')
    disp(A)
    for j=1:c-1
        col=abs(A(j:f,j));
        m=find(col==max(col));
        m=m(1);
        temp=A(j,:);
        A(j,:)=A(m+j-1,:);
        A(m+j-1,:)=temp;
        temp=P(j,:);
        P(j,:)=P(m+j-1,:);
        P(m+j-1,:)=temp;
        if j>1
            temp=L(j,j-1);
            L(j,j-1)=L(m+j-1,j-1);
            L(m+j-1,j-1)=temp;
        end
        for i=j:f-1
            Mij=A(i+1,j)/A(j,j);
            A(i+1,j:c)=A(i+1,j:c)-(Mij)*A(j,j:c);
            L(i+1,j)=Mij;
        end
        disp('Stage '+ string(j))
        disp(A)
        disp('L('+string(j)+') = [ '+ sprintf('%d ', L(:,j))+']')
        disp('U('+string(j)+') = [ '+ sprintf('%d ', A(j,:))+']')
        disp('P')
        disp(P)
    end
    U=A;
end