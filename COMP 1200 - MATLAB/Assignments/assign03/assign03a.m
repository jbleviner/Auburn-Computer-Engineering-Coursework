%{
Joe Wachter and Jonathan Leviner, i_assign03 48
File Name: assign03a.m
02/08/2019
COMP1200 - Spring 2019


This program take the users input of a weight and height and converts 
them into a BMI number and what category of the index them fall under
%}

clc, clear all
format long
format compact

disp ('Welcome to the BMI Calculator');
disp ('')

% *****INPUTS*****
Weight = input('Enter your weight in pounds (lbs): ');
Height = input('Enter your height in inches (in): ');


%*****CONVERSIONS*****
newWeight = Weight* 0.45359237;     %Converting kilograms to pounds
newHeight = Height*0.0254;      %Converting meters to inches

%*****CALCULATIONS*****
bmi = (newWeight)/((newHeight)^2) ;
x = bmi;    % set BMI to x

%*****OUTPUT*****
disp('Your Body Mass Index is: ')
disp(num2str(x))
disp ('')
disp ('BMI Classification:')   %Set which category the BMI falls under
if x < 16.0
    disp ('severly underweight')
elseif x< 18.5
    disp ('underweight')
elseif x< 25
    disp ('Normal')
elseif x< 30
    disp ('Overweight')
elseif x< 35
    disp ('Moderatly Obese')
else 
    disp ('Severly Obese')
end