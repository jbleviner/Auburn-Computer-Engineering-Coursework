/**
   This program defines an object within the Customer class.

   Activity 7B
   @author Jonathan Leviner - COMP 1210 - 008
   @version 10/18/2022
*/

public class Customer implements Comparable<Customer>
{
   
   // ===== Instance Variables =====
   
   private String name = "";
   private String location = "";
   private double balance = 0;
   
   // ===== Constructor =====
   
   /**
      Constructor for Customer object.
      
      @param nameIn - name of customer
   */
   
   public Customer(String nameIn)
   {
      name = nameIn; // sets name to parameter input
      location = ""; // sets location to empty string
      balance = 0; // sets balance to 0
   }
   
   /**
      Sets the location of the customer.
      
      @param locationIn - name of customer location
   */
   
   public void setLocation(String locationIn) // sets location variable
   {
      if (location != null)
      {
         location = locationIn;
      }
   }
   
   /**
      Changes the customer's balance.
      
      @param amount - balance amount
   */
   
   public void changeBalance(double amount) // add amount to balance
   {
      balance += amount;
   }
   
   /**
      Gets the customer's location.
      
      @return location - location of the customer
   */
   
   public String getLocation() // returns variable for location
   {
      return location;
   }
   
   /**
      Gets the customer's balance.
      
      @return balance - balance of the customer
   */
   
   public double getBalance() // returns variable for balance 
   {
      return balance;
   }
   
   /**
      Sets the location of the customer.
      
      @param city - city
      @param state - state
   */
   
   public void setLocation(String city, String state)
   {
      location = city + ", " + state;
   }
   
   /**
      Creates a string output.
      
      @return output
   */
   
   public String toString()
   {
      String output = name + "\n" + location + "\n$" + balance;
      return output;
   }
   
   /**
      This compares two Customer objects.
      
      @param obj - a Customer object
      @return 0, -1, or 1
   */
   
   public int compareTo(Customer obj)
   {
      if (Math.abs(this.balance - obj.getBalance()) < 0.000001)
      {
         return 0;
      }
      else if (this.balance < obj.getBalance())
      {
         return -1;
      }
      else
      {
         return 1;
      }
   }
}