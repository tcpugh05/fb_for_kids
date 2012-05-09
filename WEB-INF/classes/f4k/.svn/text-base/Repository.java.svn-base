/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Holds all Users and Clubs 
 * @author JC
 * 
 
 */
package f4k;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.FilenameFilter;
import java.lang.String;
public class Repository {
    

private HashMap<String, User> users = new HashMap<String, User>();
private ArrayList<String> usernameStorage = new ArrayList<String>();
private ArrayList<String> clubnameStorage= new ArrayList<String>();
private static Repository theInstance;
private HashMap<String, Club> clubs = new HashMap<String, Club>();
/**
     * Make a new User with the given password and username String variables.
     * Create a new User object and store the username, password and dateOfBirth within the variables. 
     * @param password String object for the user's private password used to login
     * @param username String object for the user's publicly displayed username used to login and label the user
     * @param dateOfBirth Date object for the system's private records and login eligibility
     * @return User type that was just created containing the password, username, and dateOfBirth
     */    
    public User createNewUser(String username, String password, Date dateOfBirth){
		User u = new User(dateOfBirth,username,password);
		users.put(username,u);
		usernameStorage.add(username);
		return u;	
    }
   public void createNewClub(Club theClub){
	clubs.put(theClub.getClubName(),theClub);
	clubnameStorage.add(theClub.getClubName());
}	
     public int matches(String aa, String bb){
	char a [] = aa.toCharArray();
	char b [] = bb.toCharArray();
		int matches = 0;
		for(int i = 0; i< aa.length(); i++){
			for(int j = 0; j<bb.length();j++){
				if(a[i] == b[j]){
				matches++;
				}
		}
	}
		return matches;
	}
   public static  synchronized Repository instance(){
	if(theInstance == null){
		theInstance = new Repository();
		theInstance.bootstrap();	
		}
		return theInstance;
	}
   
	public ArrayList<String> getAllClubnames(){
		return clubnameStorage;
		}
   public ArrayList<String> getAllUsernames(){
		//ArrayList<String> usernames = new ArrayList<String>();
		return usernameStorage;	
	} 	
    /**
     * Takes a username String object and returns the User object attached to it
     * Given the String username variable, implement the user hashmap's get(String s) 
     * method to return the User object key stored within.
     * @param username String object of the username variable stored within the User object being returned
     * @return User object or null if there is no User object associated with the key username String object.
     */
    public User getUser(String username){
        return users.get(username);
    }
    
    /**
     * Return the hashmap of User objects.
     * Returns the hashmap of every User object instantiated, or null is there 
     * are no User objects instantiated.
     * @return User hashmap containing every User object instantiated, or null if there are none.
     */
    public HashMap<String, User> getAllUsers(){
        return users;
    }
    
    /**
     * Loads User and Group objects from file into the system.
     * Loads all User objects' usernames, passwords, and dateOfBirths. 
     * Sends each User object to load() for the rest of the User object's variables. 
     * Loads all Club objects' nameOfClub from file into the system then sends every Club object to load().
     * 
     */
    private void bootstrap(){
	File f = new File("../webapps/f4k/persistence/");

        String[] userFiles = f.list(
            new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    if (name.endsWith(".user")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            }); 
	
        String[] profileFiles = f.list(
            new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    if (name.endsWith(".profile")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            });  

        String[] hangmanFiles = f.list(
            new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    if (name.endsWith(".hangman")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            });  
	String [] clubFiles = f.list(	
	new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    if (name.endsWith(".club")) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            });

		for(int i =0;i<userFiles.length;i++){
			System.out.println("userFiles contains " + userFiles[i]);
			}
		users.clear();
		clubs.clear();	
	for(int i = 0; i<userFiles.length;i++){
		String nom = userFiles[i];
		int x = nom.lastIndexOf(".user");
		nom = nom.substring(0,x);
		users.put(nom, new User(nom));
		usernameStorage.add(nom);
		}
		
	for(int j = 0;j<users.size();j++){
		String nomm = userFiles[j];
		int v = nomm.lastIndexOf(".user");
		nomm = nomm.substring(0,v);
		users.get(nomm).load("../webapps/f4k/persistence/" + userFiles[j]);
				
users.get(nomm).getProfile().load("../webapps/f4k/persistence/" + nomm + ".profile");
		users.get(nomm).getGame().load("../webapps/f4k/persistence/" + nomm+".hangman");
		}
	
	for(int i = 0;i<clubFiles.length;i++){
		String nom = clubFiles[i];
		int x = nom.lastIndexOf(".club");
		nom = nom.substring(0,x);
		clubs.put(nom,new Club(nom));
		clubnameStorage.add(nom);
		}
	for(int j=0;j<clubs.size();j++){
		String nomm = clubFiles[j];
		int v = nomm.lastIndexOf(".club");
		nomm = nomm.substring(0,v);
	System.out.println("about to load " + clubFiles[j]);	
	clubs.get(nomm).load("../webapps/f4k/persistence/" + clubFiles[j]);
}
    }

    
    /**
     * Takes a clubname String object and returns the Club object attached to it
     * Given the String clubname variable, implement the user hashmap's get(String s) 
     * method to return the Club object key stored within.
     * @param clubname String object of the variable stored within the Club object being returned
     * @return Club object or null if there is no Club object associated with the key clubname String object.
     * @see java.util.HashMap#get(java.lang.Object)   
     */
    public Club getClub(String clubname){
		return clubs.get(clubname);       
    }
    
    /**
     * Return the hashmap of Club objects.
     * Returns the hashmap of every Club object instantiated, or null is there 
     * are no Club objects instantiated.
     * @return Club hashmap containing every User object instantiated, or null if there are none.
     */
    public HashMap<String,Club> getAllClubs(){
        return clubs;
    }
    
}



