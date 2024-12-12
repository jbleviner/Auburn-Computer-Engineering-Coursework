/**
   This program defines methods that get the even and odd numbers from
   an array and uses those numbers to calculate the array's average.
   It also prints the array and its numbers in a forward and reverse
   String format.

   Activity 8
   @author Jonathan Leviner - COMP 1210 - 008
   @version 10/25/2022
*/

public class Scores
{
   // ===== Instance Variables =====
   
   private int[] numbers;
   
   // ===== Constructor =====
   
   /**
      Constructor for Scores object.
      
      @param numbersIn - numbers
   */
   
   public Scores(int[] numbersIn)
   {
      numbers = numbersIn;
   }
   
   // ===== Methods =====
   
   /**
      Method that finds the even numbers in Scores.
      
      @return evens - even numbers
   */
   
   public int[] findEvens()
   {
      int numberEvens = 0;
      
      for (int i = 0; i < numbers.length; i++)
      {
         if (numbers[i] % 2 == 0)
         {
            numberEvens++;
         }
      }
      
      int[] evens = new int[numberEvens];
      
      int count = 0;
      for (int i = 0; i < numbers.length; i++)
      {
         if (numbers[i] % 2 == 0)
         {
            evens[count] = numbers[i];
            count++;
         }
      }
      
      return evens;
   }
   
   /**
      Method that finds the odd numbers in Scores.
      
      @return odds - odd numbers
   */
   
   public int[] findOdds()
   {
      int numberOdds = 0;
      
      for (int i = 0; i < numbers.length; i++)
      {
         if (numbers[i] % 2 == 1)
         {
            numberOdds++;
         }
      }
      
      int[] odds = new int[numberOdds];
      
      int count = 0;
      for (int i = 0; i < numbers.length; i++)
      {
         if (numbers[i] % 2 == 1)
         {
            odds[count] = numbers[i];
            count++;
         }
      }
      
      return odds;
   }
   
   /**
      Method that calculates the average.
      
      @return (double) sum / numbers.length
   */
   
   public double calculateAverage()
   {
      int sum = 0;
      
      for (int i = 0; i < numbers.length; i++)
      {
         sum += numbers[i];
      }
      
      return (double) sum / numbers.length;
   }
   
   /**
      Method that creates a string output.
      
      @return result - string value
   */
   
   public String toString()
   {
      String result = "";
      
      for (int i = 0; i < numbers.length; i++)
      {
         result += numbers[i] + "\t";
      }
      
      return result;
   }
   
   /**
      Method that creates a string output in reverse.
      
      @return result - reverse string value
   */
   
   public String toStringInReverse()
   {
      String result = "";
      
      for (int i = numbers.length - 1; i >= 0; i--)
      {
         result += numbers[i] + "\t";
      }
      
      return result;
   }
}