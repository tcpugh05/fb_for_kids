<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.lang.Long"%>
<%
System.out.println("Inside deleteWallPost");
User theUser = (User)session.getAttribute("userVisited");
Wall theWall = theUser.getWall();
long format = Long.parseLong(request.getParameter("deletePost"));
Date theDate = new Date(format);
request.getParameter("deletePost");
ArrayList<WallPost> posts = theWall.getPosts();
System.out.println("THE DATE IS: " + theDate);
for(int i = 0; i <posts.size(); i++)
{
	System.out.println(posts.get(i).getDate());
	if(posts.get(i).getDate().equals(theDate))
	{
		System.out.print("The post should delete here");
		theWall.deleteWallPost(posts.get(i));
		theUser.save();
	} 
}
%>
<jsp:forward page="profile.jsp"/>

