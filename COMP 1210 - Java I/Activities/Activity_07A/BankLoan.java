/**
   This program defines the parameters of a bank loan.
   
   Activity 7A
   @author Jonathan Leviner - COMP 1210 - 008
   @version 10/11/2022
*/

public class BankLoan
{
	// Constant Fields
   private static final int MAX_LOAN_AMOUNT = 100000;

   // Instance Variables (can be used within the class)
   private String customerName;
   private double balance, interestRate;
   private static int loansCreated = 0;
   
   // Constructor
   /**
      Constructor for BankLoan object.
      
      @param customerNameIn - input name of customer
      @param interestRateIn - input interest rate
   */
   
   public BankLoan(String customerNameIn, double interestRateIn)
   { 
      customerName = customerNameIn;
      interestRate = interestRateIn;
      balance = 0;
      loansCreated++;
   }
   
   // Methods
   /**
      Method that checks if any money was borrowed.
      
      @param amount - money
      @return wasLoanMade - returns true or false based on if the loan was made
   */
   
   public boolean borrowFromBank(double amount)
   {
      boolean wasLoanMade = false;
      
      if (balance + amount < MAX_LOAN_AMOUNT)
      {
         wasLoanMade = true;
         balance += amount;
      }
   
      return wasLoanMade;
   }
   
   /**
      Method to calculate the amount paid to the bank.
      
      @param amountPaid - the amount that was paid
      @return 0 - returns the amount paid
   */
   
   public double payBank(double amountPaid)
   {
      double newBalance = balance - amountPaid;
      if (newBalance < 0)
      {
         balance = 0;
         // paid too much, return the overcharge
         return Math.abs(newBalance);
      }
      else
      {
         balance = newBalance;
         return 0;
      }
   }
   
   /**
      Method that gets the current balance. 
      
      @return balance - returns the current balance
   */
   
   public double getBalance()
   {
      return balance;
   }
   
   /**
      Method that sets the interst rate.
      
      @param interestRateIn - interest
      @return true or false
   */
   
   public boolean setInterestRate(double interestRateIn)
   {
      if (interestRateIn >= 0 && interestRateIn <= 1)
      {
         interestRate = interestRateIn;
         return true;
      }
      else
      {
         return false;
      }
   }
   
   /**
      Method that gets the interest rate.
      
      @return interestRate - returns the interest rate
   */
   
   public double getInterestRate()
   {
      return interestRate;
   }
   
   /**
      Method that calculates the amount of interest based on the balance.
   */
   
   public void chargeInterest()
   {
      balance = balance * (1 + interestRate);
   }
   
   /**
      Method that converts BankLoan objects to a String.
      
      @return output - returns the output
   */
   
   public String toString()
   {
      String output = "Name: " + customerName + "\r\n" 
         + "Interest rate: " + interestRate + "%\r\n" 
         + "Balance: $" + balance + "\r\n";
      return output;
   }
   
   /**
      Method that checks if the amount is greater than zero.
      
      @param amount - money
      @return true or false
   */
   
   public static boolean isAmountValid(double amount)
   {
      return amount >= 0;
   }
   
   /**
      Method that checks if the customer is in debt based on their balance.
      
      @param loan - bank loan
      @return true or false
   */
   
   public static boolean isInDebt(BankLoan loan)
   {
      if (loan.getBalance() > 0)
      {
         return true;
      }
      return false;
   }
   
   /**
      Method that gets a count of how many loans have been created.
      
      @return loansCreated - number of loans
   */
   
   public static int getLoansCreated()
   {
      return loansCreated;
   }
   
   /**
      Method that resets the "loansCreated" count.
   */
   
   public static void resetLoansCreated()
   {
      loansCreated = 0;
   }
}
