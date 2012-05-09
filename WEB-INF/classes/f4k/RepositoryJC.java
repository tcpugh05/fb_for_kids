/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package f4k;
import java.util.Date;
import java.util.HashMap;
/**
 * Holds all Users and Clubs 
 * @author JC
 * 
 
 */
public class RepositoryJC { 

private HashMap<String, User> users = new HashMap<String, User>();
private static Repository theInstance = null;
public User userclass = new User("this");
public Club clubclass = new Club();
private HashMap<String, Club> clubs = new HashMap<String, Club>();
/**
     * Check string username against HashMap<String, User> users for current users 
 *   * with the same name and if there are none, create a new User object and store 
 *   * the username, password and dateOfBirth within the variables. 
     * @author JC
     * @param password String object for the user's private password used to login
     * @param username String object for the user's publicly displayed username used to login and label the user
     * @param dateOfBirth Date object for the system's private records and login eligibility
     * @return User type that was just created containing the password, username, and dateOfBirth
     */    
    private User createNewUser(String username, String password, Date dateOfBirth){
	return userclass;
    }
    
    /**
     * Takes a username String object and returns the User object attached to it
     * Given the String username variable, implement the user hashmap's get(String s) 
     * method to return the User object key stored within.
     * @author JC
     * @param username String object of the username variable stored within the User object being returned
     * @return User object or null if there is no User object associated with the key username String object.
     * @see java.util.HashMap#get(java.lang.Object) 
     */
    public User getUser(String username){
        return userclass;
    }
 
    /**
     * Return the HashMap<String, User> users of User objects in which the username is the String and the User object is the value or null if there are none.
     * @author JC
     * @return HashMap<String, User> users containing every User object instantiated, or null if there are none.
     */
    public HashMap<String, User> getAllUsers(){
        return users;
    }
    
    /**
     * Creates a singleton of the class Repository or it returns the one instance of the variable of the repository as well as calls the method bootstrap().
     * @throws FileNotFoundException if the file in which bootstrap is operating is not located at the given filepath.
     * @throws IOException if a line read from a file in Bootstrap is null. 
     * @return theInstance the singleton instance of the Repository class.
     */
    public static Repository instance(){
        if(theInstance == null){
            theInstance = new Repository();
            System.out.println("I am about to call bootstrap.");
           ////////////////////// Repository.instance().bootstrap();
        }
        return theInstance;
    }
    
    /**
     * Loads User and Group objects from file into the system.
     * Loads all User objects' usernames, passwords, and dateOfBirths. 
     * Sends each User object to load() for the rest of the User object's variables. 
     * Loads all Club objects' nameOfClub from file into the system then sends every Club object to load().
     * @author JC
     * @see f4k.User.load(java.lang.Object)
     * @see f4k.Club.load(java.lang.Object)
     * 
     */
    public void bootstrap(){
        
    }
    
    /**
     * Takes a clubname String object and returns the Club object attached to it
     * Given the String clubname variable, implement the user hashmap's get(String s) 
     * method to return the Club object key stored within.
     * @author JC
     * @param clubname String object of the variable stored within the Club object being returned
     * @return Club object or null if there is no Club object associated with the key clubname String object.
     * @see java.util.HashMap#get(java.lang.Object)   
     */
    public Club getClub(String clubname){
        return clubclass;
    }
    
    /**
     * Return the HashMap<String, Club> clubs of Club objects in which String is the clubname and Club is the value or it returns null if there are none instantiated..
     * @author JC
     * @return HashMap<String, Club> clubs containing every User object instantiated, or null if there are none.
     */
    public HashMap<String,Club> getAllClubs(){
        return clubs;
    }
    
}



