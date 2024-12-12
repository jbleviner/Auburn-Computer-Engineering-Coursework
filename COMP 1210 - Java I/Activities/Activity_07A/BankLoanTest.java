import org.junit.Assert;
//import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

/**
   This program test the methods in BankLoan.java. 
   Specifically the chargeInterest() method.
   
   Activity 7A
   @author Jonathan Leviner - COMP 1210 - 008
   @version 10/11/2022
*/

public class BankLoanTest
{


   /** Fixture initialization (common initialization
    *  for all tests). **/
   @Before public void setUp() {
   }
   
   /**
      Test method for the chargeInterest() method in BankLoan.java.
   */
   
   @Test public void chargeInterestTest()
   {
      BankLoan loan1 = new BankLoan("Jane", .10); 
      loan1.borrowFromBank(1000.00);
      loan1.chargeInterest();
      Assert.assertEquals(" ", 1100, loan1.getBalance(), .000001);
   }
}
