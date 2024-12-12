import java.util.Scanner;
/**
   This program reads an input from the user and then requires the user
   to enter a number between 0 and 5. The following will happen based on
   the number entered by user:
   1 - the message will be printed trimmed.
   2 - the message will be printed in lower case.
   3 - the message will be printed in upper case.
   4 - the message will be printed with all vowels replaced with underscores.
   5 - the message will be printed without the first and last character.
   Any other number should generate an appropriate message.   
   
   Activity 3 (your activity or project number goes here).
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/6/2022
*/

public class MessageConverter
{
	/**
      Asks user for a message. The message will be modified and printed based
      on the users second input.
      
      @param args Command line arguments – not used.
	*/
      
   public static void main(String[] args)
   {
      Scanner userInput = new Scanner(System.in);
      String message = "";
      int outputType;
      String result = "";
      //Asks user for a message.
      System.out.print("Type in a message and press enter:\n\t> ");
      message = userInput.nextLine();
      
      //Displays options to edit users message and asks for second input.
      System.out.print("\nOutput types:" 
         + "\n\t0: As is"
         + "\n\t1: Trimmed"
         + "\n\t2: lower case"
         + "\n\t3: UPPER CASE"
         + "\n\t4: v_w_ls r_pl_c_d"
         + "\n\t5: Without first and last character" 
         + "\nEnter your choice: ");
      
      outputType = Integer.parseInt(userInput.nextLine());
      
      //Stores "result" variable based on user input.
      if (outputType == 0) { //as is
         result = message;
      }
      else if (outputType == 1) { //trimmed
         result = message.trim();
      }
      else if (outputType == 2) { //lower case 
         result = message.toLowerCase();
      }
      else if (outputType == 3) { //upper case 
         result = message.toUpperCase();
      }
      else if (outputType == 4) { //replace vowels 
         result = message.replace('a', '_');
         result = result.replace('e', '_');
         result = result.replace('i', '_');
         result = result.replace('o', '_');
         result = result.replace('u', '_');
      }
      else if (outputType == 5) { //without first and last character
         result = message.substring(1, message.length() - 1);
      }
      else { //invalid input
         result = "Error: Invalid choice input.";
      }
      //prints new message 
      System.out.print("\n" + result);
   }
}