<%@page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Profile"%>
<%@ page import="f4k.Message"%>
<%@ page import="f4k.Censor"%>
<%@ include file="menu.jsp"%>

<%

if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }

User fromUser = (User) session.getAttribute("loggedInUser");
User toUser = (User) session.getAttribute("userVisited");
String title = request.getParameter("titleParam");
String message= request.getParameter("msgParam");
boolean isSafe = Censor.isSafe(message);
boolean titleSafe = Censor.isSafe(title);
if(isSafe == false || titleSafe == false)
{
        response.sendRedirect("dontCuss.jsp");
}
else{
Message theMessage = new Message(title,fromUser,toUser,message);
fromUser.sendMessage(theMessage,toUser);
response.sendRedirect("profile.jsp?userParam=self");
}
%>
