package f4k;
import java.util.Date;
import java.util.HashMap;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
/** This class represents one way users can communicate with each other on f4k. Other than send private messages, users can post on each other's walls or 
on a club's wall. Any post they make is stored as a wall post.
@author Osato Guobadia
*/ 
public class WallPost implements Comparable<WallPost>{

private User author;
private Date date;
private String text;

/** Creates a new WallPost object.
@param author the author of the wall post
@param text the body of the wall post
*/ 
public WallPost(User author,String text){
this.author = author;
this.text = text;
date = new Date();
}

void load(String filename){

}
private void save(){

}

/** Sets the body of the wallpost to the text specified in the parameter.
*/
public void post(String text){

}

/** Returns the body of the wall post
*/
public String getText(){

return text;
}

/** Returns the author of the wall post.
@return the user object of the author of the wall post
*/
public User getAuthor(){

return author;
}

/** Returns the millisecond the wallpost was posted.
@return the string object of the time in milliseconds the wall post was posted.
*/
public Date getDate(){

//String originalDate = "";
//return originalDate;
return date;
}

/** Returns a String containing the text of the wall post and the time of the wall post seperated by a line break. The time of the wallpost is in milliseconds.

*/
public String toString(){
String wp = author.getUsername() + "\n" + text + "\n" + date.getTime(); 
return wp;
}


/** This method compares two WallPost objects based on their dates of creation. If the otherWallPost was created earlier than the WallPost, a -1 is returned. If it was created later, a +1 is returned.

*/
public int compareTo(WallPost otherWallPost){
return this.getDate().compareTo(otherWallPost.getDate());
}

/* Converts the time entered in the parameters to a time formatted appropriately in MM:DD:YYYY HH:mm:ss fashion.
@param dateInEpoch- the time the wallpost was posted in milliseconds.
*/
void setDate(String day){
Long l = Long.parseLong(day);
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy HH:mm");
date = new Date(l);
}
public void setText(String text){
	this.text = text;
}
}

