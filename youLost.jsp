<%@ include file="menu.jsp"%>
<html>
<body bgcolor="ADD8E6">
<center>
<%out.print("<h1><font face=\"Comic Sans MS\">You lost...</h1>");
%>
<img src="loser.jpg" height=300 width=400 align=center />
<%

out.print("</br></br>The word was actually <b> "+request.getParameter("wordParam")+"</b></br>");
%>
<a href="hangman.jsp">Play Again</a>
</center>
</body>
</html>
