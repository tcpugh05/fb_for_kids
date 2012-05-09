/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package f4k;

import java.util.Date;
import java.util.HashMap;

/**
 * The Club class manipulates every data piece of a Club type. This includes the  
 * String object name of the Club, the Date type date of creation, the Array List 
 * list of members, the Wall object wall, and the User type administrator. The class
 * is also equipped with the ability to get and set variables as well as load and save.
 * @author JC
 * 
 */




public class ClubJC {

    private String nameOfClub;
    private Date dateofCreation;
    private HashMap<String,User> users = new HashMap<String, User>();
    private Wall theWall = new Wall();
    private User administratorUser;
    private String administratorName;
    private String description;
    
    /**
     * One constructor of the Club class, used to instantiate Clubs upon their first creation. 
     * This constructor takes the String name and the User creator, sets them both using 
     * setAdministrator() and setClubName() methods within the Club class. 
     * @param name String object that is the name of the club.
     * @param administrator User object that is the administrator of the club.
     * @author JC
     */
 
    public void ClubJC(String name, User administrator){
        
    }
    
    /**
     * One constructor of the Club class that is used when loading clubs from bootstrap().
     * This constructor sets all variables to null and instantiates the objects in 
     * preparation for a successful load().
     * @author JC
     */
    private void Club(){
        
    }
    
    /**
     * Returns a HashMap<String, User> of every User type that has joined the Club type.
     * Returns the HashMap of User types that is associated with the Club type. 
     * This HashMap<String, User> is a list of all currently registered Club members.
     * 
     * @return HashMap<String, User> listOfMembers variable that lists every currently 
     * joined member of the String club name or null if listOfMembers is empty. 
     * @author JC
     */
    public HashMap<String,User> getListOfMembers(){
        return users;
    }
 
    /**
     * Takes the String object parameter and adds it to the HashMap<String, User> listOfMembers.
     * Calls getUser() from the Repository class on the String parameter in order 
     * to get the User type then adds that User type to the HashMap<String, User> listOfMembers,
     * where String is the name of the club.
     * @param addedMember String object username of the User type to be added.
     * @see f4k.Repository.getUser(java.lang.Object)
     * @author JC
     */
    public void addMembers(String addedMember){
        
    }
    
    /**
     * Takes the User type parameter and sets the variable administrator equal to it.
     * The User type parameter administrator is the creator of the club is stored 
     * in the variable administratorUser.
     * @param administrator User type is the creator of the club
     * @author JC
     */
    public void setAdministrator(User administrator){
        
    }

    /**
     * Given a Date object dateofC and stores it.
     * Takes the parameter dateofC Date object and sets the variable dateOfCreation equal to it.
     * @param dateofC the Date object of the moment when the club was created.
     * @author JC
     */
    public void setCreationDate(Date dateofC){

    }
    
    /**
     * Takes String object parameter removedMember and removes them from the 
     * HashMap<String, User> listOfMembers.
     * Given the String object removedMember, it calls getUser from the Repository 
     * class to get the User type that will be removed from the HashMap<String, User> listOfMembers.  
     * @param removedMember String object username of the User type that will be removed 
     * from the HashMap<String, User> listOfMembers
     * @see java.util.HashMap#remove(java.lang.Object) 
     * see f4k.Repository.getUser(java.lang.Object)
     * @author JC
     */
    public void removeMembers(String removedMember){

    }
    
    /**
     * Takes every variable and saves it onto .txt and .club files.
     * @author JC
     */
    void save(){

    }
    
    /**
     * Takes the .txt or .club file and parses all String objects into variables
     * @param filename the .txt or .club file in which all of the variables are saved
     * @see f4k.Club.Save()
     * @author JC
     */
    void load(String filename){

    }
    
    /**
     * Returns String object administratorName which is the creator of the club, or null if the creator of the club left the club.
     * @return administratName String object associated tot he User type that is the administrator of the club.
     * @author JC
     */
    public String getAdministratorName(){
        return administratorName;
    }
    
    /**
     * Returns the String object nameOfClub which is the name of the club type. 
     * @return nameOfClub the name of the club object
     * @author JC
     */
    public String getClubName(){
            return nameOfClub;
    }

    /**
     * Takes the parameter String name and set the variable nameOfClub equal to it. 
     * @param name String object type that is the name of the club object.
     * @author JC
     */
    public void setClubName(String name){

    }

    /**
     * Returns the club's Wall object which contains every post with associated authors and dates.
     * @return theWall the Wall object that contains all variables from the Wall class including wallposts, authors and dates.
     * @author JC
     */
    public Wall getWall(){
        return theWall;
    }

    /**
     * Returns the Date object date of which the club was created. 
     * @return dateofCreation Date object which was instantiated when the club was created.
     */
    public Date getDate(){
        return dateofCreation;
    }

    /**
     * Takes the String object parameter descp and sets the variable String object description equal to it.
     * If the variable description is not null, then the value is overwritten.
     * @param descp String object of the new club object's description variable.
     */
    public void setDescription(String descp){

    }
    }





    
