<%@ page import ="f4k.*"%>
<%@ page import ="java.util.Collections"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import = "java.util.Date"%>
<%Repository repo = Repository.instance();
User theUser = (User)session.getAttribute("userVisited");
User logInUser = (User)session.getAttribute("loggedInUser");
if(theUser == null)
        {
                theUser = logInUser;
        }

Wall theWall = theUser.getWall();
System.out.println(theUser.getUsername());

%>
<%out.print("<form action = \"addPost.jsp\"   method=\"GET\">");%>
	<input type=text size=20 name="addParam"/>
	</br>
	<input type=submit name=submit Value="Send"/>

</form>
<%
System.out.println("bombing at wallposts");
ArrayList<String> s = new ArrayList<String>();
System.out.println("s is " + s);
System.out.println("thewall.getposts is " + theWall.getPosts());
ArrayList<WallPost> posts = theWall.getPosts();
System.out.println("bombing at wallposts");
Collections.sort(posts);
Collections.reverse(posts);
for(int i =0;i<posts.size();i++){
	WallPost onePost = posts.get(i);
	User author = onePost.getAuthor();
	Date cDate = onePost.getDate();
	out.print("<b><font face=\"Comic Sans MS\">"+author.getUsername()+"</font></b>: "+onePost.getText()+"<i><font size=2> "+cDate+"</font></i>");
	if(logInUser.equals(theUser)|| logInUser.equals(author))
	{
		out.print("<img src=\"trashcan.png\" height=20 width=20 /><a href=\"deletePost.jsp?deletePost=" + cDate.getTime()+"\" >Delete<a>");
	}
	out.print("</br>");
}
%>


