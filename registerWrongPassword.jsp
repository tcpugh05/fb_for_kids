<html>
<%@ include file="loginMenu.jsp" %>
<body bgcolor="ADD8E6">
<center>
<form style="background-color: pink">
<b><font size=3> Your passwords didn't match up. Please try it again, but remember to keep your password a secret!</font> </b>
</form>
<img src="shrug.jpg" height=200 width=150 align=center />
<h1 style="text-align:center;"><font face="Comic Sans MS"> Register </font></h1>
<form style="text-align:center;" action="registerController.jsp"  >
Pick a username: <input type="text" name="user1" size=20 /> <br>
Pick a password: <input type="password" name="password1" /> <br>
Re-enter password: <input type="password" name="password2" /> <br>

<input type="submit" value="Register!" />


</form>
</body>
</center>
</html>
