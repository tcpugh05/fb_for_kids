<%@ include file="menu.jsp"%>
<html>
<body bgcolor="ADD8E6">
<center>

<%out.print("<h1><font face=\"Comic Sans MS\">You Won! </h1></br>");%>

<img src="winner.jpg" height=300 width=350 align=center />

<%out.print("</br></br>The word was <b>"+request.getParameter("wordParam")+"</b></br>");
%>
<a href="hangman.jsp">Play Again</a>
</center>
</body>
</html>
