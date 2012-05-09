package f4k;
import java.util.Date;
import java.util.*;
import java.text.*;
/** This class represents one way Users can communicate with each other. A Message can be sent from one user to another and when the user wants to see his messages, a list of all the user's messages are arranged in order of the date they were sent.
@author Osato Guobadia
*/

public class Message implements Comparable<Message>{

//Wall w = new Wall();
private Date date;
private User author;
private User receiver;
private String text;
private String title="";
/**Initializes a newly created Message object. The message object would have a blank title until set by setTitle.
@param author the author of the message
@param recipient the recipient of the message
@param text  the message body
*/
public Message(String title,User author,User recipient,String text){
	this.title = title;
	this.author = author;
	this.receiver = recipient;
	this.text = text; 
	date = new Date();
}

public Message(){
//date = new Date();
}
/** This method compares two Message objects based on their dates of creation. If the otherMessage was created earlier than the Message, a -1 is returned. If it was 
created later, a 1 is returned.

@param otherMessage  the Message object that this Message object is to be compared to. 
*/
public int compareTo(Message otherMessage){
return this.getDateSent().compareTo(otherMessage.getDateSent());
}

/** returns the Date object that represents the date this message was sent

*/
public Date getDateSent(){

return date;
}

public String toString(){
String msg = author.getUsername() + "\n" + text + "\n" + date.getTime() + "\n" + title; 
return msg;
}
/** returns the User object that represents the author of this message.

*/
public User getAuthor(){

return author;
}

/** returns the User object that represents the recipient of this message.

*/
public User getReceiver(){

return receiver;
}

/** returns the body of the message as a String
*/
public String getText(){

return text;
}

/** returns the title of the message specified by the user. If no title is entered, an empty String is returned.

*/
public String getTitle(){

return title;
} 

/** sets the date of the message to the date object specified by the parameter.

*/
void setDate(String day){
Long l = Long.parseLong(day);
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy HH:mm");
date = new Date(l);


}
/** sets the author of the message to the author specified in the parameter.

*/
public void setAuthor(User author){
this.author=author;
}

/** sets the receiver of the message to the receiver specified in the parameter.

*/
public void setReceiver(User receiver){
this.receiver=receiver;
}

/** sets the body of the message to the body specified in the parameter

*/
public void setText(String t){
text=t;
}

/** sets the title of the message to the title specified in the parameter. 

*/
public void setTitle(String title){
this.title=title;
}


}
