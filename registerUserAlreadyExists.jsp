<html>
<body bgcolor="ADD8E6">
<%@ include file="loginMenu.jsp" %>
<center>
<form style="background-color: pink">
<b><font size=3> That username is taken. Try using something else. </font></b></form>
<font size=1></br></br>
<img src="shrug.jpg" height=200 width=150 align=center />
</br></font>
<h1 style="text-align:center;"><font face="Comic Sans MS"> Register </font></h1>
<form style="text-align:center;" action="registerController.jsp"  >
Pick a username: <input type="text" name="user1" size=20 /> <br>
Pick a password: <input type="password" name="password1" /> <br>
Re-enter password: <input type="password" name="password2" /> <br>

<input type="submit" value="Register!" />


</form>
</html>
