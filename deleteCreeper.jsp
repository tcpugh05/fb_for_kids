<%@ page import="f4k.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.*" %>
 <%@ include file="menu.jsp"%>

<html>
<body>

<%
String creeper = request.getParameter("creeper");
User loginUser=(User) session.getAttribute("loggedInUser");
HashMap<String,Date> creepers = loginUser.getCreepers();
if(creeper.equals("all")){
 creepers.clear();
}

else{
creepers.remove(creeper);
}

loginUser.setCreepers(creepers);
response.sendRedirect("whosSearchingForYou.jsp");
%>



</body>
</html>
