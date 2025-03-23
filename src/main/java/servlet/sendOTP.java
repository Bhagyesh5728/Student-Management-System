//package servlet;
//
//import java.io.IOException;
//import java.util.Properties;  
//import javax.mail.*;  
//import javax.mail.internet.*; 
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//@WebServlet("/sendOTP")
//public class sendOTP extends HttpServlet {
//	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		String host="smtp.gmail.com";  
//		  final String user="bhagyeshmorvadiya213";//change accordingly  
//		  final String password="pqwa xsyo iyxs neyd";//change accordingly  
//		    
//		  String to="rs7555779@gmail.com";//change accordingly  
//		  
//		   //Get the session object  
//		   Properties props = new Properties();  
//		   props.put("mail.smtp.host", "smtp.gmail.com");
//			  props.put("mail.smtp.port", "587");
//			  props.put("mail.smtp.auth", "true");
//			  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//			  props.put("mail.smtp.starttls.enable", "true");
//			  props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//		   
//		     
//		   Session session = Session.getDefaultInstance(props,  
//		    new javax.mail.Authenticator() {  
//		      protected PasswordAuthentication getPasswordAuthentication() {  
//		    return new PasswordAuthentication(user,password);  
//		      }  
//		    });  
//		  
//		   //Compose the message  
//		    try {  
//		     MimeMessage message = new MimeMessage(session);  
//		     message.setFrom(new InternetAddress(user));  
//		     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
//		     message.setSubject("javatpoint");  
//		     message.setText("This is simple program of sending email using JavaMail API");  
//		       
//		    //send the message  
//		     Transport.send(message);  
//		  
//		     System.out.println("message sent successfully...");  
//		   
//		     } catch (MessagingException e) {e.printStackTrace();}  
//	
//		
//	}
//
//}
