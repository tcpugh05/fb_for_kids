<%@ page import="f4k.Profile"%>
<%@ page import="f4k.User"%>
<%@ page import="f4k.Repository"%>

<% 
String theURL = request.getParameter("userParam");
User loggedInUser=(User)session.getAttribute("loggedInUser");
Repository meUser = Repository.instance();
User thePage = meUser.getUser(theURL);
Profile userProfile = loggedInUser.getProfile();
String picture = request.getParameter("picture");
if(thePage == null){
	if(theURL == null){
		thePage =(User)session.getAttribute("userVisited");
        }
        else if(theURL.equals("self")){
                thePage = loggedInUser;
        }
}
if(picture.equals("dino")){
	userProfile.setProfilePicture("dino.png");
}	
if(picture.equals("dolphin")){
	userProfile.setProfilePicture("dolphin.jpg");
}
if(picture.equals("flowers")){
	userProfile.setProfilePicture("flowers.gif");
}
if(picture.equals("monkey")){
	userProfile.setProfilePicture("monkey.jpg");
}
if(picture.equals("ninja")){
	userProfile.setProfilePicture("ninja monkey.gif");
}
if(picture.equals("panda")){
	userProfile.setProfilePicture("panda.png");
}
if(picture.equals("penguin")){
	userProfile.setProfilePicture("penguin.png");
}
if(picture.equals("rainbow")){
	userProfile.setProfilePicture("rainbow.gif");
}
if(picture.equals("tiger")){
	userProfile.setProfilePicture("tiger.jpg");
}
//else{
//	userProfile.setProfilePicture("f4kprofile.png");
//}
System.out.println("The controller says picture is " +picture);
response.sendRedirect("profile.jsp");
%>
