package f4k;
import java.util.*;
import java.text.*;
/** This class is a special type of message that is sent only when a user wants to add another user as a friend.
@author Osato Guobadia 
*/
public class FriendRequestMessage extends Message{

private Date date;
private String text;
private User requester;
private User requestee; 

/** Creates a new FriendRequestMessage object. The default text is "Hey, Do you want to be my friend?" if no text is entered.
@param requester  the sender of the friend request
@param requestee  the receiver of the friend request
@param text the body of the message. Used to the purpose of being an explanatory text to accompany the request, such as  "Hey, this is Tc from CPSC 330, lets be friends!". If no message is passed in the form of passing null or an empty string then the message defaults to "Hey, do you want to be my friend?".
*/
public FriendRequestMessage(User requester, User requestee,String text){
	super("",requester,requestee,text);
	this.requester = requester;
	this.requestee = requestee;
	this.text = text;
	date = new Date(); 
	if(text == null){
		text = "Hey, Do you want to be my friend?";
		}
	System.out.println("Author of this message is " + this.requester.getUsername());
}

public FriendRequestMessage(){
	super();
}
/** Sets the body of the message to the text specified in the paramter 
*/
public void setText(String text){
	this.text = text;
	System.out.println("set text to "+text);
}

/** Returns the body of the message
*/
public String getText(){
return text;
}

void setDate(String day){
Long l = Long.parseLong(day);
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy HH:mm");
date = new Date(l);


}
public User getRecipient(){
return requestee;
}

public void setRecipient(User r){
requestee=r;
}

public Date getDateSent(){
return date;
}


public String toString(){
String msg = requester.getUsername() + "\n" + text + "\n" + date.getTime(); 
return msg;
}
/** Returns the user object that is sending the friend request.
@return a User object
 */

public User getAuthor(){
	return requester;
}

/** Accepts a friend request. This method allows both user objects to be "friends" with eachother. They would now be able to post on each other's walls and their names would now also appear on each other's friendlists */
public void accept(){
requester.addFriend(requestee.getUsername());
requestee.addFriend(requester.getUsername());
}

public void setAuthor(User author){
requester = author;
System.out.println("setting requester to "+author);
}

}
