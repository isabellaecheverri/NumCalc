function [x]=ProgSubst(L,B)
    [f,~]=size(L);
    x=zeros(1,f);
    x(1)=B(1)/L(1,1);
    for i=2:f
        sum=0;
        for j=1:i
            sum=sum+L(i,j)*x(j);
        end
        x(i)=(B(i)-sum)/L(i,i);
    end
end