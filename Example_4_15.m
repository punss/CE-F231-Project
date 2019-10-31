%Example 4.15
%CE F231 Fluid Mechanics Project
%Done by: M Harikesha, Nipun Tewari, Hridik Punukollu

%Taking input for problem parameters.
theta = input("Angle the float is at to the vertical: ");
theta = deg2rad(180 - theta);
specificGravity = (input("Enter the specific gravity of the oil: "));
floatDiameter = (input("Enter the diameter of the float in mm: "));
floatLength = (input("Enter the distance between the float and the hinge in meters: "));
inletDistance = (input("Enter the distance between the hinge and the inlet in meters: "));
valveForce = (input("Enter the force with the valve must be pressed to stop the flow of oil in Newtons: "));
flowStopHeight = (input("Enter the height of the oil below the hinge at which flow of oil would stop in meters: "));

%Calculation of certain heights.
h = (floatLength*cos(theta) - flowStopHeight);
fprintf("Depth of the center of the float below the oil is: %d\n", h);

%Calculation of density of liquid.
liquidDensity = (specificGravity * 9810);
fprintf("Density of the liquid is: %d\n\n", liquidDensity);

%Finding volume of sphere immersed in the liquid by integrating
%equation.
volumeFunction = @(y) ((floatDiameter/2).^2 - (y.^2));
immersedVolume = pi * (integral(volumeFunction, -(floatDiameter/2),  h*1000)) * 10.^-9;
fprintf("Volume of the sphere immersed in the oil is: %d m^3.\n", immersedVolume);

%Finding buoyant force acting due to volume of immersed sphere.
buoyantForce = liquidDensity * immersedVolume;
fprintf("The buoyant force acting on the sphere is: %d N.\n", buoyantForce);

%Calculating weight of the hinge by taking moment into consideration.
hingeWeight = buoyantForce - (valveForce * inletDistance)/(floatLength*cos(theta));
fprintf("The weight of the hinge is: %d N\n", hingeWeight)
