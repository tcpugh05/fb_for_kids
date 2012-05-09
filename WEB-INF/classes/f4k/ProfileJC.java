/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package f4k;

/**
 * The Profile class saves all personal information data that is on the Profile page into variables, including all favorites, hobbies, dream jobs, and the profile picture filepath. 
 * @author JC
 */
public class ProfileJC {


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


    /**
     * The constructor for the Profile class creates new variables and sets them all to null.
     * @author JC
     */
    public ProfileJC()
    {

    }

    /**
     * Returns the favTVShow String object variable which is the favorite TV show or it returns null if favTVShow has not been changed from the default.
     * @return favTVShow String object variable or null if the favTVShow has not been changed.
     * @author JC
     */
    public String getFavTVShow(){
            return favTVShow; 
    }

     /**
     * Returns the favColor String object variable which is the favorite color or it returns null if favColor has not been changed from the default.
     * @return favColor String object variable or null if the favColor has not been changed.
     * @author JC
     */
    public String getFavColor(){
            return favColor;
    }

    /**
     * Returns the favFood String object variable which is the favorite food or it returns null if favFood has not been changed from the default.
     * @return favFood String object variable or null if the favFood has not been changed.
     * @author JC
     */
    public String getFavFood(){
            return favFood; 
    }

    /**
     * Returns the favAnimal String object variable which is the favorite animal or it returns null if favAnimal has not been changed from the default.
     * @return favAnimal String object variable or null if the favAnimal has not been changed.
     * @author JC
     */
    public String getFavAnimal(){
            return favAnimal; 
    }

    /**
     * Returns the dreamJob String object variable which is the dream job or it returns null if dreamJob has not been changed from the default.
     * @return dreamJob String object variable or null if the dreamJob has not been changed.
     * @author JC
     */
    public String getDreamJob(){
            return dreamJob;
    }

    /**
     * Returns the hobby String object variable which is the series of hobbies or it returns null if hobby has not been changed from the default.
     * @return hobby String object variable or null if the hobby has not been changed.
     * @author JC
     */
    public String getHobby(){
            return hobby;
    }

    /**
     * Returns the favBook String object variable which is the favorite book or it returns null if favBook has not been changed from the default.
     * @return favBook String object variable or null if the favBook has not been changed.
     * @author JC
     */
    public String getFavBook(){
            return favBook;
    }

    /**
     * Returns the favMusic String object variable which is the favorite music or it returns null if favMusic has not been changed from the default.
     * @return favMusic String object variable or null if the favMusic has not been changed.
     * @author JC
     */
    public String getFavMusic(){
            return favMusic;
    }

    /**
     * Returns the favClass String object variable which is the favorite class or it returns null if favClass has not been changed from the default.
     * @return favClass String object variable or null if the favClass has not been changed.
     * @author JC
     */
    public String getFavClass(){
            return favClass;
    }

    /**
     * Takes parameter String object favTVShow and sets variable favTVShow equal to it. 
     * @param favTVShow String object that is the favorite TV Show or TV Shows.
     * @author JC
     */
    public void setFavTVShow(String favTVShow){
            this.favTVShow = favTVShow; 
    }

    /**
     * Takes parameter String object favColor and sets variable favColor equal to it. 
     * @param favColor String object that is the favorite Color or Colors.
     * @author JC
     */
    public void setFavColor(String favColor){
            this.favColor = favColor;
    }

    /**
     * Takes parameter String object favFood and sets variable favFood equal to it. 
     * @param favFood String object that is the favorite Food or Foods.
     * @author JC
     */
    public void setFavFood(String favFood){
            this.favFood = favFood;
    }

    /**
     * Takes parameter String object favAnimal and sets variable favAnimal equal to it. 
     * @param favAnimal String object that is the favorite Animal or Animals.
     * @author JC
     */
    public void setFavAnimal(String favAnimal){
            this.favAnimal = favAnimal; 
    }

    /**
     * Takes parameter String object dreamJob and sets variable dreamJob equal to it. 
     * @param dreamJob String object that is the dream job or jobs.
     * @author JC
     */
    public void setDreamJob(String dreamJob){
            this.dreamJob = dreamJob; 
    }

    /**
     * Takes parameter String object hobby and sets variable hobby equal to it. 
     * @param hobby String object that is the favorite hobby or hobbies.
     * @author JC
     */
    public void setHobby(String hobby){
            this.hobby = hobby;
    }

    /**
     * Takes parameter String object favBook and sets variable favBook equal to it. 
     * @param favBook String object that is the favorite book or books.
     * @author JC
     */
    public void setFavBook(String favBook){
            this.favBook = favBook; 
    }

    /**
     * Takes parameter String object favMusic and sets variable favMusic equal to it. 
     * @param favMusic String object that is the favorite Music.
     * @author JC
     */
    public void setFavMusic(String favMusic){
            this.favMusic = favMusic; 
    }

    /**
     * Takes parameter String object favClass and sets variable favClass equal to it. 
     * @param favClass String object that is the favorite class or classes.
     * @author JC
     */
    public void setFavClass(String favClass){
            this.favClass = favClass; 
    }

    /**
     * Takes the parameter String object pictureFile which is the filepath of the profile picture and sets the variable pictureFile equal to it.
     * @param pictureFile  String object that is the filepath of the profile picture ending in .png or .jpg
     * @author JC
     */
    public void setProfilePicture(String pictureFile){

    }
}

