<%@ page import="java.util.*, org.bson.Document" %>
<h2>All Users</h2>

<table border="1">
<tr><th>Name</th><th>Email</th><th>Role</th></tr>

<%
List<Document> users = (List<Document>) request.getAttribute("users");
for(Document u : users){
%>
<tr>
<td><%= u.getString("name") %></td>
<td><%= u.getString("email") %></td>
<td><%= u.getString("role") %></td>
</tr>
<% } %>
</table>