<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Message"%>
<%@ page import= "f4k.FriendRequestMessage"%>
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
		FriendRequestMessage theFRMessage = (FriendRequestMessage) theMessages.get(i);
		System.out.println("The post should accept FR here");
		System.out.println("theFRrequester is "+ theFRMessage.getAuthor().getUsername()+ " and theFRrequestee is "+theFRMessage.getRecipient().getUsername());
		theFRMessage.accept();
		System.out.println("FRmessage accepted");	
		theMessages.remove(i);
		System.out.println("message removed");
	} 
}
System.out.println("done with acceptFriend.jsp");
%>

<jsp:forward page="inbox.jsp"/>

