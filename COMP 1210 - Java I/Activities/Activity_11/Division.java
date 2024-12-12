/**
   This program is meant to divide a set of two numbers. The first set is
   divided through integer division, and the second through decimal division.
   
   Activity 11
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/15/2022
*/
 
public class Division
{
   /**
      This method divides two numbers using integer division.
         
      @param num - numerator
      @param denom - denominator
      @return num / denom- the result
   */
   
   public static int intDivide(int num, int denom)
   {
      try
      {
         return num / denom;
      }
      catch (ArithmeticException e)
      {
         return 0;
      }
   }
   
   /**
      This method divides two numbers using decimal division
      through a floating point.
         
      @param num - numerator
      @param denom - denominator
      @return (float) num / denom- the result
      @throws IllegalArgumentException if the denominator is zero
   */
   
   public static float decimalDivide(int num, int denom) 
      throws IllegalArgumentException
   {
      if (denom == 0)
      {
         throw new IllegalArgumentException("The denomiator cannot be zero.");
      }
      
      return (float) num / denom;
   }
}