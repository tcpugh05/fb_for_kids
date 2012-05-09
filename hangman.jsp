<%@ page import="f4k.User"%>
<%@ page import="f4k.Hangman"%>
<html>
<body bgcolor="ADD8E6">
<center>
<font face="Comic Sans MS">
	<%@ include file="menu.jsp"%>
	<%
	if((User) session.getAttribute("loggedInUser")==null){
		response.sendRedirect("login.jsp");
	}
	User loggedInUser = (User)session.getAttribute("loggedInUser");
	if(loggedInUser.getGame() ==null || loggedInUser.getGame().getGameStatus()==true)
	{
		System.out.println("myGame is done or null resetting");
		loggedInUser.setGame(new Hangman(loggedInUser.getUsername()));
	}
	Hangman myGame = loggedInUser.getGame();
	System.out.println("In HM guesses left is "+myGame.getTriesLeft());
	System.out.println("In HM quesses are "+myGame.getGuesses());
	System.out.println("In HM display word is"+myGame.getDisplayWord());
	System.out.println("The hidden word is : "+myGame.getWordLookingFor());

	System.out.println("In hangman, filename is "+myGame.getFilenane());
	out.print("</br><img src=\""+myGame.getFilenane()+"\"height=100 width=100/>");	
	
	out.print("</br><h1>"+myGame.getDisplayWord().replace(""," ").trim()+"</h1>");
	out.print("<h1>Number of tries left: "+myGame.getTriesLeft()+"</h1></br>");
	out.print("<h1>You have already guessed: ");
	if(myGame.getGuesses().equals(""))
	{
	out.println("nothing so far...</h1>");
	}
	else{
		out.println(myGame.getGuesses()+"</h1>");
	}
	
	out.println("<form name=\"letter\" action=\"guess.jsp\">");
	char letter;
	for( letter ='a'; letter <= 'z';letter ++)
	{
		boolean isChecked = false; 
		if(myGame.getGuesses().indexOf(letter) == -1){
		out.print(letter+"<input type=\"radio\" name=\"letterParam\" value=\""+letter+ "\"");	
		if(isChecked == false)
		{
			out.println("CHECKED>");
			isChecked = true;
		}
		//	out.println("</br>");
		}
	}
	out.println("</br>");	
	out.print("<input type=\"submit\" name=\"Guess!\" value=\"Guess!\"/></center>");
	%>
</font>
</body>
</html>
