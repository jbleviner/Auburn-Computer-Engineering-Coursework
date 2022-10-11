%{
Joe Wachter and Jonathan Leviner, i_assign03 48
File Name: assign03b.m
02/08/2019
COMP1200 - Spring 2019

%}

clc, clear all
format compact
format short

disp ('Welcome to the BMI Calculator')

%*****INPUT*****
weight= input ('Enter all Weights in lbs:');
height= input ('Enter all Heights in Inches:');

%*****CONVERSIONS*****
newWeight = weight.* 0.45359237;     %Converting kilograms to pounds
newHeight = height.* 0.0254;      %Converting meters to inches

finalHeight= (newHeight.*newHeight);
bmi= (newWeight./finalHeight);

%****FINDING NORMAL BMI****
nonNormal = find();
disp('The BMI are: ') 
disp(bmi)
disp('People with non-normal BMI: ')
disp(nonNormal)
