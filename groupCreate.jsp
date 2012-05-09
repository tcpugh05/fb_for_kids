<%@ page import ="f4k.Club"%>
<%@ include file="menu.jsp"%>

<html>
<body bgcolor="ADD8E6">
<h1><font face="Comic Sans MS">Create your club!</font></h1>
<font size=1></br></font>
<img src="fort.jpg" width=300 height=300 align=right />
	<form action="createGroupController.jsp" method="GET">
	Name of group<input type=text size=120 name="nameParam" value="">
	<br>
	Description of Club
	<textarea rows="15" cols="70" name="desParam"></textarea>
	<input type=submit name=submit value="Add club"/>
	</form>
</body>
</html>









