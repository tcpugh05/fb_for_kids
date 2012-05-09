<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.WallPost"%>
<%@ page import= "f4k.Club"%>
<%@ page import="f4k.Censor"%>
<%Repository meUser = Repository.instance();
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User theUser =(User) session.getAttribute("userVisited");
Club theClub = (Club)session.getAttribute("groupVisited");
Wall theWall = theClub.getWall();
User loginUser=(User) session.getAttribute("loggedInUser");
boolean isSafe = Censor.isSafe(request.getParameter("addParam"));
if(isSafe == false)
{
	response.sendRedirect("dontCuss.jsp");
}
else{
theWall.addPost(loginUser,request.getParameter("addParam"));
theClub.save();
response.sendRedirect("groupPage.jsp?nameParam="+theClub.getClubName());
}
%>


