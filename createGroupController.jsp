<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Club"%>
<%@ page import="f4k.Censor"%>
<%@ include file="menu.jsp"%>
<%
Repository meUser = Repository.instance();
User theUser =(User) session.getAttribute("loggedInUser");
String name = request.getParameter("nameParam");
String description = request.getParameter("desParam");
boolean nameSafe = Censor.isSafe(name);
boolean dSafe = Censor.isSafe(description);
if(nameSafe==false || dSafe==false)
{
	response.sendRedirect("dontCuss.jsp");
}
else{
Club newClub = new Club(name,theUser,description);
meUser.createNewClub(newClub);
response.sendRedirect("gymn.jsp");
}
%>
