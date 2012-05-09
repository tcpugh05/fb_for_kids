package f4k; 
import java.util.ArrayList;
/** This class contains all the wallposts that have been posted on a class and it can add or delete wallposts too.
 @author Osato Guobadia
*/
public class Wall{
User owner;
ArrayList<WallPost> wallPosts = new ArrayList<WallPost>();
/** Creates a new wall object.
@param owner the user object that corresponds to the user that is currently logged-in.
*/
public Wall(User owner){
this.owner = owner;
}


Wall(){

}

/** Deletes a wallpost that is passed in the parameter. 
@param post the wallpost to be deleted
*/
public void deleteWallPost(WallPost post){
	int i=wallPosts.indexOf(post);
	wallPosts.remove(i);
}

/** Returns all the wallposts on a current wall 
@return an ArrayList of wallposts on the wall.
*/
public ArrayList<WallPost> getPosts(){
return wallPosts;
}


/** Adds a wall post to the wall. This method only takes in the user's name and the text. It then creates a wallpost object with these parameters.
@param author the user object that corresponds to the author of the wall post
@param text  the text as a string that the user wants to post. 
*/
public WallPost addPost(User author,String text){
	WallPost wP = new WallPost(author,text);
	wallPosts.add(wP);
	return wP;	
}


synchronized void load(String filename){

}

synchronized void save(){

}
public User getOwner(){
	return owner;
}
}
