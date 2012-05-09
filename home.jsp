<%@ page import="f4k.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<html>
<%@ include file="menu.jsp"%>
<body bgcolor="ADD8E6">
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User loggedInUser = (User)session.getAttribute("loggedInUser");
ArrayList<User> friends = loggedInUser.getAllFriends();
%>
<h1><font face="Comic Sans MS">Recent Posts on Your Wall</font></h1>
<%

Wall yWall = loggedInUser.getWall();
ArrayList<WallPost> yposts = yWall.getPosts();
Collections.sort(yposts);
Collections.reverse(yposts);
for(int j = 0; j<5;j++){
               if(j <yposts.size())
		{
		 out.print("<b>"+yposts.get(j).getAuthor().getUsername()+"</b>: "+yposts.get(j).getText()+"<i> "+yposts.get(j).getDate().toString()+"</i>");

		out.print("</br>");
		} 
        }
if(yposts.size() == 0)
{
	out.print("There are no posts on your wall");
}
%>
<h1><font face="Comic Sans MS">Recent Friend Wall Posts</font></h1>
<%
ArrayList<WallPost>superWall = new ArrayList<WallPost>();
for(int i=0; i <friends.size();i++){
Wall cWall = friends.get(i).getWall();
ArrayList<WallPost> posts = cWall.getPosts();
	for(int j = 0; j<posts.size();j++){
		if(loggedInUser.isFriend(posts.get(j).getAuthor())){
		String text ="On the wall of "+cWall.getOwner().getUsername()+" : "+posts.get(j).getAuthor().getUsername()+ " "+posts.get(j).getText()+" "+ posts.get(j).getDate().toString();
		superWall.add(new WallPost(posts.get(j).getAuthor(),text));
		}
	}
}
if(superWall.size() == 0)
{
	out.print("There are no posts on your friends walls");
}
Collections.sort(superWall);
//Collections.reverse(superWall);
for(int i = 0;i<20;i++){
	if(i < superWall.size()){
		WallPost a = superWall.get(i);
		out.print(a.getText());	
		out.print("</br>");
	}	
	}

%>
<h1><font face="Comic Sans MS">Recently Added Friends<font></h1>
<%
System.out.println("friend size on home is "+friends.size());
if(friends.size() ==0)
	{
	out.print("You have no friends yet, trying adding people ");
	out.print("<a href=\"pymn.jsp\">here</a>");
	}
else{
	for(int i=friends.size()-1; i >friends.size()-6;i--){
		System.out.println("In look i is "+i);
		if(i > -1)
		{
		 out.print("<font face=\"Comic Sans MS\">"+friends.get(i).getUsername()+"</font><a href=\"profile.jsp?userParam="+friends.get(i).getUsername()+ "\">Checkout Profile</a>");
		out.print("</br>");
		}
		
	}
}
%>
<h1><font face="Comic Sans MS">Recently Received Messages</font></h1>
<%
ArrayList<Message> theMessages = loggedInUser.getReceivedMessage();
Collections.sort(theMessages);
Collections.reverse(theMessages);
if(theMessages.size() == 0){
        out.print("You have no messages");
}
else{
        for(int i=0;i<5;i++){
	if(i< theMessages.size()){
                Message aMsg = theMessages.get(i);
                if(!aMsg.getText().equals("I want to be your friend!")){
                out.print("From: "+aMsg.getAuthor().getUsername()+" "+ aMsg.getTitle());
                out.print("<a href=\"viewMessage.jsp?msgDate="+aMsg.getDateSent().getTime()+"\">View Message</a>");
                out.print("</br>");
                }
                else if(aMsg.getText().equals("I want to be your friend!")){
                out.print("From: "+ aMsg.getAuthor().getUsername() +"  "+aMsg.getText());
                        out.print("<a href=\"deleteMessage.jsp?deleteMsg=" + aMsg.getDateSent().getTime() +"\">Delete<a>|");

                        out.print("<a href=\"acceptFRMessage.jsp?msgDate="+ aMsg.getDateSent().getTime() + "\">Accept</a>|");

                        out.print("<a href=\"denyFRMessage.jsp?msgDate=" + aMsg.getDateSent().getTime()+"\">Deny</a>");
                        System.out.println("Is this where the problem is");
                out.print("</br>");
        }
	}
}


}


%>
</html>
