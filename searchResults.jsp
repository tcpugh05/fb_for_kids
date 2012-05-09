<%@ page import="java.util.ArrayList" %>
<%@ page import="f4k.Repository"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Club"%>
<%@ include file="menu.jsp"%>
<%@ page import="f4k.Censor"%>
<html>
<body>
<body bgcolor="ADD8E6">

<%
out.println("<a href=\"pastSearches.jsp\">View Past Searches </a> <br>");
Repository repo= Repository.instance();
User loginUser = (User)session.getAttribute("loggedInUser");
ArrayList<String> resultsToDisplay = (ArrayList<String>) session.getAttribute("resultsToDisplay");
ArrayList<String> clubresultsToDisplay = (ArrayList<String>) session.getAttribute("clubresultsToDisplay"); 
String word = (String) session.getAttribute("searchedWord");
out.println("You searched for <b> "+word+" </b>  <br><br>");
boolean isSafe = Censor.isSafe(word);
if(isSafe == false)
{
        response.sendRedirect("dontCuss.jsp");
}
out.println("<h1> Username Match(es) </h1><br>");
if(resultsToDisplay.contains(word) == false && resultsToDisplay.size() > 0){
	out.println("There is no user with the name entered. Here are some similar names though: <br><br><br>");
}

for(int i = 0; i<resultsToDisplay.size();i++){
	User aUser =repo.getUser(resultsToDisplay.get(i));
	if(resultsToDisplay.get(i).equals(word)){
	out.print("<b> "+ resultsToDisplay.get(i) + "</b>");
	}
	else{
	out.print(resultsToDisplay.get(i));
	}
	if(aUser.isFriend(loginUser)){
	out.print("<a href=\"profile.jsp?userParam="+resultsToDisplay.get(i)+ "\">Checkout Profile</a> <br>");
	}

	else{
	out.print("<a href=\"sendFriendRequest.jsp?friend=" + resultsToDisplay.get(i) + "\">   Send Friend Request</a><br>");
	}
}
//	out.print("<a href=\"profile.jsp?userParam="+resultsToDisplay.get(i) + "\">" + resultsToDisplay.get(i) + "</a>");

	
out.println("<h2> Club Match(es) </h2>");

if(clubresultsToDisplay.contains(word) == false && clubresultsToDisplay.size()>0){
	out.println("There is no club with the name entered. Here are some similar names though: <br><br><br>");
	}

for(int i =0;i<clubresultsToDisplay.size();i++){
	Club aClub = repo.getClub(clubresultsToDisplay.get(i));
	if(clubresultsToDisplay.get(i).equals(word)){
        out.print("<b>"+ aClub.getClubName() + "</b>");
	out.print("<a href=\"groupPage.jsp?nameParam="+aClub.getClubName()+"\">Visit </a>");
        out.print("</br>");
	//out.println("<b> "+ clubresultsToDisplay.get(i)+" </b>");
	}
	else{
	
        out.print(aClub.getClubName());
	out.print("<a href=\"groupPage.jsp?nameParam="+aClub.getClubName()+"\">Visit </a>");
        out.print("</br>");
}	

}
if( clubresultsToDisplay.size()==0 && resultsToDisplay.size() == 0){
	out.println("You searched for <b>" + word + "</b> . There are no matches for this search!  <br>" );
	}



%>


</body>
</html>
