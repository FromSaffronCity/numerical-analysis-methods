function output = angleFunction(initialAngle)
	% a function of independent initial angle variable
	% NOTICE - initialAngle is in degree unit

	output = 44.1*tan(initialAngle*(pi/180))*tan(initialAngle*(pi/180)) - 90*tan(initialAngle*(pi/180)) + 43.3;
end;