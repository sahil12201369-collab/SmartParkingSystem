<%@ page import="java.util.*, org.bson.Document" %>
<h2>Parking Lots</h2>

<table border="1">
<tr><th>Name</th><th>Slots</th><th>Price</th></tr>

<%
List<Document> list = (List<Document>) request.getAttribute("parking");
for(Document p : list){
%>
<tr>
<td><%= p.getString("name") %></td>
<td><%= p.getInteger("availableSlots") %></td>
<td><%= p.getDouble("pricePerHour") %></td>
</tr>
<% } %>
</table>