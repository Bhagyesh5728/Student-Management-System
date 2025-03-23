<%@page import="java.sql.*" %>
<%

String cource=request.getParameter("cource");



Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
PreparedStatement p=c.prepareStatement("select * from work where subject_name='"+cource+"' ");
ResultSet r=p.executeQuery();


%>
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>

<th>Subject_Name</th>
<th>Work_Detail</th>
<th>Submit_Date</th>
<th>Cource</th>
<th>Sem</th>
<th>Class</th>

<th>Action</th>
</tr>
</thead>
<%while(r.next())
{
 %>
<tbody>
<tr>

<td>
<h2>
<a><%=r.getString("subject_name") %></a>
</h2>
</td>
<td><%=r.getString("work_detail") %></td>
<td><%=r.getDate("submit_date") %></td>
<td><%=r.getString("cource") %></td>
<td><%=r.getString("sem") %></td>
<td><%=r.getString("class") %></td>

<td align="center"><a href="deletework?id=<%=r.getInt("id")%>&name=client" ><i class="fa fa-trash"></i></a></td>
</tr>
<%} %>
</tbody>
</table>



