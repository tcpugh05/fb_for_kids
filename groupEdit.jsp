<%@ page import = "f4k.User"%>
<%@ page import = "f4k.Profile"%>
<%@ page import = "f4k.Club"%>
        <%
        

if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
	 User loggedInUser=(User)session.getAttribute("loggedInUser");
        Club theClub = (Club)session.getAttribute("groupVisited");
        out.print("<form action=\"groupEditController.jsp\" method= \"GET\">");
        out.print("Title:  <input type=text size=120 name=\"titleParam\"/ value=\""+theClub.getClubName() +"\"/>");
        out.print("<br/>");
	out.print("Description: <input type=text size=120 name=\"descParam\" value=\""+theClub.getDescription()+"\"/>");
	out.print("</br>");
	out.print("<input type=submit name=submit value =\"Commit change\">");
        out.print("</form>");
%>
