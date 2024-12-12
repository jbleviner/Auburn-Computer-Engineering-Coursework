/**
   This program calls on the methods from UserInfo.java and creates user
   objects. It creates instances of UserInfo in order to call its methods.

   Activity 4
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/12/2022
*/

public class UserInfoDriver
{

   /**
      Driver method: Calls on UserInfo.java to create users.
      
      @param args command line arguments - not used 
   */ 
   
   public static void main(String[] args) 
   {
      UserInfo user1 = new UserInfo("Pat", "Doe");
      System.out.println("\n" + user1);
      user1.setLocation("Auburn");
      user1.setAge(19);
      user1.logOn();
      System.out.println("\n" + user1);
      
      UserInfo user2 = new UserInfo("Sam", "Jones");
      System.out.print("\n" + user2);
      user2.setLocation("Atlanta");
      user2.setAge(21);
      user2.logOn();
      System.out.println("\n" + user2); 
   }
}