<%@ page import = "f4k.Repository"%>
<%@ page import = "f4k.User"%>
<%@ page import = "f4k.FriendRequestMessage"%>
<%@ page import = "f4k.Message"%>
<%
User loginUser = (User)session.getAttribute("loggedInUser");
String name  = request.getParameter("friend");
System.out.println("name is "+name);
Repository meUser  = Repository.instance();
User addUser = meUser.getUser(name);
FriendRequestMessage theMsg = new FriendRequestMessage(loginUser,addUser,"I want to be your friend!");
System.out.println("Right before message sendout");
loginUser.sendMessage(theMsg,addUser);
String here = request.getParameter("wasHere");
System.out.println("here is "+ here);
%>
<jsp:forward page = "whosSearchingForYou.jsp"/>
