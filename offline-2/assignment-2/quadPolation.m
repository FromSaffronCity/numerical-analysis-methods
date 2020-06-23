function yVal = quadPolation(xPoint, yPoint, xVal)
	%	Function implementing the Quadratic Spline Interpolation
	%
	%	Input:
	%		xPoint = given set of independent data
	%		yPoint = given set of dependent data
	%		xVal = given value of independent variable
	%
	%	Output:
	%		yVal = interpolated appx. value of dependent variable for xVal


	if(length(xPoint) ~= length(yPoint))
		error('xPoint and yPoint must be of same length');
	end

	%	process starts
    N = length(xPoint)-1;
    V = zeros(3*N,1);
    Z = zeros(3*N,3*N);

    j = 1;
    f = 1;

    for i = 2: 2: 2*N    
        Z(i,f:f+2) = [xPoint(j)^2 xPoint(j) 1];
        V(i) = yPoint(j);
        j =  j+1;
        Z(i+1,f:f+2) =  [xPoint(j)^2 xPoint(j) 1];  
        V(i+1) =  yPoint(j);
        f  =  f+3;
    end

    j = 1;
    l = 2;

    for i = 2*N+2: 1: 3*N   
        Z(i,j:j+1) = [2*xPoint(l) 1];
        Z(i,j+3:j+4) = [-2*xPoint(l) -1];
        j = j+3;
        l = l+1;
    end

    Z(1,1)=1;
    Coeff = Z\V;  %	NOTICE: left division of matrix: A|B = inv(A)*B 
    
    i = 1;

    while(1)
        if(xVal <= xPoint(i + 1)) 
			break;
		end

        i = i + 1;
    end
    
    i = 3*(i-1)+1;
    yVal = Coeff(i)*xVal*xVal + Coeff(i+1)*xVal + Coeff(i+2);

end