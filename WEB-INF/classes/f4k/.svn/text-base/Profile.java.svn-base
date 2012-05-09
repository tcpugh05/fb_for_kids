/** The Profile class contains Getter and Setter methods for various Strings concerning user's interests and activities. Every User Object contains one Profile Object and the Profile Object is used to store data used to populate a Users Profile Page. 
 * @author TC PUGH
 *
 */
package f4k; 

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
public class Profile {
String favTVShow;
String favColor;
String favFood; 
String favAnimal;
String dreamJob;
String hobby;
String favBook;
String favMusic;
String favClass;
String pictureFile;
String username;
/**Constructor which initializes an empty Profile object. None of the favorite interests of a user are set. 
 * 
 */
public Profile(String usernom )

{
//try{	
//PrintWriter pw = new PrintWriter("../webapps/f4k/persistence/" + usernom + ".profile");
//}
//catch(Exception e){
//	e.printStackTrace();
//}
	System.out.println("A new profile was instantiatead with the username, " + usernom);
	boolean h= true;
	System.out.println("HHH IS" + h);
	username= usernom;
	favTVShow = " ";
	favColor = " ";
	favFood = " ";
	dreamJob = " ";
	hobby = " ";
	favBook = " ";
	favMusic = " ";
	favClass = " ";
	pictureFile = "";
	favAnimal = " ";
	save();
	//System.out.println("Inside Profile constuctor, tv show is"+favTVShow);
}

Profile(){

}
/**Getter Method that returns String corresponding to a User's favorite TV show. This method is used to populate a users profile page. 
 * 
 * @return String representing a User's favorite TV Show.
 */
public String getFavTVShow(){
	//System.out.println("Favorite Show is\""+ favTVShow + " \"");
	//System.out.println("Now returning favTVShow as " + favTVShow );
	return favTVShow; 
}
/**
 * Getter Method that returns String corresponding to a User's favorite color. This method is used to populate a users profile page. 
 * @return String representing a User's favorite Color
 */
public String getFavColor(){
	return favColor;
}
/**
 * Getter Method that returns String corresponding to a User's favorite food.This method is used to populate a users profile page.
 * @return String representing a User's favorite food
 */
public String getFavFood(){
	return favFood; 
}
/**
 * Getter Method that returns String corresponding to a User's favorite animal.This method is used to populate a users profile page.
 * @return String representing a User's favorite animal
 */
public String getFavAnimal(){
	return favAnimal; 
}
/**
 * Getter Method that returns String corresponding to a User's dream career choice. This method is used to populate a users profile page.
 * @return String representing a User's dream career choice
 */
public String getDreamJob(){
	return dreamJob;
}
/**
 * Getter Method that returns String corresponding to a User's favorite hobby. This method is used to populate a users profile page.
 * @return String representing a User's favorite hobby
 */
public String getHobby(){
	return hobby;
}
/**
 * Getter Method that returns String corresponding to a User's favorite book. This method is used to populate a users profile page.
 * @return String representing a User's favorite book.
 */
public String getFavBook(){
	return favBook;
}
/**
 * Getter Method that returns String corresponding to a User's favorite music. This method is used to populate a users profile page.
 * @return String representing a User's favorite music.
 */
public String getFavMusic(){
	return favMusic;
}
/**
 * Getter Method that returns String corresponding to a User's favorite class at school. This method is used to populate a users profile page.
 * @return String representing a User's favorite class at school 
 */
public String getFavClass(){
	return favClass;
}
/**Setter Method that sets a String corresponding to a User's favorite TV Show. This method is used to populate a users profile page.
 *It is acceptable if the Users sets the attribute to empty string, after all, they might not care about the subject. If null is passed the setter defaults the string to empty string.  
 * @param favTVShow String representing a users favorite TV show. 
 */
public void setFavTVShow(String favTVShow){
	this.favTVShow = favTVShow; 
	save();
}
/**Setter Method that sets a String corresponding to a User's favorite color.
 * If null is passed the setter defaults the string to empty 
string.  
 * @param favColor String that the User's favorite color will be set to. 
 */
public void setFavColor(String favColor){
	this.favColor = favColor;
	save();
}
/**Setter Method that sets a String corresponding to a User's favorite food to eat.
*If null is passed the setter defaults the string to empty 
string.  
 * 
 * @param favFood String that a User's favorite food will be set to. 
 */
public void setFavFood(String favFood){
	this.favFood = favFood;
	save();
}
/**Setter Method that sets a User's favorite animal. 
 * If null is passed the setter defaults the string to empty 
string.  
 * @param favAnimal String that a User's favorite animal will be set to
 */
public void setFavAnimal(String favAnimal){
	this.favAnimal = favAnimal; 
	save();
}
/**
 * Setter Method that sets a User's dream job.
*If null is passed the setter defaults the string to empty 
string.  
 * @param dreamJob String that a User's dream job will be set to. 
 */
public void setDreamJob(String dreamJob){
	this.dreamJob = dreamJob; 
	save();
}
/**
 * Setter Method that sets a User's favorite hobby.
*If null is passed the setter defaults the string to empty 
string.  
 * @param hobby String that a User's favorite hobby will be set to. 
 */
public void setHobby(String hobby){
	this.hobby = hobby;
	save();
}
/**
 * Setter Method that sets a User's favorite book.
*If null is passed the setter defaults the string to empty 
string.  
 * @param favBook String that a User's favorite book will be set to. 
 */
public void setFavBook(String favBook){
	this.favBook = favBook; 
	save();
}
/**
 * Setter Method that sets a User's favorite music.
*If null is passed the setter defaults the string to empty 
string.  
 * @param favMusic String that User's favorite music will be set to. 
 */
public void setFavMusic(String favMusic){
	this.favMusic = favMusic; 
	save();
}
/**
 * Setter Method that sets a User's favorite school class.
*If null is passed the setter defaults the string to empty 
string.  
 * @param favClass String that User's favorite class will be set to. 
 */
public void setFavClass(String favClass){
	this.favClass = favClass; 
	save();
}
/**
 * Setter Method that sets the filepath of a file containing an image that the user wants to set their profile picture too. If a file path is passed which does not correspond to a legitimate .png file then a PathDoesNotExist exception is throw;  
 * @param pictureFile String representing a filepath that contains an .png file for a User's profile image.
*  @throws PathDoesNotExist if the filepath is given which does not correspond to a legitimate .png file 
 */
public void setProfilePicture(String filepath){

	System.out.println("filepath in set picture is " +filepath);
	String pictureFilepath = filepath;
	pictureFile = pictureFilepath;
	System.out.println(" picture file is now " +pictureFile);
	save();
}

/**
*Returns the String filepath of the user's profile picture that is stored within the user type's pictureFile variable.
*@return pictureFile String object that is the user's profile picture file path
*/
public String getProfilePicture(){
	System.out.println(" getting profile picture got me " +pictureFile);
	return pictureFile;
}

private synchronized void save(){
try{
PrintWriter pw = new PrintWriter("../webapps/f4k/persistence/" + username + ".profile");
pw.println(favTVShow);
pw.println(favColor);
pw.println(favFood);
pw.println(favAnimal);
pw.println(favBook);
pw.println(favMusic);
pw.println(favClass);
pw.println(hobby);
pw.println(dreamJob);
pw.println(pictureFile);
//pw.println(pictureFile);

pw.close();
} 
catch(Exception e){
	e.printStackTrace();
}
}
void load(String filename){
try{
FileReader fr = new FileReader(filename);
BufferedReader br = new BufferedReader(fr);

favColor="";
favTVShow = br.readLine();
favColor=br.readLine();
favFood=br.readLine();
favAnimal=br.readLine();
favBook=br.readLine();
favMusic=br.readLine();
favClass=br.readLine();
hobby=br.readLine();
dreamJob=br.readLine();
pictureFile=br.readLine();
//setProfilePicture=br.readLine();
}
catch(Exception e){
	e.printStackTrace();
}
}
}
