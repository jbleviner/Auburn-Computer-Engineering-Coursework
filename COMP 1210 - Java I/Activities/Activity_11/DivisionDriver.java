import javax.swing.JOptionPane;
/**
   This program is the driver class for the Division class. It prints the
   results of the integer and decimal division done in that class.
   
   Activity 11
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/15/2022
*/
 
public class DivisionDriver
{
   /**
      Ask user for a numerator and then a denominator. It then prints the
      results of the integer and decimal division done by the two numbers.
         
      @param args command line arguments - not used
   */
   
   public static void main(String[] args)
   {
      String numInput = JOptionPane.showInputDialog("Enter the numerator:");
      String denomInput = JOptionPane.showInputDialog("Enter the denominator:");
      
      try
      {
         int num = Integer.parseInt(numInput);
         int denom = Integer.parseInt(denomInput);
         
         String result = "Integer division: \n"
            + Division.intDivide(num, denom)
            + "\n\nFloating point division: \n"
            + Division.decimalDivide(num, denom);
         
         JOptionPane.showMessageDialog(null, result,
            "Result", JOptionPane.PLAIN_MESSAGE);
      }
      catch (NumberFormatException e)
      {
         JOptionPane.showMessageDialog(null,
            "Invalid input: Enter numerical integer values only.",
            "error", JOptionPane.ERROR_MESSAGE);
      }
      catch (IllegalArgumentException e)
      {
         JOptionPane.showMessageDialog(null,
            e, "Error", JOptionPane.ERROR_MESSAGE);
      }
   }
}