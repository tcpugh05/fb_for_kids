<html>
<body bgcolor="ADD8E6">
<%@ include file="loginMenu.jsp" %>
<center>
<img src="welcome.jpg" height=100 width=400 align=center />
<h1 style="text-align:center;"><font face="Comic Sans MS"> Register </font></h1>
<b><font style="text-align:center;"><font color="dark pink">Remember to keep your password a secret!</font>
<form style="text-align:center;" action="registerController.jsp"  >
Pick a username: <input type="text" name="user1" size=20 /> <br>
Pick a password: <input type="password" name="password1" /> <br>
Re-enter password: <input type="password" name="password2" /> <br>

<br>
<br>
<input type="submit" value="Register!" />


</form>
</center>
</body>
</html>
