<%@ page import = "f4k.User"%>
<%@ page import = "f4k.Profile"%>
<%@ page import = "f4k.Censor"%>
<%

if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }

boolean TV = Censor.isSafe(request.getParameter("tvParam"));
boolean food = Censor.isSafe(request.getParameter("foodParam"));
boolean color = Censor.isSafe(request.getParameter("colorParam"));
boolean animal = Censor.isSafe(request.getParameter("animalParam"));
boolean book = Censor.isSafe(request.getParameter("bookParam"));
boolean job = Censor.isSafe(request.getParameter("jobParam"));
boolean music = Censor.isSafe(request.getParameter("musicParam"));

if(TV&&food&&color&&animal&&book&&job&&music)
{
	User loggedInUser=(User)session.getAttribute("loggedInUser");
	Profile userProfile = loggedInUser.getProfile(); 
	userProfile.setFavTVShow(request.getParameter("tvParam"));
	userProfile.setFavFood(request.getParameter("foodParam"));
	userProfile.setFavColor(request.getParameter("colorParam"));
	userProfile.setFavFood(request.getParameter("foodParam"));
	userProfile.setFavAnimal(request.getParameter("animalParam"));
	userProfile.setFavBook(request.getParameter("bookParam"));
	userProfile.setDreamJob(request.getParameter("jobParam"));
	userProfile.setFavMusic(request.getParameter("musicParam"));
	response.sendRedirect("profile.jsp");
}
else
{
	response.sendRedirect("dontCuss.jsp");
}
%>
