%Example 4.13
%CE F231 Fluid Mechanics Project
%Done by: M Harikesha, Nipun Tewari, Hridik Punukollu

%Taking input for the problem parameters
sideLength= input('Enter the length of the side of square in meters: ');
specificGravity= input('Enter the specific gravity of material: ');
G= input('Enter the specific weight of water: ');
disp("Assuming length of the log to be l m as it is not specified.")
l = 1;
accelerationDueToGravity= 9.81;

%Doing the required calculations to the obtained values.
fprintf ('Let depth of immersion be "immersedLength" and length of the log be "l" \n');
immersedLength = specificGravity*sideLength;
centerOfBuoyancy= immersedLength/2;
centerOfGravity= sideLength/2;
BG= centerOfGravity-centerOfBuoyancy;

%Displaying the calculated values.
fprintf ('The center of buoyancy is: %f m\n', centerOfBuoyancy); 
fprintf ('The center of gravity is: %f m\n', centerOfGravity); 
fprintf ('BG = %f m\n', BG);

%Performing some more calculations
momentOfInertia= (1/12)*l*sideLength^3;
immersedVolume= sideLength*immersedLength*l;

%Displaying results
BM= momentOfInertia/immersedVolume;
fprintf ('BM= %f m\n\n', BM);

GM= BM-BG;
fprintf('GM= %f m\n\n', GM);

T = 6.28*(((sideLength^2/12)/(accelerationDueToGravity*GM))^0.5);
fprintf('The time period of rolling is given as: %f s \n\n', T);