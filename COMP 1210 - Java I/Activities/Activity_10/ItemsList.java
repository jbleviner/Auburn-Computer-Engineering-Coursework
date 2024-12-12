/**
   This program creates a list of objects from the InventoryItem class.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public class ItemsList
{
   // ===== Instance Variables =====   
   
   private InventoryItem[] inventory;
   private int count;

   // ===== Contructor =====
   
   /**
      Constructor for ItemsList object.
   */
   
   public ItemsList()
   {
      inventory = new InventoryItem[20];
      count = 0;
   }
   
   /**
      Adds an item to the list.
      
      @param itemIn - item from inventory
   */
    
   public void addItem(InventoryItem itemIn)
   {
      inventory[count] = itemIn;
      count++;
   }
    
   /**
      Calculate new total.
      
      @param electronicsSurcharge - total electronics surcharge 
      @return total - total  
   */
     
   public double calculateTotal(double electronicsSurcharge)
   {
      double total = 0;
      for (int i = 0; i < count; i++)
      {
         if (inventory[i] instanceof ElectronicsItem)
         {
            total += inventory[i].calculateCost() + electronicsSurcharge;
         }
         else
         {
            total += inventory[i].calculateCost();
         } 
      }
      
      return total;
   }
   
   /**
      String representation of a list of items.
      
      @return output - returns a String output
   */
    
   public String toString()
   {
      String output = "All inventory:\n\n";
    
      for (int i = 0; i < count; i++)
      {
         output += inventory[i] + "\n";
      } 
    
      return output;
   }
}