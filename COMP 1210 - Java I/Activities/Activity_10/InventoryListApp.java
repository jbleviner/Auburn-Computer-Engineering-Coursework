/**
   This program prints a list of inventory items that have been added to the
   list object titled "myList".

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/
 
public class InventoryListApp
{
   /**
      Instantiates and prints out an ItemsList object called myItems.
      
      @param args command line arguments - not used
   */
 
   public static void main(String[] args)
   {
      
      // Create myItems list and set the tax rate
      ItemsList myItems = new ItemsList();
      InventoryItem.setTaxRate(0.05);
      
      // Add things to myItems and print
      myItems.addItem(new ElectronicsItem("laptop", 1234.56, 10));
      myItems.addItem(new InventoryItem("motor oil", 9.8));
      myItems.addItem(new OnlineBook("All Things Java", 12.3));
      myItems.addItem(new OnlineArticle("Useful Acronyms", 3.4));
      
      System.out.println(myItems.toString());
      
      // Prints the total of all the items above
      System.out.print("Total: " + myItems.calculateTotal(2.0));
   }
}