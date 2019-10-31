%Example 4.13
%CE F231 Fluid Mechanics Project
%Done by: M Harikesha, Nipun Tewari, Hridik Punukollu

%Taking input for the problem parameters
a= input('Enter the length of the side of square in meters: ');
s= input('Enter the specific gravity of material: ');
w= 1;
G= input('Enter the specific weight of water: ');
g= 9.81;

%Doing the required calculations to the obtained values.
fprintf ('Let depth of immersion be "x" and length of the log be "l" \n');
x= s*a;
OB= x/2;
OG= a/2;
BG= OG-OB;

%Displaying the calculated values.
fprintf ('The center of buoyancy is: %f m\n', OB); 
fprintf ('The center of gravity is: %f m\n', OG); 
fprintf ('BG = %f m\n', BG);

%Performing some more calculations
I= (1/12)*a^3;
V= a*x;

%Displaying results
BM= I/V;
fprintf ('BM= %f m\n\n', BM);
GM= BM-BG;
fprintf('GM= %f m\n\n', GM);
T = 6.28*(((a^2/12)/(g*GM))^0.5);

fprintf('The time period of rolling is given as: %f s \n\n', T);