<%@ page import="f4k.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<body>
<%

System.out.println();
System.out.println("Starting login");
System.out.println();
String username = request.getParameter("username");
String password = request.getParameter("password");
//System.out.println("username is "+ username + "and password is " + password);
Repository.instance();
if(Repository.instance().getUser(username) == null){ 
System.out.println("loginUserDoesnot exist");
	%>
	<jsp:forward page="loginUserDoesNotExist.jsp" />
<%
	}
else{

//System.out.println("username is " + username + "and corresponding User object is " + Repository.instance().getUser(username));
	User loggedInUser = Repository.instance().getUser(username);
//	System.out.println("Was able to get User and make him logged in");
	String pass = loggedInUser.getPassword();
//	System.out.println("was able to get user's password, it is " + loggedInUser.getPassword() + "and username is " + loggedInUser.getUsername());
	if(!pass.equals(password)){
	response.sendRedirect("loginWrongPassword.jsp");

	}
System.out.println("setting attribute to loggedinuser");

	session.setAttribute("loggedInUser",loggedInUser);
//	ArrayList<String> pastSearches = loggedInUser.getSearches();
//	session.setAttribute("pastsearches",pastSearches);
}

response.sendRedirect("home.jsp");
%>

</body>
</html>
