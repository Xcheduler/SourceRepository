/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.mail;

/**
 *
 * @author peria
 */
import java.util.List;
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  

public class Mail {

	public String display()
	{
		return "Hi";
		
	}
	public String sendMail(List<String> mailList,String subject,String body)
	{
		String retVal="fail";
		try{
			Properties props = new Properties();  
			  props.put("mail.smtp.host", "smtp.gmail.com");  
			  props.put("mail.smtp.socketFactory.port", "465");  
			  props.put("mail.smtp.socketFactory.class",  
			            "javax.net.ssl.SSLSocketFactory");  
			  props.put("mail.smtp.auth", "true");  
			  props.put("mail.smtp.port", "465");  
			   
			  Session session = Session.getDefaultInstance(props,  
			   new javax.mail.Authenticator() {  
			   protected PasswordAuthentication getPasswordAuthentication() {  
			   return new PasswordAuthentication("schedularsample@gmail.com","Tamil123$");//change accordingly  
			   }  
			  });  
			  
			  //below line comment for Morethan two recipient
			 // String recipient = "yamabs@gmail.com ,priya@gmail.com ";
			 
                          if(mailList!=null && mailList.size()>0){
			  InternetAddress[] recipientAddress = new InternetAddress[mailList.size()];
			  int counter = 0;
                            for (String recipient1 : mailList) {
                                recipientAddress[counter] = new InternetAddress(recipient1.trim());
                                counter++;
                            }
                            //
                            MimeMessage message = new MimeMessage(session);  
			   message.setFrom(new InternetAddress("schedularsample@gmail.com"));//change accordingly  
			
			   //  message.addRecipient(Message.RecipientType.TO,new InternetAddress(userEmail));
			   //below line for Morethan two recipient
			   message.setRecipients(Message.RecipientType.TO, recipientAddress);
			   message.setSubject(subject);  
			   message.setText(body);  
			   //send message  
			   Transport.send(message);  
			   
			   retVal="sent";
                           System.out.println("message sent successfully");
                           //
                          }
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
				
		return retVal;
	}
}

