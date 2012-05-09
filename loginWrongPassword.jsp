<html>

<%@ include file="loginMenu.jsp" %>
<center>
<body bgcolor="ADD8E6">
<form style="background-color: pink">
<b><font size=3> That is the wrong password. Did you type it correctly? Remember to keep it a secret!</font> </b>
</form> 

<h1><font face="Comic Sans MS">Login </font></h1>
<img src="shrug.jpg" height=200 width=150 align=center />
</br>
</br>
<form action="loginController.jsp">
Enter your username: <input type="text" name="username" size=20 /> <br>
Enter your password: <input type="password" name="password"/> <br>


<input type ="submit" value="Login" />
</form> 
</center>
</body>
</html>
