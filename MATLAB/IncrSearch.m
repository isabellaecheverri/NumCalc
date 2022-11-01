function IncrSearch(f,xo,dx,N)
    disp("Incremental Search")
    xprev=xo;
    xact=xo+dx;
    rootCount=0;
    for i=1:N
        if f(xact)*f(xprev)<0
            disp("There's a root for the function in " + "[" + ...
                string(xprev) +", "+ string(xact)+"]")
            rootCount=+1;
        end
        xprev=xact;
        xact=xprev+dx;
    end
    if rootCount==0
        disp("No roots where found for the given number of " + ...
            "iterations and step size")
    end
end
