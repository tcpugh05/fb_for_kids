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
<body bgcolor="ADD8E6">
<h1><font face="Comic Sans MS"> Send a reply! </font></h1>
<img src="writing.jpg" height=300 width=400 align=right />
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
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
session.setAttribute("replyMsg",theMessage);
String rTitle = "Reply:"+theMessage.getTitle();
out.print("<form action=\"replyController.jsp\" method=\"GET\">");
out.print("Title: "+rTitle +"</br>");
out.print("<textarea rows=\"15\" cols=\"70\" name=\"msgParam\">\n"+"\n\n------------\n"+theMessage.getText()+"</textarea>");
out.print("</br>");
out.print("<input type=\"submit\" name=submit value=\"Reply\"/>");
out.print("</form>");
out.print("</br> <a href=inbox.jsp>Go Back<a>");
%>


