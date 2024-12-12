/**
   This driver program uses the InventoryItem, ElectronicsItem, OnlineTextItem,
   OnlineArticle, and OnlineBook classes to prinnt out a sumamry of different
   items for sale in this pseudo store.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public class InventoryApp
{
/**
   Prints different items from a store and specific information about them.
      
   @param args command line arguments - not used 
*/

   public static void main(String[] args)
   {
      InventoryItem.setTaxRate(0.05);
      
      InventoryItem item1 = new InventoryItem("Oil change kit", 39.00);
      System.out.println(item1);
      
      ElectronicsItem item2 = new ElectronicsItem("Cordless phone", 80.00, 1.8);
      System.out.println(item2);
      
      OnlineArticle item3 = new OnlineArticle("Java News", 8.50);
      item3.setWordCount(700);
      System.out.println(item3);
      
      OnlineBook item4 = new OnlineBook("Java for Noobs", 13.37);
      item4.setAuthor("L. G. Jones");
      System.out.print(item4);
   }
}