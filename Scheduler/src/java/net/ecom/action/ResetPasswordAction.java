/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.action;

//import com.google.gson.Gson;
import com.scheduler.vo.RegistrationVO;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.scheduler.forms.ProfileForm;
import net.ecom.formbeans.RegistrationForm;
import net.ecom.lookup.EJBLookUp;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author peria
 */
public class ResetPasswordAction extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //ServletContext contexts = servlet.getServletContext();
        //HttpSession session = request.getSession();
        //System.out.println("Coming to forgot password section--->");
        SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
        String forward = "fail";
        boolean flag = false;
        PrintWriter out = response.getWriter();
        try {
            //ProfileForm pForm=new ProfileForm();
            
           // RegistrationVO regvo = new RegistrationVO();
                       
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("confirm-password");
            System.out.println("====>>email" + email);
             System.out.println("====>>password" + password);
              System.out.println("====>>cpassword" + cpassword);
            
         if(password!=null && password.length()>0){
           String user_id = locobj.resetPassword(email,password);
           forward = "success";
         }
            
            
                
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward(forward);
    }

}
