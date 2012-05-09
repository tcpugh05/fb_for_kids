<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Profile"%>
<%@ page import="f4k.Club"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<%@ include file="menu.jsp"%>
<html>
<BODY BGCOLOR="#ADD8E6">

<img src="groupPage.jpg" height=400 width=350 align=right />
<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
Repository meUser = Repository.instance();
HashMap<String,Club> theClubs = meUser.getAllClubs();
ArrayList<Club> inTheClub = new ArrayList();
ArrayList<Club> notInTheClub = new ArrayList();
Collection<Club> c = theClubs.values();
Iterator<Club> i = c.iterator();
User loginUser =(User) session.getAttribute("loggedInUser");

while(i.hasNext()){
	Club theClub = i.next();
	ArrayList<User> clubMembers = new ArrayList();
	clubMembers = theClub.getListofMembers();
	int memberCounter = 0;	
	for(int j = 0; j<clubMembers.size(); j++){
		if(loginUser==clubMembers.get(j)){
			inTheClub.add(theClub);	
			memberCounter++;		
		}
	}
	if(memberCounter == 0){
		notInTheClub.add(theClub);
	}
}

out.print("</br><a href=\"groupCreate.jsp\"><b><font size=3>Add a new club</font></b></a>");
out.print("</br><H1><font face=\"Comic Sans MS\">Clubs You Have Joined</font></H1>");

for(int k = 0; k<inTheClub.size();k++){		
//while(in.hasNext())
//{
//        Club theClub = in.next();
 	Club theClub = inTheClub.get(k);
        out.print("<font size=\"5\">");
        out.print(theClub.getClubName()+ "</font>");
	out.print("<a href=\"groupPage.jsp?nameParam="+theClub.getClubName()+"\">Visit </a>");
        out.print("</br>");
//}
}
out.print("</BR>");
out.print("<H1><font face=\"Comic Sans MS\">Clubs You Have Not Joined</font></H1>");

for(int p = 0;p<notInTheClub.size();p++){
//while(notIn.hasNext())
//{
//        Club theClub = notIn.next();
	Club theClub = notInTheClub.get(p);
        out.print("<font size=\"5\">");
        out.print(theClub.getClubName()+ "</font>");
	out.print("<a href=\"groupPage.jsp?nameParam="+theClub.getClubName()+"\">Visit </a>");
        out.print("</br>");
//}
}
%>

</body>
</html>
