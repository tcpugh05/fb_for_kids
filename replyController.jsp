<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Message"%>
<%@ page import= "f4k.FriendRequestMessage"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.lang.Long"%>
<%@ page import = "f4k.Censor"%>
<%@ include file="menu.jsp"%>
<%
User fromUser = (User)session.getAttribute("loggedInUser");
Message theMessage = (Message) session.getAttribute("replyMsg");
String title = "Reply:"+ theMessage.getTitle(); 
String text = request.getParameter("msgParam");
boolean isSafe = Censor.isSafe(text);
if(isSafe == false)
{
        response.sendRedirect("dontCuss.jsp");
}
else{
Message newMessage = new Message(title,fromUser,theMessage.getAuthor(),text);
fromUser.sendMessage(newMessage,theMessage.getAuthor());
response.sendRedirect("inbox.jsp");
}
%>
