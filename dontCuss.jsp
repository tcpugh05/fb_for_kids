<%@ page import="f4k.User"%>
<html>
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User u = (User) session.getAttribute("loggedInUser");
String username = u.getUsername();
session.removeAttribute("loggedInUser");
session.setAttribute("userVisited",null);
%>
<center>
<body bgcolor="ADD8E6">
<h1><font face="Comic Sans MS">Do not cuss or be a pest! 
For your troublemaking you have been logged out.</font></h1>
</br></br>
<img src="shocked.jpg" height=400 width=350 align=center />
</br>
</br>
<%out.print("<a href=\"loginAgain.jsp?username="+username+"\">LEAVE</a>");%>
</center>
</body>
</html>
