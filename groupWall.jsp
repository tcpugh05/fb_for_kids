<%@ page import ="f4k.Repository"%>
<%@ page import ="f4k.User"%>
<%@ page import ="f4k.Wall"%>
<%@ page import ="f4k.WallPost"%>
<%@ page import ="java.util.Collections"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import = "java.util.Date"%>
<%
Club aClub = (Club)session.getAttribute("groupVisited");
System.out.println("In groupwall, Clubs name is :"+aClub.getClubName());
User logInUser = (User)session.getAttribute("loggedInUser");
Wall theWall = aClub.getWall();
%>
<%out.print("<form action = \"addGroupPost.jsp\"   method=\"GET\">");%>
        <input type=text size=20 name="addParam"/>
        </br>
        <input type=submit name=submit Value="Send"/>

</form>
<%
System.out.println("about to get to the warzone");
ArrayList<WallPost> posts = theWall.getPosts();
Collections.sort(posts);
Collections.reverse(posts);
for(int i =0;i<posts.size();i++){
        WallPost onePost = posts.get(i);
        User author = onePost.getAuthor();
        Date cDate = onePost.getDate();
        out.print("<b><font face=\"Comic Sans MS\">"+author.getUsername()+"</font></b>: "+onePost.getText()+"<i><font size=2> "+cDate+"</font></i>");
        if(logInUser.getUsername().equals(aClub.getAdministratorName()) || logInUser.equals(author)){        
		out.print("<img src= \"trashcan.png\" height=20 width=20 /><a href=\"deleteGroupPost.jsp?deletePost=" + cDate.getTime()+"\" >Delete<a>");
        }
	out.print("</br>");
}
%>
</html>        
