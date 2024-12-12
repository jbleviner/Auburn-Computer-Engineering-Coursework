/**
   This program is a representation of an online article item in a store.

   Activity 10
   @author Jonathan Leviner - COMP 1210 - 008
   @version 11/8/2022
*/

public class OnlineArticle extends OnlineTextItem
{
   // ===== Instance Variables =====
   
   private int wordCount;
   
   // ===== Contructor =====
   
   /**
      Constructor for OnlineArticle object.
      
      @param nameIn - name of item
      @param priceIn - price of item
   */
   
   public OnlineArticle(String nameIn, double priceIn)
   {
      super(nameIn, priceIn);
      wordCount = 0;
   }
   
   /**
      Sets the word count of an article.
                  
      @param wordCountIn - word count of an article
   */
   
   public void setWordCount(int wordCountIn)
   {
      wordCount = wordCountIn;
   }
}