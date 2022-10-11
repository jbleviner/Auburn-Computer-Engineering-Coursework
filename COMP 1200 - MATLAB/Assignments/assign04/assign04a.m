% Brooke Dowdy, none
% none
% assign04a.m
% February 15, 2019
% I used matlab websites to help with switch and while commands.
% Compute ideal body weight

clc, clear all
format compact

%*****INPUT*****
% Until good height, prompt user to enter a value for height in inches
a = input('Enter the height in inches(59-78): ');
while (a < 59 || a > 78)
    a = input('Enter the height in inches(59-78): ');
end
% Until good weight weight, prompt user to enter a value for weight in pounds
b = input('Enter the weight in pounds(90-350): ');
while (b < 90 || b > 350)
    b = input('Enter the weight in pounds(90-350): ');
end
% Until good gender, prompt user to enter the gender (1 or 2)
gender = 4;
while ~(gender >=1 && gender <=2)
gender = input('Is this person a female(1) or male(2)? Enter 1 or 2: ');
end 
disp(' ')

%*****Compute*****
% Compute conversions
h = a * 0.0254;
w = b / 2.2046;

% Calculate the body_mass_index
body_mass_index = ((w) / (h)^2);

% Compute the ideal_body_weight for the given height and gender
switch (gender)
    case {1}
        ideal = 45.5 + 2.3 * (a-60);
    case {2}
        ideal = 50.0 + 2.3 * (a-60);
end

% Compute ideal_body_weight to pounds
b = 2.2046 * ideal;

%*****OUTPUT*****
% Display body_mass_index
X = ['The body_mass_index: ',num2str(body_mass_index)];
disp(X)

% Display body_mass_index classification
disp('body_mass_index classification:');

if body_mass_index < 16.0
    disp('Severely underweight')
elseif body_mass_index < 18.5
    disp('Underweight')
elseif body_mass_index < 25.0
    disp('Normal')
elseif body_mass_index < 30
    disp('Overweight')
elseif body_mass_index < 35
    disp('Moderately obese')
elseif body_mass_index >= 35
    disp('Severely obese')
end

% Display ideal_body_mass
A = ['The ideal weight for ',num2str(a),' inches is ',num2str(b),' pounds.'];
disp(A)