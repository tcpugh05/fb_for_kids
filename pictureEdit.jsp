<%@ page import = "f4k.User"%>
<%@ page import = "f4k.Profile"%>
<html>
<body bgcolor="ADD8E6">
<center>
<h1><font face="Comic Sans MS">Choose your profile picture!</font></h1>
<font size=1></br>
</br>
</font>
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
	 User loggedInUser=(User)session.getAttribute("loggedInUser");
	Profile userProfile = loggedInUser.getProfile();
%>
<img src="penguin.png" height=100 width=100/> Penguin
<img src="dolphin.jpg" height=100 width=100/> Dolphin
<img src="monkey.jpg" height=100 width=100/> Monkey
</br>
<img src="panda.png" height=100 width=100/> Panda
<img src="dino.png" height=100 width=100/> Dino
<img src="tiger.jpg" height=100 width=100/> Tiger
</br>
<img src="ninja monkey.gif" height=100 width=100/> Ninja
<img src="rainbow.gif" height=100 width=100/> Rainbow
<img src="flowers.gif" height=100 width=100/> Flowers
</br>
<form name="picture" action="profilePictureCon.jsp?userParam=self">
<input type="radio" name="picture" value="penguin"> Penguin<br>
<input type="radio" name="picture" value="dolphin"> Dolphin<br>
<input type="radio" name="picture" value="monkey"> Monkey<br>
<input type="radio" name="picture" value="panda"> Panda<br>
<input type="radio" name="picture" value="dino"> Dinosaur<br>
<input type="radio" name="picture" value="tiger"> Tiger<br>
<input type="radio" name="picture" value="ninja"> Ninja<br>
<input type="radio" name="picture" value="rainbow"> Rainbow<br>
<input type="radio" name="picture" value="flowers"> Flowers<br>
<input type=submit name=submit vaule="Submit changes"/>
</form>
</center>
</body>
</html>
