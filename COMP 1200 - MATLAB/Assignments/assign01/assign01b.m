%{
Jonathan Leviner
File Name: assign01b.m
COMP1200 - Spring 2019
Program: Quad Eq Roots - multiple equations
Read the coefficients for a quadratic equation
Compute and print the roots
%}
clc, clear all
format compact

% while there is an equation
cont = 1; % flag says to continue
while cont == 1
    % get first coefficient so determinant is not negative
    det = -1; % force into loop with negative determinant
    
    while det < 0
        % get first coefficient not equal to zero
        a = 0; %force into loop
        while a == 0
            a = input( 'Enter 1st coefficient-cannot be zero: ');
        end
        % get second and third coefficients
        b = input( 'Enter 2nd coefficient: ');
        c = input( 'Enter 3rd coefficient: ');
        % compute determinant
        det = b^2 - 4 * a * c;
        if det < 0
            disp( '*** Determinant is negative. ***' )
        end
    end % while det<0
    % compute the roots
    x1 = (-b + sqrt( det ) ) / ( 2 * a );
    x2 = (-b - sqrt( det ) ) / ( 2 * a );
    
    % print coefficients and roots
    fprintf( '\nGiven: a=%4.1f b=%4.1f c=%4.1f \n', a, b, c )
    fprintf( 'Roots: x1=%4.2f x2=%4.2f \n', x1, x2 )
    
    % is there another equation?
    fprintf( '\nDo you want to enter another equation?\n' )
    cont = input( 'Enter 1 to continue or 0 to stop: ')
end % while cont