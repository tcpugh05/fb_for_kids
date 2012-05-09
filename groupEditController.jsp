<%@ page import="f4k.User"%>
<%@ page import="f4k.Club"%>
<%@ page import="f4k.Censor"%>
<%
Club theClub = (Club)session.getAttribute("groupVisited");

boolean name = Censor.isSafe(request.getParameter("titleParam"));
boolean desc = Censor.isSafe(request.getParameter("descParam"));
if(name&&desc){
theClub.setClubName((User)session.getAttribute("loggedInUser"),request.getParameter("titleParam"));
theClub.setDescription((User)session.getAttribute("loggedInUser"),request.getParameter("descParam"));
response.sendRedirect("groupPage.jsp?nameParam="+theClub.getClubName());
}
else
{
response.sendRedirect("dontCuss.jsp");
}
%>
