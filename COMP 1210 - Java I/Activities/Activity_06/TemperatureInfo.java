import java.util.Scanner;
import java.util.ArrayList;

/**
   This program allows lets the user interact with the Temperatures.java class.
   
   Activity 6
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/27/2022
*/

public class TemperatureInfo
{

   /**
      Asks user for a list of temperatures 
      and allows them to get info about their temps.
      
      @param args line arguments - not used 
   */
   
   public static void main(String[] args)
   {
      
      Scanner userInput = new Scanner(System.in);
      ArrayList<Integer> tempList = new ArrayList<Integer>();
      
      String tempInput = "";
      
      // Ask user for temperatures or none at all
      
      do {
         System.out.print("Enter a temperature (or nothing to end list): ");
         tempInput = userInput.nextLine().trim();
         if (!tempInput.equals(""))
         {
            tempList.add(Integer.parseInt(tempInput));
         }
        
      } while (!tempInput.equals(""));
      
      Temperatures temps = new Temperatures(tempList);
      
      // Create Menu for UserInput
      
      char choice = 'E';
      do {
         System.out.print("Enter choice - [L]ow temp, "
            + "[H]igh temp, [P]rint, [E]nd: ");
         choice = userInput.nextLine().toUpperCase().charAt(0);
         switch (choice)
         {
            case 'L':
               System.out.println("\tLow is " + temps.getLowTemp());
               break;
         
            case 'H':
               System.out.println("\tHigh is " + temps.getHighTemp());
               break;
               
            case 'P':
               System.out.println(temps);
               break;
               
            case 'E':
               System.out.println("\tDone");
               break;
         
            default:
               System.out.println("\tInvalid choice!");
         }
         
      } while (choice != 'E');
   }
}