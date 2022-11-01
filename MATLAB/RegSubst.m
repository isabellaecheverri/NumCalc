function [x]=RegSubst(U,B)
    [f,~]=size(U);
    x(f)=B(f)/U(f,f);
    for i=f-1:-1:1
        sum=0;
        for j=i+1:f
            sum=sum+U(i,j)*x(j);
        end
        x(i)=(B(i)-sum)/U(i,i);
    end
end