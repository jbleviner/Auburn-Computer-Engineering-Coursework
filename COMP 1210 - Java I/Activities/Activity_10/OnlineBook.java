/**
   This program is a representation of an online book item in a store.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public class OnlineBook extends OnlineTextItem
{
   // ===== Instance Variables =====
   
   protected String author;
   
   // ===== Contructor =====
   
   /**
      Constructor for OnlineBook object.
      
      @param nameIn - name of item
      @param priceIn - price of item
   */
   
   public OnlineBook(String nameIn, double priceIn)
   {
      super(nameIn, priceIn);
      author = "Author Not Listed";
   }
   
   /**
      Sets author name.
      
      @param authorIn - an author
   */
   
   public void setAuthor(String authorIn)
   {
      author = authorIn;
   }
   
   /**
      String that represents the aspects of an online book.
      
      @return string value - name of book and author as well as book price
   */
   
   public String toString()
   {
      return name + " - " + author + ": $" + price;
   }
}