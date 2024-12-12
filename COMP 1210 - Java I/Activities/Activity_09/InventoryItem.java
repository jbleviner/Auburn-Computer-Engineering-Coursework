/**
   This program is a representation of an inventory item in a store.

   Activity 9
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/1/2022
*/

public class InventoryItem
{
   // ===== Instance Variables =====
   
   protected String name = "";
   protected double price = 0;
   private static double taxRate = 0;
   
   // ===== Contructor =====
   
   /**
      Constructor for InventoryItem object.
      
      @param nameIn - name of item
      @param priceIn - price of item
   */
   
   public InventoryItem(String nameIn, double priceIn)
   {
      name = nameIn;
      price = priceIn;
   }
   
   /**
      Gets item name.
      
      @return name - name of item
   */
   
   public String getName()
   {
      return name;
   }
   
   /**
      Calculates the cost.
      
      @return cost - cost of item plus tax
   */
   
   public double calculateCost()
   {
      double cost = price * (1 + taxRate);
      return cost;
   }
   
   /**
      Set item tax rate.
      
      @param taxRateIn - tax rate
   */
   
   public static void setTaxRate(double taxRateIn)
   {
      taxRate = taxRateIn;
   }
   
   /**
      String representation f InventoryItem with name, price, and tax.
      
      @return name + ": $" + calculateCost() - string
   */
   
   public String toString()
   {
      return name + ": $" + calculateCost();
   }
}