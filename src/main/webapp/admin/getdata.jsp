<%@ page import="java.sql.*" %>
<%
	String cource=request.getParameter("cource");
	String sem=request.getParameter("sem");
	String classs=request.getParameter("class");
	if(cource!=null && sem!=null && classs!=null)
	{
		if(cource.equals("BCA") && sem.equals("1") && classs.equals("A") )
		{
		%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
		<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	</h2>
	</td>
		<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present"  onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		if(cource.equals("BSCIT") && sem.equals("1") && classs.equals("C") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo, name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
	<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
		<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		
		if(cource.equals("BCA") && sem.equals("1") && classs.equals("B") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th>Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
	<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		
		if(cource.equals("BCA") && sem.equals("1") && classs.equals("C") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th>Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
	<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td></td>
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		if(cource.equals("BCA") && sem.equals("2") && classs.equals("A") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
		<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td></td>
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		if(cource.equals("BCA") && sem.equals("2") && classs.equals("B") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th>Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
	<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		

		if(cource.equals("BCA") && sem.equals("2") && classs.equals("C") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
		<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
		<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		
		if(cource.equals("BSCIT") && sem.equals("1") && classs.equals("A") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo,name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
		<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td></td>
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		
		if(cource.equals("BSCIT") && sem.equals("1") && classs.equals("B") )
		{
			%>
<div class="table-responsive">
<table class="table border-0 star-student table-hover table-center mb-0 datatable table-striped">
<thead class="student-thread">
<tr>
<th>Name</th>
<th>RollNo</th>
<th >Action</th>
</tr>
</thead>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sssdiit","root","");
	PreparedStatement pd=c.prepareStatement("select photo, name , rollno from member where cource='"+cource+"' and sem='"+sem+"' and class='"+classs+"' order by rollno");
	ResultSet rs=pd.executeQuery();
	
	while(rs.next()){
	%>
	<tbody>
			<td>
		<h2 class="table-avatar">
	<a  class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="../images/<%=rs.getString("photo") %>" alt="User Image"></a>
	<a ><%=rs.getString("name") %></a>
	
	</h2>
	</td>
	<td><button  class="rollno"   value="<%=rs.getString("rollno")%>"><%=rs.getString("rollno")%></button></td>
		<td><button class="present" onclick="fill(this.value)" value="<%=rs.getString("rollno")%>">Present</button>&nbsp;&nbsp;
		<button class="absent" onclick="fill2(this.value)" value="<%=rs.getString("rollno")%>">Absent</button></td>
		
		</tbody>
		<% 
		}
		%>
		
		</table>
		<% 
		}
		

	
	
	}
	
%>
