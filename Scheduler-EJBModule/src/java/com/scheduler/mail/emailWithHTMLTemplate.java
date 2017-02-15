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
/* 
* Author : Java2db.com
*/

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class emailWithHTMLTemplate {

//public static void main(String[] args)
//{
 //   new emailWithHTMLTemplate().sendMailInJava();   
//}
// Method to send an Email   
public String sendMailInJava(List<String> mailList,String subject,String body)
{
     String retVal="fail";
 try {
           
           //Email data 
           String Email_Id = "schedularsample@gmail.com";        //change to your email ID
           String password = "Tamil123$";                 //change to your password
          // String recipient_mail_id = "govindh.mku@gmail.com";   //change to recipient email id
           String mail_subject = "This is a test mail From Java";
            
            
           //Set mail properties
            Properties props = System.getProperties();
            String host_name = "smtp.gmail.com";
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host_name);
            props.put("mail.smtp.user", Email_Id);
            props.put("mail.smtp.password", "Tamil123$");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

             String mail="";
             if(mailList!=null && mailList.size()>0){
			  InternetAddress[] recipientAddress = new InternetAddress[mailList.size()];
			  int counter = 0;
                            for (String recipient1 : mailList) {
                                recipientAddress[counter] = new InternetAddress(recipient1.trim());
                               mail=recipient1.trim();
                                counter++;
                            }
            message.setFrom(new InternetAddress(Email_Id));
            message.setRecipients(Message.RecipientType.TO, recipientAddress);
            message.setSubject(subject);
            MimeMultipart multipart = new MimeMultipart();
            BodyPart messageBodyPart = new MimeBodyPart();
            
            //Set key values
            Map<String, String> input = new HashMap<String, String>();
               input.put("#tmpid#", mail.trim());
              // input.put("Topic", "HTML Template for Email");
              // input.put("Content In", "English");
             
            //HTML mail content
            String path=System.getProperty("jboss.server.base.dir");
            System.out.println(path+"/emailtemplate/emailTemplate.html");
            String newPath=path+"/emailtemplate/emailTemplate.html";
            String htmlText = readEmailFromHtml(newPath,input);
            messageBodyPart.setContent(htmlText, "text/html");
            
            multipart.addBodyPart(messageBodyPart); 
            message.setContent(multipart);

            //Conect to smtp server and send Email
            Transport transport = session.getTransport("smtp");            
            transport.connect(host_name, Email_Id, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("Mail sent successfully...");
            retVal="sent";
             }
         
        
        } catch (Exception ae) {
            ae.printStackTrace();
        } 
 return retVal;
}
//Method to replace the values for keys
protected String readEmailFromHtml(String filePath, Map<String, String> input)
{
    String msg = readContentFromFile(filePath);
    try
    {
    Set<Entry<String, String>> entries = input.entrySet();
    for(Map.Entry<String, String> entry : entries) {
        msg = msg.replace(entry.getKey().trim(), entry.getValue().trim());
    }
    }
    catch(Exception exception)
    {
        exception.printStackTrace();
    }
    return msg;
}
//Method to read HTML file as a String 
private String readContentFromFile(String fileName)
{
    StringBuffer contents = new StringBuffer();
    
    try {
      //use buffering, reading one line at a time
      BufferedReader reader =  new BufferedReader(new FileReader(fileName));
      try {
        String line = null; 
        while (( line = reader.readLine()) != null){
          contents.append(line);
          contents.append(System.getProperty("line.separator"));
        }
      }
      finally {
          reader.close();
      }
    }
    catch (IOException ex){
      ex.printStackTrace();
    }
    return contents.toString();
}
}

