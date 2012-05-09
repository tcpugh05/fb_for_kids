<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Message"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.lang.Long"%>
<%
User theUser = (User)session.getAttribute("loggedInUser");
long format = Long.parseLong(request.getParameter("msgDate"));
Date theDate = new Date(format);
System.out.println("THE DATE IS: " + theDate);
ArrayList<Message> theMessages = theUser.getReceivedMessage();
for(int i = 0; i <theMessages.size(); i++)
{
	System.out.println(theMessages.get(i).getDateSent());
	if(theMessages.get(i).getDateSent().equals(theDate))
	{
		System.out.print("The post should delete here");
		theMessages.remove(i);
	} 
}
%>
<jsp:forward page="inbox.jsp"/>

