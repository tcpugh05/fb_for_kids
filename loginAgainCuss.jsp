<html>

<%@ include file="loginMenu.jsp" %>
<br>
You were automatically logged out from the site because you cussed. Don't cuss!

<%
String defaultUsername= request.getParameter("username");
%>
<h1 style="text-align:center;color:red">Login </h1> <br>
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
