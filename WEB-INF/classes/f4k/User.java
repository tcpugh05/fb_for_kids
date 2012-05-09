package f4k; 
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import java.util.Collections;
import java.util.Iterator;
import java.util.HashMap;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
/**User class represents one person on the social network with their corresponding profile, friends, groups, and wall.
 * @author TC PUGH
 *
 */
public class User {
String username;
String password;
Date dateOfCreation;
Date dateOfBirth;
ArrayList<Message> sentMessages;
ArrayList<Message> receivedMessages;
ArrayList<User> friends;
HashMap<String,Date> creepers;
ArrayList<String> pastSearches;
Wall theWall = new Wall(this);
Profile theProfile;
Hangman myGame;
/**
 * Constructor used when user is instantiated. Calls the save method and sets the date of creation. 
 * @param dateOfBirth User to set the users date of birth
 * @param usernamePassed Sets the identity that the user will have on the site
 * @param passwordPassed Sets the password so that the user can later log in securely 
 */
public User(Date dateOfBirth,String usernamePassed,String passwordPassed){
this.dateOfBirth = dateOfBirth;
username = usernamePassed;
password = passwordPassed;
//this.username=username;
//this.password= password;
friends = new ArrayList<User>();
theProfile = new Profile(username);
receivedMessages =new  ArrayList<Message>();
sentMessages =  new ArrayList<Message>();
pastSearches = new ArrayList<String>();
creepers = new HashMap<String,Date>();
myGame = new Hangman(username);
save();	
}
/**Empty constructor used when the Repositories bootstrap method is running. Does not call the save method. 
 * 
 */
User( String Username){
	username = Username;
	friends = new ArrayList<User>();
	theProfile = new Profile();
	sentMessages = new ArrayList<Message>();
	receivedMessages = new ArrayList<Message>();
	pastSearches= new ArrayList<String>();
	creepers = new HashMap<String,Date>();
	myGame = new Hangman();
}

public void saveSearch(String s){
pastSearches.add(s);
save();
}

public ArrayList<String> getSearches(){
return pastSearches;
}
/**
 * Getter method for the User's date of birth. Used for populating display in user's profile. 
 * @return date of birth in Date format
 */
public Date getDateOfBirth(){
	return dateOfBirth;
}

public Date getDateOfCreation(){
	return dateOfCreation;
}
/**
 * Getter method to return password. Used to verify identity during user login for security purposes. 
 * @return the password for the user
 */
public String getPassword(){
	return password; 
}
/**
 * Getter method for returning user name. Used for populating display in users'profile 
 * @return String representing a user's name on website. Example:"CandyLover7"
 */
public String getUsername(){
	return username;
}
/**
 * Getter method for retrieving user's Wall Object
 * @return wall object for one user
 */
public Wall getWall(){
	return theWall;
}
/**
 * Getter method for retrieving a users profile
 * @return the particular users profile
 */
public Profile getProfile(){
//	//System.out.println("Returning theProfile");
	return theProfile;
}
public ArrayList<Message> getSentMessage(){
	return sentMessages;
}

public ArrayList<Message> getReceivedMessage(){
	return receivedMessages;
}

/**
 * Setter method for changing the users name. Used in bootstrap in order to populate an empty user object. 
 * @param username
 */
public void setUsername(String username){
	this.username = username; 
}
/**
 * Setter method for changing a user names. Used in bootstrap in order to populate an empty user object. 
 * @param pw
 */
public void setPassword(String pw){
	password = pw;
}
/**
 * Setter method for a users date of birth. Used in bootstrap in order to populate an empty user object
 * @param dateOfBirth
 */
public void setDateOfBirth(String dateOfBirth){

}

public void setDateOfCreation(String dateOfCreation){

}
/**Method to save all of the users information to the filesystem. This is called everytime information on the user is update.
 * 
 */
public synchronized void save(){
	try{
	PrintWriter pw = new PrintWriter("../webapps/f4k/persistence/" + getUsername() + ".user");
	pw.println(getUsername());
	pw.println(getPassword());
//	pw.println(getDateOfBirth().getTime());
//	pw.println(getDateOfCreation().getTime());
	pw.println("WALL");
	ArrayList<WallPost> wp = theWall.getPosts();
	for(int i = 0;i<wp.size();i++){
	pw.println(wp.get(i).toString());
	}
	pw.println("FRIENDS");
	for(int i=0;i<friends.size();i++){
	pw.println(friends.get(i).getUsername());
	}

	pw.println("RECEIVED MESSAGES");
	//System.out.println("receivedmsgs.size is "+receivedMessages.size());
	for(int i=0;i<receivedMessages.size();i++){
	pw.println(receivedMessages.get(i).toString());
	}
	pw.println("SAVED SEARCHES");
	for(int i = 0;i<pastSearches.size();i++){
	pw.println(pastSearches.get(i));
	}
	pw.println("CREEPERS");
	Iterator<String> i =creepers.keySet().iterator();
	while(i.hasNext()){
	String creepName =i.next();
	long creepTime= creepers.get(creepName).getTime();
	String cTime = String.valueOf(creepTime);
	pw.println(creepName);
	pw.println(cTime);
	}
	pw.println("end");
 	pw.close();	
	}
	catch(Exception e){
		e.printStackTrace();
		}
}

/**
 * Used to load in all the variables of an empty User object. 
 * @param filename
 */
void load(String filename){
	//System.out.println("loading " + filename);
	try{
	FileReader fr = new FileReader(filename);
	BufferedReader br = new BufferedReader(fr);
	String Username = br.readLine();
	setUsername(Username);
	String Pw = br.readLine();
	setPassword(Pw);
	//setDateOfBirth(br.readLine());
	//setDateOfCreation(br.readLine());
	String delim = br.readLine();
	String wp = br.readLine();
	while(wp.equals("FRIENDS") == false){
		String Author = wp;
		String Text = br.readLine();
		User authorUser = Repository.instance().getUser(Author);
		WallPost w = theWall.addPost(authorUser,Text);
		String epoch = br.readLine();
		w.setDate(epoch);
		wp = br.readLine();
		}
	String pal = br.readLine();
	while(pal.equals("RECEIVED MESSAGES") == false){ //Loading friends
		String buddy =  pal;
		User userBud = Repository.instance().getUser(buddy);
		friends.add(userBud);
		pal = br.readLine();
		//System.out.println("at end of while,pal is "+pal);
	}
	String msg = br.readLine();
//System.out.println("msg is " + msg);
	while(msg.equals("SAVED SEARCHES") == false){
	
		String Author = msg;
		String Text=br.readLine();
	if(Text.equals("I want to be your friend!")){
		User authorUser = Repository.instance().getUser(Author);
		String epoch = br.readLine();
		//System.out.println("In frm");
		FriendRequestMessage frm = new FriendRequestMessage();
		frm.setRecipient(this);
		frm.setAuthor(authorUser);
		frm.setText(Text);
		frm.setDate(epoch);
		receivedMessages.add(frm);
		}
	else{
	User authorUser = Repository.instance().getUser(Author);
	String epoch=br.readLine();
	String title=br.readLine();
	Message m = new Message();
	m.setReceiver(this);
	m.setAuthor(authorUser);	
	m.setText(Text);
	m.setDate(epoch);	
	m.setTitle(title);
	receivedMessages.add(m);
	}
	msg = br.readLine();
	//System.out.println("at end of while, msg is "+msg);
	}
	String search = br.readLine();
	while(search.equals("CREEPERS")== false){
		pastSearches.add(search);
		search = br.readLine();
	}
	String creep=br.readLine();
	while(creep.equals("end")==false){
		String creeperName=creep;
		String creepTime = br.readLine();
		long l = Long.parseLong(creepTime);
		Date d = new Date(l);
		creepers.put(creeperName,d);
		creep=br.readLine();
	}
	}
	catch(Exception e){	
		e.printStackTrace();
		}
}
/**
 * The User adds one friend to their friend list so that they can later post on the wall of and otherwise communicate with the user. 
*If friend is already added then a AlreadyFriends exception will be thrown and the user will not be added.If the user is not on the system then a UserDoesNotExist exception will be thrown.  
* @param friendsName The name of the friend in string format, which will be used as a key for the Hashmap of friends. 
* @throws AlreadyFriends if the two users are already friends 
*/
//ANYTIME YOU CALL THIS, REMEMBER TO ALSO CALL IT ON THE OTHER FRIEND'S USER OBJECT SO THEY CAN BE FRIENDS AND NOT STALKER-PREDATOR
public void addFriend(String friendsName){
	User theUser = Repository.instance().getUser(friendsName);
	if(!friends.contains(theUser))
	{
		friends.add(Repository.instance().getUser(friendsName));
		save();
	}
}
/**
 * Removes one friend user from the users friend list so that they can no longer post on each others walls or otherwise communicate. If the user does not exist then a UserDoesNotExist exception will be thrown and if person is not friends with the user already a NotFriends exception will be thrown. 
 * @param friendsName Friends name used to remove the user from the HashMap
 *@throws Notfriends if the two users are not already friends
*@throws UserDoesNotExist if the user does not exist on the network
*/

//ANYTIME YOU CALL THIS, REMEMBER TO ALSO CALL IT ON THE OTHER FRIENDS USER OBJECT
public void deleteFriend(String friendsName){
	
}
/**
 * Getter method for returning a list of users friend. Used to populate a list of the users friends to be displayed to the user.If the user does not have any friends then an empty ArrayList will be returned. 
 * @return All of the ::users friends. 
 */
public ArrayList<User> getAllFriends(){
	return friends;
}
public boolean isFriend(User theFriend){
	boolean isFriend = false; 
	for(int i = 0; i <friends.size();i++){
		//System.out.println("\n Current friend is "+friends.get(i).getUsername()+"\n");
		//System.out.println("CheckFriend is "+theFriend.getUsername()+"\n");
		String a = theFriend.getUsername();
		String b = friends.get(i).getUsername();
		if(a.equals(b))
		{
			//System.out.println("They are friends");
			isFriend= true; 
		}
	}
	//System.out.println("IsFried is goign to return "+isFriend);
	return isFriend;
}
/**Method used to send a message to another user. The method adds the message to the users sent messages ArrayList and also to the other users received messages Arraylist. 
 * 
 * @param message The text of the message that will be sent to the user. Example: "Whats up Buddy!"
 * @param recipient The user the message is to be sent to
 */
public void sendMessage(Message message, User recipient){
	sentMessages.add(message);
	recipient.receiveMsg(message);
	save();	
	//System.out.println(this.getUsername() +" is sending a message");
}
/**Add the message to the Users received messages arraylist.
 * 
 * @param message The message to be received 
 */
public void receiveMsg(Message message){
	receivedMessages.add(message);
	save(); 
	//System.out.println(this.getUsername()+" is receiving a message");
}
public Hangman getGame(){
	return myGame;
}
public void setGame(Hangman newGame){
	myGame =newGame;
}
public void setCreeper(String u){
 //System.out.println("in setcreeper, about to make a new date object");
 Date cd = new Date();
 //System.out.println("made the date object, about to put it in the hashmap and date is "+cd.getTime());
 creepers.put(u,cd);
 //System.out.println("just put "+u+" and "+cd.getTime()+" in creepers");
 save();
}

public HashMap<String,Date> getCreepers(){
 return creepers;
}

public void setCreepers(HashMap<String,Date> hm){
creepers=hm;

}
}
