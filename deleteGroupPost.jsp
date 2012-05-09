<%@page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Club"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.lang.Long"%>
<%
Club theClub = (Club)session.getAttribute("groupVisited");
Wall theWall = theClub.getWall();
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
		theClub.save();
        }
}
response.sendRedirect("groupPage.jsp?nameParam="+theClub.getClubName());
%>

