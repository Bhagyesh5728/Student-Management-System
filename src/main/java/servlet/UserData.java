package servlet;


import java.sql.*;
import java.util.*;


public class UserData {
	
	String name;
	String mobile;
	public void getBm(String name, String mobile) {
//	super();
		this.name = name;
		this.mobile = mobile;
		System.out.print(name);
		
	}


 
	public static void main(String[] args) {
		// TODO Auto-g(enerated method stub
		
		{

			UserData bm =null;
			ArrayList<UserData> au = new ArrayList<UserData>();
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/SSSDIIT","root","");
				PreparedStatement pd1=c.prepareStatement("select * from member");
				ResultSet rs1=pd1.executeQuery();
			    while(rs1.next())
			    {
			    	bm = new UserData();
			    	bm.getBm(rs1.getString("name"),rs1.getString("mobile"));
			    	au.add(bm);
					
			    }

			}catch(Exception e)
			{
				System.out.print(e);
			}
			for(UserData e : au)
			{
				System.out.print(e.name);
			
				System.out.print(e.mobile);
				System.out.println();
			}
		
	
		}
		}
		
	}


