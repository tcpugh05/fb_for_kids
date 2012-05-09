<%@ page import="f4k.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<html>
<body>
<%
String prefName = request.getParameter("firstname");
String username = request.getParameter("user1");

String password1= request.getParameter("password1");
String password2= request.getParameter("password2");
boolean isSafe = Censor.isSafe(username);
if(isSafe == false)
{
%>	
	<jsp:forwardpage="registerCuss.jsp"/>
<%
}


if(password1.equals(password2) == false){ %>
	<jsp:forward page="registerWrongPassword.jsp" /> 
<%
	out.println("Your passwords don't match");
	}
else{
	if(password1.length() < 5){ %>
	<jsp:forward page="registerBadPassword.jsp" />
<%
	}
	else{
	if(Repository.instance().getUser(username) != null){ %> 
		<jsp:forward page ="registerUserAlreadyExists.jsp" />
<%
	}
	else{
	User loggedInUser = Repository.instance().createNewUser(username,password1,new Date());
	
	session.setAttribute("loggedInUser",loggedInUser);
	String hello="hello";
	session.setAttribute("hello",hello);
	//ArrayList<String> pastSearches = new ArrayList<String>();
	//session.setAttribute("pastsearches",pastSearches);

}


response.sendRedirect("home.jsp");
}
}
%>
</body>
</html>

