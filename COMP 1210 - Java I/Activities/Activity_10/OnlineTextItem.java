/**
   This program is a representation of an online text item in a store.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public abstract class OnlineTextItem extends InventoryItem
{
   // ===== Contructor =====
   
   /**
      Constructor for OnlineTextItem object.
      
      @param nameIn - name of item
      @param priceIn - price of item
   */
   
   public OnlineTextItem(String nameIn, double priceIn)
   {
      super(nameIn, priceIn);
   }
   
   /**
      Calculates the new cost of online item.
      
      @return new cost - cost of item including shipping based on weight
   */
   
   public double calculateCost()
   {
      return price;
   }
}