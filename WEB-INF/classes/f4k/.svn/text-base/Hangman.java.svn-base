package f4k;
import java.io.DataInputStream;
import java.io.PrintWriter;
import java.io.FileNotFoundException;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.util.Random;
import java.lang.StringBuilder;
import java.lang.Character;
import java.util.ArrayList;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
public class Hangman{
	int triesLeft;
	boolean gameOver;
	String wordLookingFor;
	String guesses;
	String displayWord;
	String pictureURL;
	String username;
	User theUser=Repository.instance().getUser(username);
public Hangman(int triesLeft,boolean gameOver,String wordLF, String guesses,String displayWod, String pictureURL,String username){
	this.triesLeft = triesLeft;
	this.gameOver = gameOver;
	this.wordLookingFor = wordLF;
	this.guesses = guesses;
	this.displayWord= displayWod;
	this.pictureURL = pictureURL;
	this.username=username;
} 
public Hangman(String username){
	this.username = username;
	triesLeft = 6;
	displayWord ="";
	gameOver = false;
	guesses = "";
	wordLookingFor = grabWord();
	for(int i =0;i<wordLookingFor.length();i++)
	{
		displayWord +="_";
	}
	 pictureURL = "h6.png";
	this.username=username;	
	System.out.println("NOW SAVING IN HANGMAN CONSTRUCTOR");
	save();
		
}
public Hangman(){
}
public boolean  guess(char  c){
	if(!Character.isLetter(c)){
		save();
		return false;
	}
	if(wordLookingFor.indexOf(c)!=-1)
	{
		guesses += c+",";	
		for(int i=0;i<wordLookingFor.length();i++)
		{
			if(wordLookingFor.charAt(i) == c)
			{
			StringBuilder theName = new StringBuilder(displayWord);
			theName.setCharAt(i,c);
			displayWord= theName.toString();
			}
		}

		if(!displayWord.contains("_"))
		{
			gameOver();
		}
	}
	else{
	triesLeft --;
	guesses += c+",";
	setURL();
	}
	if(triesLeft ==0)
	{
		gameOver();
	}
	save();
	return true;

}
public String getGuesses(){
	return guesses;
}
public String getDisplayWord(){
	return displayWord;
}
public String getWordLookingFor(){
	return wordLookingFor;
}
public int getTriesLeft(){
	return triesLeft;
}


private void setURL(){
	switch(triesLeft){
	case 6: pictureURL="h6.png"; break;	
	case 5: pictureURL="h5.png"; break;
	case 4: pictureURL="h4.png"; break;
  	case 3: pictureURL="h3.png"; break;
  	case 2: pictureURL="h2.png"; break;
  	case 1: pictureURL="h1.png"; break;
  	case 0: pictureURL="h0.png"; break;
	}
		save();
}

public String getURL(){
	return pictureURL;
	}
private String grabWord(){
	try{
        ArrayList<String> words = new ArrayList<String>();
        System.out.println("Inside try statement of grabword");
        FileInputStream astream = new FileInputStream("dict.txt");
	System.out.println("Afdter fStream initialized");
        DataInputStream in = new DataInputStream(astream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        System.out.println("In grabworde, just set up readers");
        String strLine;
        strLine = br.readLine(); //first line
        System.out.println("First word is "+strLine);
        while(strLine!= null){
                words.add(strLine);
                strLine = br.readLine();
        }
	Random randomGenerator = new Random(); 
	int random = randomGenerator.nextInt(2500);
		save();
	return words.get(random);
}
	catch(Exception e)
	{
	return "MESS UP";
	}
}
public boolean getGameStatus(){
	return gameOver;
}
private void gameOver(){
		save();
	gameOver=true;
}
public String getFilenane(){
	return pictureURL;
}


private synchronized void save(){
try{
PrintWriter pw = new PrintWriter("../webapps/f4k/persistence/" +username + ".hangman");
String tries=Integer.toString(getTriesLeft());
pw.println(tries);
String gOver= new Boolean(getGameStatus()).toString();
pw.println(gOver);
pw.println(getWordLookingFor());
pw.println(getGuesses());
pw.println(getDisplayWord());
pw.println(getURL());
pw.close();
} 
catch(Exception e){
	e.printStackTrace();
}
}

void load(String filename){
System.out.println("Now loading "+filename);
try{
FileReader fr = new FileReader(filename);
BufferedReader br = new BufferedReader(fr);
String tries= br.readLine();
System.out.println("tries is "+tries);
triesLeft = Integer.parseInt(tries);
String gOver = br.readLine();

System.out.println("gOver is "+gOver);
if(gOver.equals("true")){
	gameOver=true;
}
else{
	gameOver=false;
}
wordLookingFor=br.readLine();
System.out.println("wordLookingFor is "+wordLookingFor);
guesses=br.readLine();
System.out.println("guesses is "+guesses);
displayWord=br.readLine();
System.out.println("displayWord is "+displayWord);
pictureURL=br.readLine();
System.out.println("picURL is "+pictureURL);

}
catch(Exception e){
	e.printStackTrace();
}
}

}


