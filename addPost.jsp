<%@ page import= "f4k.Repository"%>
<%@ page import= "f4k.User"%>
<%@ page import= "f4k.Wall"%>
<%@ page import= "f4k.Censor"%>
<%@ page import= "f4k.WallPost"%>
<%Repository meUser = Repository.instance();
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User theUser =(User) session.getAttribute("userVisited");
Wall theWall = theUser.getWall();
User loginUser=(User) session.getAttribute("loggedInUser");
String thePost = request.getParameter("addParam");
boolean isSafe = Censor.isSafe(thePost);
if(isSafe == false)
{
	response.sendRedirect("dontCuss.jsp");
}
else{
theWall.addPost(loginUser,request.getParameter("addParam"));
theUser.save();
response.sendRedirect("profile.jsp");
}
%>

