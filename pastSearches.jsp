<%@ page import="java.util.ArrayList"%>
<%@ page import="f4k.*" %>
<html>
<body>
<body bgcolor="ADD8E6">

<%
User loginUser = (User) session.getAttribute("loggedInUser");
out.println("You have searched for: <br>"); 
ArrayList<String> pastSearches = loginUser.getSearches(); 
//ArrayList<String> pastSearches = (ArrayList<String>) session.getAttribute("pastsearches");

for(int i =0;i<pastSearches.size();i++){
	out.print("<a href=\"searchController.jsp?searchee="+pastSearches.get(i)+ "\">" +pastSearches.get(i) + "</a> <br>");
	}
out.println("<br><br>");


out.println("<a href = \"profile.jsp?userParam=self\">Back To Profile</a>");
%>

</body>
</html>
