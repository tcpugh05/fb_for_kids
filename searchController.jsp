<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="f4k.*" %>
<html>
<body>

<%
if((User) session.getAttribute("loggedInUser")==null)
        {
                response.sendRedirect("login.jsp");
        }
User loginUser = (User) session.getAttribute("loggedInUser"); 
ArrayList<String> searches;
searches = Repository.instance().getAllUsernames();

ArrayList<String> results = new ArrayList<String>();

String searchee = request.getParameter("searchee");
searchee.trim();

if(searchee.equals(" ")==false){
loginUser.saveSearch(searchee);
}
session.setAttribute("searchedWord",searchee);
char[] containee = searchee.toCharArray();

for(int i = 0;i<searches.size();i++){
	if(searchee.equals(searches.get(i))){
		User creepee = Repository.instance().getUser(searches.get(i));
		System.out.println("loginUser's username is "+loginUser.getUsername());
		
		System.out.println("creepee's username is "+creepee.getUsername());
		creepee.setCreeper(loginUser.getUsername());
		}
	}

for(int i = 0; i<searches.size(); i++){
	for(int j = 0; j< containee.length;j++){
		if(results.contains(searches.get(i)) == false && searches.get(i).lastIndexOf(containee[j]) >= 0 ){
			results.add(searches.get(i));
			}
		}
	}

ArrayList<String> resultsToDisplay = new ArrayList<String>();

int max =  0;
int eager=0;
int index = 0;

while(results.size() > 0){
	String word = "";
	for(int i=0; i<results.size();i++){
		int v = Repository.instance().matches(searchee,results.get(i));
		
			if(v >= max){
			max = v;
			 word = results.get(i);
				}
			}


	word.trim();
	if(resultsToDisplay.contains(word) == false){
		resultsToDisplay.add(index,word);
		index++;
		results.remove(word);
		max=0;
			}
		eager++;
		}
	session.setAttribute("resultsToDisplay",resultsToDisplay);

/*************************************************************************************************
	CLUBS
**************************************************************************************************/
	
ArrayList<String> clubsearches;
clubsearches = Repository.instance().getAllClubnames();

ArrayList<String> clubresults = new ArrayList<String>();

 containee = searchee.toCharArray();

for(int i = 0; i<clubsearches.size(); i++){
	for(int j = 0; j< containee.length;j++){
		if(clubresults.contains(clubsearches.get(i)) == false && clubsearches.get(i).lastIndexOf(containee[j]) >= 0 ){
			clubresults.add(clubsearches.get(i));
			}
		}
	}

ArrayList<String> clubresultsToDisplay = new ArrayList<String>();

 max =  0;
eager=0;
index = 0;

while(clubresults.size() > 0){
	String word = "";
	for(int i=0; i<clubresults.size();i++){
		int v = Repository.instance().matches(searchee,clubresults.get(i));
		
			if(v >= max){
			max = v;
			 word = clubresults.get(i);
				}
			}


	word.trim();
 	if(clubresultsToDisplay.contains(word) == false){
		clubresultsToDisplay.add(index,word);
		index++;
		clubresults.remove(word);
		max=0;
			}
		eager++;
		}
	session.setAttribute("clubresultsToDisplay",clubresultsToDisplay);
response.sendRedirect("searchResults.jsp");
	
%>
</body>
</html>

