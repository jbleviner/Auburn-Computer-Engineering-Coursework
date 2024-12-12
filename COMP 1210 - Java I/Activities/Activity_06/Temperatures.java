import java.util.ArrayList;

/**
   This program holds a set of integer values to be used in
   TemperatureInfo.java that represent daily temperatures.
   
   Activity 6
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/27/2022
*/
 
public class Temperatures
{
   
   // ===== Instance Variables =====
   
   private ArrayList<Integer> temperatures;
   
   // ===== Constructor =====
      
   /**
      Constructor for initializing Temperatures object.
      
      @param temperaturesIn - an ArrayList of temperatures
   */

   public Temperatures(ArrayList<Integer> temperaturesIn)
   {
      temperatures = temperaturesIn;
   }
   
   // ===== Methods =====
   
   /**
      Method for getting the lowest temperature.
      
      @return low - returns the lowest temperature
   */
    
   public int getLowTemp()
   {
      if (temperatures.isEmpty())
      {
         return 0;
      }
      
      int low = temperatures.get(0);
      for (int i = 0; i < temperatures.size(); i++)
      {
         if (temperatures.get(i) < low)
         {
            low = temperatures.get(i);
         }
      }
      
      return low;
   }
   
   /**
      Method for getting the highest temperature.
      
      @return high - returns highest temperature
   */
       
   public int getHighTemp()
   {
      if (temperatures.isEmpty())
      {
         return 0;
      }
      
      int high = temperatures.get(0);
      for (Integer temp : temperatures)
      {
         if (temp > high)
         {
            high = temp;
         } 
      }
      
      return high;
   }
    
   /**
      Method that takes an int value and returns the parameter if 
      it is lower than the value returned by getLowTemp. 
      Otherwise, it returns the return of getLowTemp.
   
      @param lowIn - a temperature value 
      @return lowIn or getLowTemp()
   */
     
   public int lowerMinimum(int lowIn)
   {
      return lowIn < getLowTemp() ? lowIn : getLowTemp();
   }
   
   /**
      Method that takes an int value and returns the parameter 
      if it is greater than than the value returned by getHighTemp. 
      Otherwise, it returns the return of getHighTemp.
      
      @param highIn - a temperature value
      @return highIn or getHighTemp()
   */
    
   public int higherMaximum(int highIn)
   {
      return highIn > getHighTemp() ? highIn : getHighTemp();
   }
   
   /**
      Creates a String representation of Temperatures.
      
      @return "" - returns a string
   */
    
   public String toString()
   {
      return "\tTemperatures: " + temperatures
         + "\n\tLow: " + getLowTemp()
         + "\n\tHigh: " + getHighTemp();
   }
}