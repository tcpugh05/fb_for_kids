<%@page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Profile"%>
<%@ include file="menu.jsp"%>
<html>
<BODY BGCOLOR="#ADD8E6">
</body>
</html>
<h1><font face="Comic Sans MS">Write a message!</h1></font>
<img src="writing.jpg" height=300 width=350 align=right />
<%
User fromUser = (User) session.getAttribute("loggedInUser");
User toUser = (User) session.getAttribute("userVisited");
out.print("TO:"+toUser.getUsername() + "</br>");
out.print("FROM:"+fromUser.getUsername()+"</br>");
out.print("<form action = \"sendMessage.jsp\"   method=\"GET\">");
%>
	TITLE: 
       <input type=text size=110 name="titleParam"/>
        </br>
	<textarea rows="15" cols="96"  name="msgParam"></textarea>
	</br>
	<input type=submit name=submit Value="Send"/>




