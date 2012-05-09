<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Message"%>
<%@ page import= "f4k.FriendRequestMessage"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.lang.Long"%>
 <%@ include file="menu.jsp"%>
<html>
<body bgcolor="ADD8e6">
<h1><font face="Comic Sans MS"> Read your message </font></h1>
<img src="reading.jpg" height=300 width=350 align=right />
<%
User theUser = (User)session.getAttribute("loggedInUser");
long format = Long.parseLong(request.getParameter("msgDate"));
Date theDate = new Date(format);
ArrayList<Message> theMessages = theUser.getReceivedMessage();
Message theMessage = new Message();
for(int i = 0; i <theMessages.size(); i++)
{
        System.out.println(theMessages.get(i).getDateSent());
        if(theMessages.get(i).getDateSent().equals(theDate))
        {
                theMessage = theMessages.get(i);
        }
}
out.print("<a href=\"reply.jsp?msgDate="+theMessage.getDateSent().getTime()+"\">reply</a>");
out.print("</br>");
out.print("FROM: "+theMessage.getAuthor().getUsername() +"</br>");
out.print("TITLE: "+theMessage.getTitle() + "</br>");
out.print("MESSAGE: </br><textarea rows=15 cols=70 readonly=\"readonly\">"+theMessage.getText()+"</textarea>");
out.print("</br> <a href=inbox.jsp>Go back<a>");
%>
