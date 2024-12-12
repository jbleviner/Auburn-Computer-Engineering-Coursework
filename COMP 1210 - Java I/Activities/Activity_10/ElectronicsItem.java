/**
   This program is a representation of an electonics item in a store.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public class ElectronicsItem extends InventoryItem
{
   // ===== Instance Variables =====
   
   protected double weight = 0.0;
   
   /**
      Constant for SHIPPING_COST.
   */
   
   public static final double SHIPPING_COST = 1.5;
   
   // ===== Contructor =====
   
   /**
      Constructor for ElectronicsItem object.
      
      @param nameIn - name of item
      @param priceIn - price of item
      @param weightIn - weight of item
   */
   
   public ElectronicsItem(String nameIn, double priceIn, double weightIn)
   {
      super(nameIn, priceIn);
      weight = weightIn;
   }
   
   /**
      Calculates the new cost.
      
      @return new cost - cost of item including shipping based on weight
   */
   
   public double calculateCost()
   {
      return super.calculateCost() + (SHIPPING_COST * weight);
   }
}