package common;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
//import javax.net.ssl.SSLSocketFactory;
public class SentEmail {
	String host="smtp.googlemail.com";  
    
	final String sender="mcfrbl.itcell@gmail.com";//change accordingly  
	final String password="MCFRBL@123";//change accordingly  
    final String cc_receipient="nkgupta.mmmec@gmail.com";
	  public void sentMail(String receipient, String subject, String content)
	  {
		      
			//Get the session object  
			Properties props = new Properties();  
			props.put("mail.smtp.host",host); 
			props.put("mail.smtp.starttls.enable", "587");
			//the above code is used for SSL Protocal only
		   // props.put("mail.smtp.socketFactory.port", "465");   
		  // props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		   //end of code
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.starttls.enable", "true");   //for tsl only
		   props.put("mail.smtp.port", "587");   //for ssl port is 465
		   
          try{
		   Session sessions = Session.getInstance(props,  
					new javax.mail.Authenticator() {  
				protected PasswordAuthentication getPasswordAuthentication() {  
					return new PasswordAuthentication(sender,password);  
				}  
			}); 
     
		MimeMessage message = new MimeMessage(sessions);  
		message.setFrom(new InternetAddress(sender)); 
		message.addRecipient(Message.RecipientType.TO,new InternetAddress(receipient));
		message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc_receipient)); 
		message.setSubject(subject);//Set Subjects

		message.setContent(content,"text/html");

		//send the message  
		Transport.send(message);
		System.out.println(content);
          }
          catch(Exception e)
          {
        	  e.printStackTrace();  
          }
		  
	  }
	  
	  public void sentMail(String[] receipient, String subject, String content)
	  {
		  System.out.println("Content"+content);
		      
			//Get the session object  
			Properties props = new Properties();  
			props.put("mail.smtp.host",host);  
		// props.put("mail.smtp.socketFactory.port", "465");   for ssl only
		
		 //  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");  for ssl only
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.starttls.enable", "true");   //for tsl only
		   props.put("mail.smtp.port", "587");   //465  for ssl
          try{
		   Session sessions = Session.getInstance(props,  
					new javax.mail.Authenticator() {  
				protected PasswordAuthentication getPasswordAuthentication() {  
					return new PasswordAuthentication(sender,password);  
				}  
			}); 
		   
     //String receipientAsString=String.join(", ", receipient);
    // String cc_receipientAsString=String.join(", ", cc_receipient);
		   
		MimeMessage message = new MimeMessage(sessions);  
		message.setFrom(new InternetAddress(sender)); 
		int i=0;
		InternetAddress[] receipientAddress=new InternetAddress[receipient.length];
		for(String receipientAsString:receipient)
		{
			receipientAddress[i]= new InternetAddress(receipientAsString.trim());
			i++;
		}
		message.setRecipients(Message.RecipientType.TO, receipientAddress);
		message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc_receipient)); 
		message.setSubject(subject);//Set Subjects

		message.setContent(content,"text/html");

		//send the message  
		Transport.send(message);
          }
          catch(Exception e)
          {
        	  e.printStackTrace();  
          }
		  
	  }
	  
	  //sent mail with other id
	  public void sentMail_1(String[] receipient, String subject, String content)
	  {
		  System.out.println("Content"+content);
		final String  sender="itcell.mcfrbl@gmail.com";
		final String password="cris@123";
			//Get the session object  
			Properties props = new Properties();  
			props.put("mail.smtp.host",host);
			//code for SSL protocal
		 // props.put("mail.smtp.socketFactory.port", "465");
		 //  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		   //End of SSL Code
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.starttls.enable", "true");   //for tsl only
		   props.put("mail.smtp.port", "587");    //for SSL port is 465
          try{
		   Session sessions = Session.getInstance(props,  
					new javax.mail.Authenticator() {  
				protected PasswordAuthentication getPasswordAuthentication() {  
					return new PasswordAuthentication(sender,password);  
				}  
			}); 
		   
     //String receipientAsString=String.join(", ", receipient);
    // String cc_receipientAsString=String.join(", ", cc_receipient);
		   
		MimeMessage message = new MimeMessage(sessions);  
		message.setFrom(new InternetAddress(sender)); 
		int i=0;
		InternetAddress[] receipientAddress=new InternetAddress[receipient.length];
		for(String receipientAsString:receipient)
		{
			receipientAddress[i]= new InternetAddress(receipientAsString.trim());
			i++;
		}
		message.setRecipients(Message.RecipientType.TO, receipientAddress);
		message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc_receipient)); 
		message.setSubject(subject);//Set Subjects

		message.setContent(content,"text/html");

		//send the message  
		Transport.send(message);
          }
          catch(Exception e)
          {
        	  e.printStackTrace();  
          }
		  
	  }
	  
	  
	  
	  
	  
	  
	 
}
