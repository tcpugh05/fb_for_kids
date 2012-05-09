package f4k;


import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.io.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**The Club class contains a group of Users who have an interest in a specific subject where they can post on the wall. On the facebook for kids website  each group will have a separate
 * page that will contain a wall, a description, and a title. An example would be a page Titled "I love twilight" with the description of:"For the best Twilight Fan in the 
 * universe" with various group members posting on the wall about Twilight related subjects.
 * The class itself contains variables for a name, a date of creation, a list of members, a wall, and an administrator who has permission to delete wallposts. 
 * @author Tc Pugh 
 *
*/
public class Club {
String nameOfClub;
Date dateOfCreation;
ArrayList<User> listOfMembers = new ArrayList<User>(); 
Wall theWall;
User administrator; 
String description;
boolean anyoneCanPost = true;
/**
 * Constructor used when a group is first brought into existence. The title of the club is made, the administrator is set, and the date is set to the time that the constructor is called. Lastly the object is saved to the File//System
 * @param name Title of the club. An example would be "I love comp sci!!". The nameOfClub is set to this parameter.
 * @param creator The administrator User is set to this parameter and has the ability to delete wall posts. 
 */

public Club(String name, User creator,String description){
	nameOfClub = name;
	dateOfCreation = new Date();
//	listOfMembers = new HashMap<String,User>();
	theWall = new Wall(administrator);
	administrator = creator;
	listOfMembers.add(creator);
	this.description = description;
	//System.out.println("in club constructor, about to save");
	save();
	
}

Club(String clubName){
 
nameOfClub = clubName;
theWall = new Wall();
}
public void setAnyoneCanPost(boolean g){
	anyoneCanPost = g;
}

public boolean getAnyoneCanPost(){
	return anyoneCanPost;
}
/**
 * Empty Constructor which is used when loading the Club objects in the Repository class bootstrap method
 *@return returns description of club
*/
Club(){
	
}
/**Getter method for returning a clubs description. 
*@return The club description in String format
*/

public String getDescription(){
	return description;
}

/**
 * Getter method to return all users who are part of the group.Method is used to find who has permission to write on the wall of the club.Returns an arraylist with Strings of user names as keys and User values. 
 * @return an arraylist with String keys and User values of all members who are part of the group.
 */
public ArrayList<User> getListofMembers(){
	return listOfMembers; 
}
/**
 * Adds one User to the list of members in the group. A String is passed which will be used as a key in the HashMap of members 
 * and the User object will be pulled from the Repository by using the parameter. If a User that already exists is tried to be added to the club then a UserAlreadyExists exception will be thrown and the member will not be added. 
 * @param addedMember String representation of member to be added to the list of members.
 * @throws UserAlreadyExists if a user already exists on a system.
 */
public void addMember(String addedMember){
	User member = Repository.instance().getUser(addedMember);
	for(int i = 0; i<listOfMembers.size(); i++){
		if(!member.equals(listOfMembers.get(i))){

			listOfMembers.add(member);
		}
	}
	//System.out.println(" the list of members from java " +listOfMembers);
	save();	
}
/**Setter method which should be called when the current administrator leaves the group so as to not leave the administrator position empty.This method override a previous administrator. 
 * 
 * @param admin user which which the administrator will be set to.
 */
public void setAdministrator(User admin){
save();
}
/**Setter for the creation date which is used when the system loads the groups from the filesystem 
 * 
 * @param dateofC Date to be set as the date of creation
 */
private void setCreationDate(Date dateofC){
save();	
}
/**
 *  Removes one User to the list of members in the group. A String is passed which will be used as a key in the HashMap of members 
 * and the User object will be removed from the Repository by using the parameter
 *
 * @param removedMember String representation of member to be added to the list of members.
 */
private void removeMember(String removedMember){
save();	
}
/**
 * Saves the Club and all of its variables to the filesystem in a .club .txt file. 
 */
public synchronized void save(){
try{
	//System.out.println("about to make new printwriter in save");
	PrintWriter pw = new PrintWriter("../webapps/f4k/persistence/" + getClubName() + ".club");
	//System.out.println("made a new file");
	pw.println(getAdministratorName());
	pw.println(getClubName());
	pw.println(String.valueOf(getDateOfCreation().getTime()));
	pw.println(getDescription());
	//pw.println(getAnyoneCanPost());
//	for(int i = 0; i<listOfMembers.size();i++){
//		pw.println(listOfMembers.get(i).getUsername());
//		}
	pw.println("WALL");
	ArrayList<WallPost> wp = theWall.getPosts();
	for(int i =0;i<wp.size();i++){
		//System.out.println("toString is "+wp.get(i).toString());
		pw.println(wp.get(i).toString());	
	}
	pw.println("MEMBERS");
	for(int i=0;i<listOfMembers.size();i++){
		pw.println(listOfMembers.get(i).getUsername());
		}
	pw.println("end");
	pw.close();
	}
	catch(Exception e){
		e.printStackTrace();
		}
		
}
/**
 * Loads the Club and all of its variables from the .club .txt file. 
 * @param filename
 */
void synchronized load(String filename){
	try{
		FileReader fr = new FileReader(filename);
		BufferedReader br = new BufferedReader(fr);
		administrator = Repository.instance().getUser(br.readLine());
		nameOfClub = br.readLine();
		setDate(br.readLine());
		String des = br.readLine();
		//System.out.println("description is "+des);
		while(des.equals("WALL")==false){
			description = description +des;
			des=br.readLine();
			}
	 	description=description.replaceFirst("null","");
	//	anyoneCanPost = br.readLine();
		//come back to look at it
		//String member = br.readLine();
		//while(member.equals("WALL") == false){
		//	listOfMembers.add(Repository.instance().getUser(member));	
		//	}
		
		//String delimeter = br.readLine();
		String wp = br.readLine();
		//System.out.println("wp is "+wp);
		while(wp.equals("MEMBERS") == false){
			String Author = wp;
			String Text = br.readLine();
			User authorUser = Repository.instance().getUser(Author);
			WallPost w=theWall.addPost(authorUser,Text);
			String epoch = br.readLine();
			w.setDate(epoch);
			wp = br.readLine();
		}
		String mem = br.readLine();
		while(mem.equals("end") == false){
			User m = Repository.instance().getUser(mem);
			listOfMembers.add(m);
			mem=br.readLine();
			}
	}
	 catch(Exception e){
		e.printStackTrace();
		}
}

void setDate(String day){
	long l = Long.parseLong(day);
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy");
 	dateOfCreation = new Date(l);
}
/**
 * Getter Method that returns the administrator name in order to display it on the group page.If there is no adminstator it returns the NoAdministrator exception 
 * @throws NoAdministrator when a club does not have an administrator 
* @return the name of the administrator in string format
 */
public String getAdministratorName(){
	return administrator.getUsername();
}
/**Getter method for the club name. It is used in order return the name on the group page.  
 * 
 * @return the name of the club in string format
 */
public String getClubName(){
	return nameOfClub;	
}
/**Setter Method used to set the club name that will be displayed on club page. The club name only be set by the administrator.If a user other than the administrator is passed then the description will not be set and the method will return a DoesNotHavePermission exception. Also used when loading the object in Respository's bootstrap method.
 * @throws DoesNotHavePermission when a user does not have permission and attempts to set club name. 
 * @param name The club name that will be set. 
 */
public void setClubName(User aUSer,String name){
save();	
}
/**
 * Getter Method used to retrieve the wall to used for display purposes
 * @return Wall that contains all the wallposts by club members. 
 */
public Wall getWall(){
	return theWall;	
}
/**Getter Method used to return the date that the group was first created.
 * 
 * 
 * @return date of creation of the club
 */
public Date getDateOfCreation(){
	return dateOfCreation;	
}
/**Sets the description of the club webpage. Can only be set by the admininstrator.If a user other than the administrator is passed then the description will not be set and the method will return a DoesNotHavePermission exception. Used for display purposes on the group page.
 *@throws DoesNotHavePermission when a user does not have permission to change the description. 
 * @param descp The new description of the webpage. 
 */
public void setDescription(User aUSer,String descp){
	
	description = descp;	
	save();
}
}

