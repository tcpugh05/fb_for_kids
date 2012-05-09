<%@ page import = "f4k.Repository"%>
<%@ page import = "f4k.User"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.Collection"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.Set"%>
<%@ page import = "java.util.Map"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "f4k.Message"%>

<%@ include file="menu.jsp"%>
<html>
<body bgcolor="ADD8E6">
<h1><font face="Comic Sans MS"> Make new friends!</font></h1>
<font size=1></br></br></font>
<img src="playground.jpg" height=400 width=300 align=right />
<%
if((User) session.getAttribute("loggedInUser")==null)
{
	response.sendRedirect("login.jsp");
}
Repository meUser = Repository.instance();
HashMap<String,User> theUsers = meUser.getAllUsers();
Collection<User> c = theUsers.values();
Iterator<User> i = c.iterator();
User loginUser =(User) session.getAttribute("loggedInUser");
boolean requestedFriend;
while(i.hasNext())
{
	requestedFriend=false;
	User theUser = i.next();
	System.out.println("The user is " +theUser.getUsername() + " and the logged in user is " +loginUser.getUsername());
	if(!loginUser.equals(theUser))
	{
		ArrayList<Message> theMessages = theUser.getReceivedMessage();
		//	out.println("themassage.size is " + theMessages.size());
		for(int j =0; j <theMessages.size();j++)
		{
			Message theMessage = theMessages.get(j);
			System.out.println("themessageauthor is " + theMessage.getAuthor());
			if(theMessage.getAuthor()==(loginUser) && theMessage.getText().equals("I want to be your friend!")){
				requestedFriend = true;
			}	
		}
		if(!loginUser.isFriend(theUser) && !requestedFriend){
			out.print("<font size=\"5\">"+theUser.getUsername()+"</font>");
			out.print("<a href=\"sendFriendRequest.jsp?friend=" + theUser.getUsername() + "\">   Send Friend Request</a>");
			out.print("</br>");
		}
	}

}
%>
