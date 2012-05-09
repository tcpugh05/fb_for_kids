/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package f4k;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
/** 
 * @author JC
 *
*/

public class Censor {

    
    /**
     * Returns true if there are no unsafe words within the given String object. Returns false if an unsafe word is found as such " unsafeWord ".
     * Screens for bad words within the given String object.
     * @param words
     * @return true if there are no unsafe words or if String object is null, returns false if " unsafeWord " is found.
     */
static public boolean isSafe(String words){
	String workDamnit =words.toLowerCase();
	words=workDamnit;
	System.out.println("word is "+words);
	System.out.println("Inside isSafe");
	//read from censorlist
	boolean isSafe = true;
	ArrayList<String> baddWords = new ArrayList<String>();
        try{
	System.out.println("Inside try statement of isSafe");
	FileInputStream fstream = new FileInputStream("censorlist.txt");
        System.out.println("After fStream initialized");
	DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        System.out.println("In isSafe, just set up readers");
	String strLine;
        strLine = br.readLine(); //first line
        System.out.println("First cussword is "+strLine);
	while(strLine!= null){
   		baddWords.add(strLine);
		strLine = br.readLine();
	}
	for(int i = 0; i <baddWords.size(); i++){
		if(words.indexOf(baddWords.get(i)) > -1 )
		{
		System.out.println("AH OH"+words+"IS"+baddWords.get(i));
		isSafe = false;
		}
	}
	if(words.length() > 2000)
	{
		isSafe=false;
	}
	return isSafe;
}catch(Exception e){
	return true;
}
}
}
/*      
   itHasCusswords = words.equalsIgnoreCase(" "+strLine+" "); //surround bad word with white space
            //if there are cusswords, set the censor to say there are
            if(itHasCusswords){
                return false;
            }
        }
        //double check, if there are cusswords, set the censor to say there are
        if(itHasCusswords){
            return false;
        }
	}
	catch(Exception e){
		e.printStackTrace();
		}
        //else, set censor to say there arent.
	return true;
    }
	
  */  
    
