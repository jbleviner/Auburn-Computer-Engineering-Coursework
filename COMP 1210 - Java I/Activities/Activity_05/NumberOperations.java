/**
   Program that defines a NumberOperations object 
   referenced by numbers. 
   
   Activity 5
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/19/2022
*/

public class NumberOperations
{

// ===== Instance Variables =====

   private int number;
   
   // ===== Constructor =====
   
   /**
      Constructor that defines NumberOperations Objects.
      
      @param numberIn - a number
   */
   
   public NumberOperations(int numberIn)
   {
      number = numberIn;
   }
   
   // ===== Methods =====
   
   /**
      Method to get number value.
      
      @return number - returns a number
   */
   
   public int getValue()
   {
      return number;
   }
   
   /**
      Method to find all odd numbers under 'number'.
      
      @return output - returns a list of numbers
   */ 
   
   public String oddsUnder()
   {
      String output = "";
      int i = 0;
      
      while (i < number)
      {
         if (i % 2 != 0)
         {
            output += i + "\t";
         }
         
         i++;
      }
      
      return output;
   } 
   
   /**
      Method to find all powers of 2 under 'number'.
      
      @return output - returns a list of numbers
   */
    
   public String powersTwoUnder()
   {
      String output = "";
      int powers = 1;
   
      while (powers < number)
      {
         output += powers + "\t";
         powers = powers * 2;
      }
   
      return output;
   }
   
   /**
      Method to compare two numbers.
      
      @param compareNumber - a number
      @return 1 - returns indication of comparison  
   */
   
   public int isGreater(int compareNumber)
   {
      if (number > compareNumber)
      {
         return 1;
      }
      else if (number < compareNumber)
      {
         return -1;
      }
      else
      {
         return 0;
      } 
   }
   
   /**
      Method to give the NumberOperations object 
      a string value.
      
      @return number + "" - returns String 
   */
   
   public String toString()
   {
      return number + "";
   } 
}