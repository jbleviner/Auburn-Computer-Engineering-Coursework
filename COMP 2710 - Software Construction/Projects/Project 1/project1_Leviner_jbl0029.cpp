// Jonathan Leviner (jbl0029@auburn.edu)
// AU ID: jbl0029
// project1_Leviner_jbl0029.cpp
// How to compile:
//      g++ project1_Leviner_jbl0029.cpp
//      Then run "./a.out" in the terminal.
// This is a program designed to give the user information
// about a loan based on the interest rate, loan amount,
// as well as monthly payments.
// Sources:
// - Dr. Li's Project1_hints.pdf
// - "Absolute C++" Textbook by Savitch
// - Stack Overflow

#include <iostream>
using namespace std;

int main()
{
    // VARIABLE INITIALIZATION
    float loan = 0;     // starting amount
    float loanAmount = 0;   // new amount used for calculations
    float interestRate = 0;     // yearly interest rate
    float interestRateC = 0;    // yearly rate used for calculations
    float payment = 0;      // loan * interestRateC
    float monthlyPaid = 0;      // monthly payment value
    int currentMonth = 0;
    float interestTotal = 0;    // total interest paid

    // CURRENCY FORMATTING
    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(2);

    // USER INPUT
    // NOTE: For valid input, the loan, interest, and monthly payment must
    // be positive. The monthly payment must also be large enough to
    // terminate the loan.

    // This gets the loan amount.
    cout << "\nLoan Amount: ";
    cin >> loan;
    if (loan < 0)    // will not proceed if loan is negative
    {
        cout << "Loan Amount must be positive. Please re-enter value: ";
        cin >> loan;
    }
    loanAmount = loan;  // set loanAmount to the value in loan

    // This gets the yearly interest rate.
    cout << "Interest Rate (% per year): ";
    cin >> interestRate;
    if (interestRate < 0)    // will not proceed if interest rate is negative
    {
        cout << "Interest Rate must be positive. Please re-enter value: ";
        cin >> interestRate;
    }

    // GET PROPER INTEREST RATES FOR CALCULATIONS
    interestRate /= 12;     // converts yearly rate to monthly rate
    interestRateC = interestRate / 100;     // deals with percentages

    // This gets the how much is paid monthly.
    // payment = loanAmount * interestRateC;
    cout << "Monthly Payments: ";
    cin >> monthlyPaid;
    if (monthlyPaid <= (loan * interestRateC) || monthlyPaid < 0)  // must be positive and larger than monthly interest
    {
        while (monthlyPaid < (loan * interestRateC))
        {
            cout << "Monthly Payment must be positive and larger than monthly interest.";
            cout << "\nPlease re-enter Monthly Payment: ";
            cin >> monthlyPaid;
        }
    }
    
    cout << endl;

    // AMORTIZATION TABLE
    cout << "*****************************************************************\n"
         << "\tAmortization Table\n"
         << "*****************************************************************\n"
         << "Month\tBalance\t\tPayment\tRate\tInterest\tPrincipal\n";

    // LOOP TO FILL TABLE
    while (loanAmount > 0) 
    {
        // takes care of the first line in the output
        if (currentMonth == 0)
        {
            cout << currentMonth++ << "\t$" << loanAmount;
            
            if (loanAmount < 1000) cout << "\t";  // Formatting MAGIC
            cout << "\t" << "N/A\tN/A\tN/A\t\tN/A\n";
        }
        else    // calculations and rest of display
        {
            // calculate
            payment = loanAmount * interestRateC;
            float principal = monthlyPaid - payment;
            if (loanAmount > monthlyPaid)   // last payment value
            {
                loanAmount = loanAmount - principal;
            }
            else {
                principal = loanAmount;
                monthlyPaid = loanAmount + payment;
                loanAmount = 0;
            }

            // formatting the table
            if (loanAmount < 1000) 
            {
                cout << currentMonth++ 
                    << "\t$" << loanAmount
                    << "\t\t$" << monthlyPaid
                    << "\t" << interestRate
                    << "\t$" << payment
                    << "\t\t$" << principal << "\n";
            }
            else {
                cout << currentMonth++
                    << "\t$" << loanAmount
                    << "\t$" << monthlyPaid
                    << "\t" << interestRate
                    << "\t$" << payment
                    << "\t\t$" << principal << "\n";
            }
        }

        interestTotal = interestTotal + payment;    // calculates final total interest
    }

    // DISPLAY SUMMARY
    cout << "****************************************************************\n";
    cout << "\nIt takes " << --currentMonth << " months to pay off "
         << "the loan.\n"
         << "Total interest paid is: $" << interestTotal;
    cout << endl << endl;
    return 0;
}