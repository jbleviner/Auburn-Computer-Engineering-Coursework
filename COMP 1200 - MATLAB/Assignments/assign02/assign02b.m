%{
Jonathan Leviner and Joe Wachter, i_assign02 88
File Name: assign02b.m
02/01/2019
COMP1200 - Spring 2019
Both Joe and Jonathan worked out the program separately and got the same
results. They fine-tuned the final program together.

This program recieves an input from the user of their height in inches and
actual BMI, and outputs a target weight.
%}

% mass = BMI * height^2 

clc, clear all
format short
format loose

disp('Welcome to the Weight Calculator')
disp(' ')

%*****INPUTS*****
Height = input('Enter your height in inches (in): ');
targetBMI = input('Enter your target BMI: ');

%*****COMPUTE*****
newHeight = Height * 0.0254;            % Height conversion from inches to meters
Weight = targetBMI * (newHeight^2);     % Weight calculation
newWeight = Weight * 2.20462;           % Weight conversion from kilograms to pounds

%*****OUTPUT*****
disp('Your Target Weight is: ')
disp(newWeight)