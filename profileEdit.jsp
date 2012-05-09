<%@ page import = "f4k.User"%>
<%@ page import = "f4k.Profile"%>
<html>
	<% 
	if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
	 User loggedInUser=(User)session.getAttribute("loggedInUser");
	Profile userProfile = loggedInUser.getProfile();
	out.print("<form action=\"profileEditController.jsp\" method= \"GET\">");
	out.print("Favorite TV Show:  <input type=text size=120 name=\"tvParam\"/ value=\""+userProfile.getFavTVShow() +"\"/>");
        out.print("<br/>");
	out.print("Favorite Color: <input type=text size=120 name=\"colorParam\" value=\""+userProfile.getFavColor()+"\"/>");
        out.print("</br>");
	out.print("Favorite Food: <input type=text size=120 name=\"foodParam\" value=\"" + userProfile.getFavFood() + "\" />");
	out.print("</br>");
	out.print("Favorite Animal: <input type=text size=120 name=\"animalParam\"value =\""+ userProfile.getFavAnimal() + "\" />");
	out.print("</br>");
	out.print("Favorite Book: <input type=text size=120 name=\"bookParam\" value =\"" + userProfile.getFavBook() + "\"");
	out.print("</br>"); 
	out.print("</br>");
	out.print("Dream Job: <input type=text size=120 name=\"jobParam\" value=\"" + userProfile.getDreamJob() + "\" />");
	out.print("</br>"); 
	out.print("Favoirte Music: <input type=text size=120 name=\"musicParam\" value=\""+userProfile.getFavMusic() + "\" />");
	out.print("</br>"); 
	out.print("<input type=submit name=submit value=\"Submit changes\"/>");
	out.print("</form>");
%>
</html>
