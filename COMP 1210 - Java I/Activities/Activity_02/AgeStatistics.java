import java.util.Scanner;

   /**
      Program that displays the users name, age, and gender,
      along with calculations for age in minutes and centuries as
      well as max heart rate based on age and gender.
 
      Activity 2
      @author Jonathan Leviner - COMP 1210 - 008
      @version 8/30/2022
   */
  
public class AgeStatistics
{
   /**
      Uses the Scanner class and if/else statements 
      to print and calculate name, age, gender, and max heart rate.
  
      @param args command line statements - not used 
   */

   public static void main(String[] args)
   { 
   
      Scanner userInput = new Scanner(System.in);
      String name = "";
      int ageInYears = 0;
      int gender = 0;
      double maxHeartRate = 0;
   
      // Prompt user for their name.
      System.out.print("Enter your name: ");
      name = userInput.nextLine();
      
      // Prompt user for their age.
      System.out.print("Enter your age in years: ");
      ageInYears = userInput.nextInt();
   
      //Prompt user for their gender.
      System.out.print("Enter your gender (1 for female and 0 for male): ");
      gender = userInput.nextInt();
      
      //Calculate user's age in minutes.
      System.out.println("\tYour age in minutes is "
            + ageInYears * 525600 + " minutes.");
      
      //Calculate user's age in centuries.
      System.out.println("\tYour age in centuries is "
            + (double) ageInYears / 100 + " centuries.");
         
      //Display Max Heart Rate.
      System.out.print("Your max heart rate is ");
      
      //Calculates female MHR.
      if (gender == 1) {
         maxHeartRate = 209 - (0.7 * ageInYears);
      }
      
      //Calculates male MHR.
      else {
         maxHeartRate = 214 - (0.8 * ageInYears);
      }
      
      System.out.println(maxHeartRate + " beats per minute.");
   }

}