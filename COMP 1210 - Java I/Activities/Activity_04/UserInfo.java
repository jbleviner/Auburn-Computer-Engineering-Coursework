/**
   This program creates methods that are called on in hte driver class
   UserInfoDriver.java. These methods include:
   setLocation, setAge, getAge, getLocation, logOff, logOn.
   It also creates the object UserInfo.

   Activity 4
   @author Jonathan Leviner - COMP 1210 - 008
   @version 9/12/2022
*/

public class UserInfo
{
   //instance variables
   private String firstName;
   private String lastName;
   private String location;
   private int age;
   private int status;
   private static final int OFFLINE = 0, ONLINE = 1;
   
   //constructor
   
	/**
	   Initialize variables for UserInfo.
	
	   @param firstNameIn - First name of the user
      @param lastNameIn - Last name of the user
	*/
      
   public UserInfo(String firstNameIn, String lastNameIn)
   {
      firstName = firstNameIn;
      lastName = lastNameIn;
      location = "Not specified";
      age = 0;
      status = OFFLINE;
   }
   
   //methods
   
   /**
	   Create a String output.
	   
      @return output - Returns output
	*/
   
   public String toString() 
   {
      String output = "Name: " + firstName + " " + lastName + "\n";
      output += "Location: " + location + "\n";
      output += "Age: " + age + "\n";
      output += "Status: ";
      if (status == OFFLINE)
      {
         output += "Offline";
      }
      else
      {
         output += "Online";
      }
      return output;
   }

   /**
	   Method that sets the location of the user.
	
	   @param locationIn - Location of the user
   */
   
   public void setLocation(String locationIn)
   {
      location = locationIn;
   }
   
   /**
	   Method that sets the age of the user.
	
	   @param ageIn - Age of the user
      @return isSet - Returns the age of the user
   */
   
   public boolean setAge(int ageIn)
   {
      boolean isSet = false;
      if (ageIn > 0)
      {
         age = ageIn;
         isSet = true;
      }
      return isSet;
   }
   
   /**
      Gets the age of the user. 
      
      @return age - Returns age
   */
   
   public int getAge()
   {
      return age;
   }
   
   /**
      Gets location.
      
      @return location - Returns location
   */
    
   public String getLocation()
   {
      return location;
   }
   
   /**
      Sets status to Offline.
   */
   
   public void logOff()
   {
      status = OFFLINE;
   }
   
   /**
      Sets status to Online.
   */
   
   public void logOn()
   {
      status = ONLINE;
   }
   
}