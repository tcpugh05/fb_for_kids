<html>

<%@ include file="loginMenu.jsp" %>
<body bgcolor="ADD8E6">
<br>
<center>
You logged out of F4K. Come back soon!
</br></br>
<img src="goodbye.jpg" height=150 width=150 alignt=center />
</center>

<%
String defaultUsername= request.getParameter("username");
%>
<h1 style="text-align:center;color:red"><font face="Comic Sans MS">Login </font></h1> <br>
<form style="text-align:center;"action="loginController.jsp">
<%
out.println("Enter your username: <input type=\"text\" name=\"username\" size=20 value=\""+defaultUsername+"\" /> <br>");
%>
Enter your password: <input type="password" name="password"/> <br>

<br>
<br>
<input type ="submit" value="Login" />
</form> 

</body>
</html>
