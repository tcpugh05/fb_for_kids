<%@ page import="f4k.User"%>
<%@ page import="f4k.Repository"%>
<%@ page import="f4k.Club"%>
<%
Repository meUser = Repository.instance();
User loginUser = (User)session.getAttribute("loggedInUser");
System.out.println(" join groups loginUser " +loginUser);
System.out.println(" join groups clubName " +session.getAttribute("clubName"));
Club theClub = meUser.getClub(session.getAttribute("clubName").toString());
System.out.println(" join groups theClub " +theClub);
theClub.addMember(loginUser.getUsername());
System.out.println(theClub.getListofMembers());
 response.sendRedirect("groupPage.jsp?nameParam=" +theClub.getClubName());
%>

