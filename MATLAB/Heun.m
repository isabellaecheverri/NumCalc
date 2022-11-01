function [t,y]=Heun(f,t0,tn,y0,h)
    disp('Heun (Modified Euler) Method')
    n=ceil(abs(tn-t0)/h);
    t=0:h:n*h;
    t=t0+t';
    y=zeros(n,1);
    y(1)=y0;
    for i=2:n+1
        yest=y(i-1)+h*f(t(i-1),y(i-1));
        k1=f(t(i-1),y(i-1));
        k2=f(t(i-1)+h,yest);
        y(i)=y(i-1)+(h/2)*(k1+k2);
    end
end