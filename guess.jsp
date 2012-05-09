<%@ page import = "f4k.User"%>
<%@ page import = "f4k.Hangman"%>
<%@ include  file ="menu.jsp"%>
<%
	if((User) session.getAttribute("loggedInUser")==null){
		response.sendRedirect("login.jsp");
	}
	User theUser = (User)session.getAttribute("loggedInUser");
	Hangman myGame = theUser.getGame();
	myGame.guess(request.getParameter("letterParam").charAt(0));
	if(myGame.getGameStatus()==true)
	{
	 	 if(!myGame.getDisplayWord().contains("_"))
                {
                        response.sendRedirect("youWon.jsp?wordParam="+myGame.getWordLookingFor());
                }
		else
		{
			response.sendRedirect("youLost.jsp?wordParam="+myGame.getWordLookingFor());
		}
	}
	else{
	response.sendRedirect("hangman.jsp");
	}
%>
