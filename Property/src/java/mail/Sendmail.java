package mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Sendmail 
{
    public void sndmail(String mail, String sub, String msg) 
    {

        String to=mail; 
	try {
		  //Get the session object  
		  Properties props = new Properties();  
		  props.put("mail.smtp.host", "smtp.gmail.com");  
		  props.put("mail.smtp.socketFactory.port", "465");  
		  props.put("mail.smtp.socketFactory.class",  
		            "javax.net.ssl.SSLSocketFactory");  
		  props.put("mail.smtp.auth", "true");  
		  props.put("mail.smtp.port", "465");  
		  //Session.getDefaultInstance >>> Session.getInstance 
		  Session session = Session.getInstance(props,  
		   new javax.mail.Authenticator() {  
                   @Override
		   protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication(configuration.Mailconfig.email,configuration.Mailconfig.password);  
		   }  
		  });  
		   
		  //compose message  
		    
		   MimeMessage message = new MimeMessage(session);  
		   message.setFrom(new InternetAddress(configuration.Mailconfig.email));  
		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
		   message.setSubject(sub);  
		   message.setText(msg);  
		     
		   //send message  
		  Transport.send(message);  
		
		  System.out.println("message sent successfully");
		   
		  } catch (MessagingException e) {throw new RuntimeException(e);}
                  
    }

}
