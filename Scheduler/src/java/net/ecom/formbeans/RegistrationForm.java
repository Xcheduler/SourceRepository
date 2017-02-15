/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.formbeans;

/**
 *
 * @author peria
 */
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class RegistrationForm extends org.apache.struts.action.ActionForm {
     private String userName;
      private String email;
    private String password;
    private String confirmpassword;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }
   
    
//      public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
//           return errors;
//      }
  /* @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
      
       if(userName==null ||userName.trim().equals(""))
           errors.add("userName", new ActionMessage("User Name is Required"));
       //errors.
       if(email==null ||email.trim().equals(""))
           errors.add("email", new ActionMessage("email is Required"));
       if(password==null ||password.trim().equals(""))
           errors.add("password", new ActionMessage("password is Required"));
       if(confirmpassword==null ||confirmpassword.trim().equals(""))
           errors.add("confirmpassword", new ActionMessage("confirmpassword is Required"));

        return errors;
    }*/
    
    

    
}
