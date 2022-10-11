%{
Jonathan Leviner and Joe Wachter, i_assign02 88
File Name: assign02a.m
02/01/2019
COMP1200 - Spring 2019
Jonathan typed out the program and did some troubleshooting, Joe checked off intructions, found the
conversions and equations, and did some extra research.

This program takes an input from the user of their weight and height
and displays their BMI (Body Mass Index)
%}

% BMI = mass / height^2  =  (kg/m^2)

clc, clear all
format long
format compact

disp('Welcome to the BMI Calculator')
disp(' ')

% *****INPUTS*****
Weight = input('Enter your weight in pounds (lbs): ');
Height = input('Enter your height in inches (in): ');

%*****CONVERSIONS*****
newWeight = Weight * 0.45359237;    %Converting pounds to kilograms (for the equation)
newHeight = Height * 0.0254;        %Converting inches to meters (for the equation)

%*****CALCULATIONS*****
bmi = newWeight/(newHeight^2) ;
x = bmi;    % set BMI to x

%*****OUTPUT*****
disp('Your Body Mass index is: ')
disp(x)