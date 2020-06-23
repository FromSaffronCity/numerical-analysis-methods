function yval = quadPolation(x, y, xx)

    N = length(x)-1;
    V = zeros(3*N,1);
    Z = zeros(3*N,3*N);

    j = 1;
    f = 1;

    for i = 2: 2: 2*N    
        Z(i,f:f+2) = [x(j)^2 x(j) 1];
        V(i) = y(j);
        j =  j+1;
        Z(i+1,f:f+2) =  [x(j)^2 x(j) 1];  
        V(i+1) =  y(j);
        f  =  f+3;
    end

    j = 1;
    l = 2;

    for i = 2*N+2: 1: 3*N   
        Z(i,j:j+1) = [2*x(l) 1];
        Z(i,j+3:j+4) = [-2*x(l) -1];
        j = j+3;
        l = l+1;
    end

    Z(1,1)=1;
    Coeff = Z\V;
    
    i = 1;

    while(1)
        if(xx <= x(i + 1)) 
			break;
		end

        i = i + 1;
    end
    
    i = 3*(i-1)+1;
    yval = Coeff(i)*xx*xx + Coeff(i+1)*xx + Coeff(i+2);

end