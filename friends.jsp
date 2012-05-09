<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Profile"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head><head/>
<body BGCOLOR="#ADD8E6">


	<%@ include file="menu.jsp"%>
<img src="friendsKids.jpg" height=200 width=200 align=right />

<h1><font face="Comic Sans MS">
Friends
</h1></font>

<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User theUser = (User)session.getAttribute("loggedInUser");
ArrayList<User> myFriends = theUser.getAllFriends();
out.println("You currently have "+ myFriends.size()+" friend(s)</br></br>");
for(int i = 0; i < myFriends.size();i++)
{
	User f = myFriends.get(i);
	out.print("<font face=\"Comic Sans MS\">"+f.getUsername()+"</font><a href=\"profile.jsp?userParam="+f.getUsername()+ "\">Checkout Profile</a>");
	out.print("</br>");
}
%>
</body>
<html>
