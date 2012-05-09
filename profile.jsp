<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Profile"%>
<html>
<head><head/>
<body bgcolor="ADD8E6">
	<%@ include file="menu.jsp"%>
	<%
	if((User) session.getAttribute("loggedInUser")==null)
	{
		response.sendRedirect("login.jsp");
	}
	User loggedInUser=(User)session.getAttribute("loggedInUser");
	String theURL = request.getParameter("userParam");
	Repository meUser = Repository.instance();
	User thePage = meUser.getUser(theURL);
	if(thePage == null)
	{
		if(theURL == null){
			thePage =(User)session.getAttribute("userVisited");
		}
		else if(theURL.equals("self")){
			thePage = loggedInUser;
			
		}
	}
	session.setAttribute("userVisited",thePage);
	System.out.println("setting uservisited attribute");
	out.print("<h1><font face=\"Comic Sans MS\">" +thePage.getUsername()+ "'s Profile</font></h1><font size=1> </br></font>");
	if(loggedInUser != thePage){
	out.print("<form action=\"message.jsp?friend="+thePage.getUsername()+"\"");
	out.print("method=\"GET\"> <input type=\"submit\" name=submit value=\"Send Message\"");
	out.println("<font size=1></br></font>");	
	out.println("</form>");
	}
	Profile userProfile = thePage.getProfile();
	if(userProfile.getProfilePicture() != null){
	if(!userProfile.getProfilePicture().contains(".")){
		out.print("<img src=f4kprofile.png height=100 width=100/>");
	}
	System.out.println("In profile: the filename is"+userProfile.getProfilePicture());	
	if(userProfile.getProfilePicture().contains(".")){
		out.print("<img src=\"" +userProfile.getProfilePicture() +"\" height=100 width=100 />");
	}
	}
	//else{
	//	out.print("<img src=f4kprofile.png height=100 width=100 />");
	//}
	if( thePage == loggedInUser){
%>
		<form action="pictureEdit.jsp" method="GET">
		<input type=submit name=submit value="Change profile picture">
		</form>
<%
	}
	out.print("</br>");
	out.print("Favorite TV Show: " + userProfile.getFavTVShow());
	out.print("</br>");
	out.print("Favorite Color: " + userProfile.getFavColor());
	out.print("</br>");
	out.print("Favorite Food: " + userProfile.getFavFood());
	out.print("</br>");
	out.print("Favorite Animal: " + userProfile.getFavAnimal());
	out.print("</br>");
	out.print("Dream Job: " + userProfile.getDreamJob());
	out.print("</br>");
	out.print("Favorite Book: " + userProfile.getFavBook());
	out.print("</br>");
	out.print("Favorite Music: " + userProfile.getFavMusic());
	out.print("</br>");	
	%>
	<%		if(loggedInUser == thePage){ 
	out.println("<form action=\"profileEdit.jsp\" method=\"GET\">");
		out.println("<input type=submit name=submit value=\"edit\">");
	out.println("</form>"); %>	
	<%}
	else{ %>
		This is not your page<br>
	<%	}%>
	
	<%out.print("<h1>Wall</h1>");%>
	<%@include file="wall.jsp"%>
</body>
