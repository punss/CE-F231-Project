%Example 4.15
%CE F231 Fluid Mechanics Project
%Done by: M Harikesha, Nipun Tewari, Hridik Punukollu

%Taking input for problem parameters.
%Initialising GUI with required parameters.
x = inputdlg(["Angle the float is at to the vertical",...
    "Enter the specific gravity of the oil",...
    "Enter the diameter of the float in mm",...
    "Enter the distance between the float and the hinge in meters",...
    "Enter the distance between the hinge and the inlet in meters:",...
    "Enter the force with the valve must be pressed to stop the flow of oil in Newtons",...
    "Enter the height of the oil below the hinge at which flow of oil would stop in meters"],"Example 4.15");

%Alotting the obtained values to variables
theta = deg2rad(180 - str2double(x{1}));
specificGravity = str2double(x{2});
floatDiameter = str2double(x{3});
floatLength = str2double(x{4});
inletDistance = str2double(x{5});
valveForce = str2double(x{6});
flowStopHeight = str2double(x{7});

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

msgbox(sprintf("Depth of the center of the float below the oil is: %d\nVolume of the sphere immersed in the oil is: %d sq.m.\nThe buoyant force acting on the sphere is: %d N.\nThe weight of the hinge is: %d N\n",h,immersedVolume,buoyantForce,hingeWeight),"Results")


