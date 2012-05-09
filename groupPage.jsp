<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Club"%>
<%@ include file="menu.jsp"%>
<html>
<body bgcolor="ADD8E6">

<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
Repository meUser = Repository.instance();
User loginUser = (User)session.getAttribute("loggedInUser");
String hello = (String)session.getAttribute("hello");
System.out.println("loggedInUser is " + loginUser.getUsername());
Club theClub = meUser.getClub(request.getParameter("nameParam"));
String param = request.getParameter("nameParam");
session.setAttribute("clubName", theClub.getClubName());
session.setAttribute("groupVisited",theClub);
System.out.println("new page here");
out.print("<H1><font face=\"Comic Sans MS\">"+ theClub.getClubName()+"</font></H1>");
System.out.println("i got here? and club name is " + theClub.getClubName());
out.print("</br>"+theClub.getDescription()+"</br>");
ArrayList<User> members = new ArrayList();
boolean inTheClub =false;
members = theClub.getListofMembers();
for(int i = 0; i<members.size(); i++){
	System.out.println("the list of members " +members.get(i));
	if(loginUser==members.get(i)){
		//theClub.addMember(loginUser.getUsername())
		inTheClub = true;		

	}
}
if(inTheClub == false){

	out.print("<form action=\"groupJoinCon.jsp?nameParam=" +param+"\" method=\"GET\">");
	out.print("<input type=submit name=submit value=\"Join this Club!\">");
	out.print("</form>");
}


System.out.println("adminname is " + theClub.getAdministratorName());
System.out.println("lognames is " + loginUser.getUsername());
if(loginUser.getUsername().equals(theClub.getAdministratorName())) 
{	out.print("<form action=\"groupEdit.jsp\" method=\"GET\">");
        out.print("<input type=submit name=submit value=\"edit\">");
        out.print("</form>");
}
out.println("This club has "+ members.size()+" members!");
out.println("<h2><b> Members of this club </b></h2>");
for(int i =0;i<members.size();i++){
	out.println(members.get(i).getUsername() + "<br>");
	}

out.print("<h3><b>WALL </b></h3>");
System.out.println("i got here so problem cant be on this page");
%>
<%@include file="groupWall.jsp"%>
