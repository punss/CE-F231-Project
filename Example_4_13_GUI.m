x = inputdlg(["Enter the length of the side of square in meters",...
    "Enter the specific gravity of material",...
    "Enter the specific weight of water"],"Example 4.13");

sideLength = str2double(x{1});
specificGravity = str2double(x{2});
G = str2double(x{3});

l = 1;
accelerationDueToGravity= 9.81;

%Performing calculations to obtain values for OB, OG, BG.
fprintf ('Let depth of immersion be "immersedLength" and length of the log be "l" \n');
immersedLength = specificGravity*sideLength;
centerOfBuoyancy= immersedLength/2;
centerOfGravity= sideLength/2;
BG= centerOfGravity-centerOfBuoyancy;

%Displaying the calculated values.
fprintf ('The center of buoyancy is: %f m\n', centerOfBuoyancy); 
fprintf ('The center of gravity is: %f m\n', centerOfGravity); 
fprintf ('BG = %f m\n', BG);

%Performing calculations for moment as well as immersed volume.
momentOfInertia= (1/12)*l*sideLength^3;
immersedVolume= sideLength*immersedLength*l;

%Displaying value of BM
BM= momentOfInertia/immersedVolume;
fprintf ('BM= %f m\n\n', BM);

%Calculating value of MG from above values.
GM= BM-BG;
fprintf('GM= %f m\n\n', GM);

%Displaying final time period of rolling.
T = 6.28*(((sideLength^2/12)/(accelerationDueToGravity*GM))^0.5);
fprintf('The time period of rolling is given as: %f s \n\n', T);

msgbox(sprintf("The center of buoyancy is: %f m\nThe center of gravity is: %f m\nBG = %f m\nBM= %f m\n\nGM= %f m\n\nThe time period of rolling is given as: %f s \n\n",centerOfBuoyancy,centerOfGravity,BG,BM,GM,T),"Result")