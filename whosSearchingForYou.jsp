<%@ page import="f4k.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.*" %>
<%@ include file="menu.jsp"%>
<html>
<body>
<body bgcolor="ADD8E6">
<%
User loginUser = (User) session.getAttribute("loggedInUser");
out.println("<h1><font face=\"Comic Sans MS\"> See who has searched for you. </font></h1><br>");
HashMap<String,Date> creepers = loginUser.getCreepers();
if(creepers.size() == 0){
	out.println("<center></br></br></br><font size=3>No one has searched for you</font></br></center>");
	%> </br><center> <img src="alone.jpg" height=200 width=300 align="center" /></center> <%
}

else{
	%> <img src="searching.jpg" height=250 width=300 align=right /> <%
	Iterator<String> i = creepers.keySet().iterator();
	out.println("<a href=\"deleteCreeper.jsp?creeper=all\">Clear all searches</a><br>");
	while(i.hasNext()){
		String creeperName = i.next();
		User creepUser = Repository.instance().getUser(creeperName);
		Date d = creepers.get(creeperName);
		String creepDate="";
		String creepTime="";
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		creepDate= sdf.format(d);
		creepTime = time.format(d);
		if(loginUser.getUsername().equals(creeperName)){
			out.println("You searched for yourself on "+creepDate+ "at "+creepTime+"<img src=\"trashcan.png\" height=20 width=20 /><a href=\"deleteCreeper.jsp?creeper="+creeperName+"\">Delete this item</a><br>");
		}
		else{
			out.println(creeperName + " searched for you on " + creepDate + " at " + creepTime+"<img src=\"trashcan.png\" height=20 width=20 /><a href=\"deleteCreeper.jsp?creeper="+creeperName+"\">Delete this item</a> <br>");
		}
		if(creepUser.isFriend(loginUser)){
			out.print("<a href=\"profile.jsp?userParam="+creeperName+ "\">Checkout"+creeperName+" 's Profile</a> <br>");
		}

		else{
		boolean requestedFriend = false;
		 ArrayList<User> fwend = loginUser.getAllFriends();
			if(creepUser != loginUser){
		ArrayList<Message> theMessages = creepUser.getReceivedMessage();
		//	out.println("themassage.size is " + theMessages.size());
		for(int j =0; j <theMessages.size();j++)
		{
			Message theMessage = theMessages.get(j);
			System.out.println("themessageauthor is " + theMessage.getAuthor());
			if(theMessage.getAuthor()==(loginUser) && theMessage.getText().equals("I want to be your friend!")){
				requestedFriend = true;
			}	
		}
		if(!loginUser.isFriend(creepUser) && !requestedFriend){
			out.print("<font size=\"5\">"+creepUser.getUsername()+"</font>");
			out.print("<a href=\"sendFriendRequestFromCreeper.jsp?friend=" + creepUser.getUsername() + "\">   Send Friend Request</a>");
			out.print("</br>");
		}
		
		}
	}
}
}
%>
</body>
</html>
