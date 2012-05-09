<%@page import="f4k.Repository"%>
<%@page import="f4k.User"%>
<%@page import="f4k.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="f4k.FriendRequestMessage"%>
<%@page import="java.util.Collections"%>
<%@include file="menu.jsp"%>
<html>
<BODY BGCOLOR="#ADD8E6">
<img src="mailbox.jpg" height=400 width=300 align=right />
<h1><font face="Comic Sans MS">Inbox</font></h1>
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
System.out.println("On inbox.jsp");
Repository meUSer = Repository.instance();
User loginUser = (User) session.getAttribute("loggedInUser"); 
System.out.println("at messages");
ArrayList<Message> theMessages = loginUser.getReceivedMessage();
Collections.sort(theMessages);
Collections.reverse(theMessages);
if(theMessages.size() == 0){
	System.out.println("nill");
	out.print("Your mailbox is empty.");
}
else{
	System.out.println("yay");
	for(int i=0;i<theMessages.size();i++){
		Message aMsg = theMessages.get(i);
		if(!aMsg.getText().equals("I want to be your friend!")){
		System.out.println("at if");
		out.print("From: "+aMsg.getAuthor().getUsername()+" "+ aMsg.getTitle());
		out.print("<a href=\"viewMessage.jsp?msgDate="+aMsg.getDateSent().getTime()+"\">View Message</a>");
		out.print("</br>");
		}
		else if(aMsg.getText().equals("I want to be your friend!")){
		System.out.println("at else if");
		out.print("From: "+ aMsg.getAuthor().getUsername() +"  "+aMsg.getText());
			System.out.println("Is this where the problem is");	
			out.print("<a href=\"deleteMessage.jsp?deleteMsg=" + aMsg.getDateSent().getTime() +"\">Delete<a>|");
			System.out.println("Is this where the problem is 1");	
		
			out.print("<a href=\"acceptFRMessage.jsp?msgDate="+ aMsg.getDateSent().getTime() + "\">Accept</a>|");
			System.out.println("Is this where the problem is");	

			out.print("<a href=\"denyFRMessage.jsp?msgDate=" + aMsg.getDateSent().getTime()+"\">Deny</a>");		
			System.out.println("Is this where the problem is");	
		out.print("</br>");
	}
}


}
		


%>
</body>
</html>

