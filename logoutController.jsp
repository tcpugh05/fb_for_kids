<%@ page import="f4k.*" %>
<html>
<body>


<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User u = (User) session.getAttribute("loggedInUser");
String username = u.getUsername();
session.removeAttribute("loggedInUser");
response.sendRedirect("loginAgain.jsp?username=" + username);


%>

</body>
</html>
