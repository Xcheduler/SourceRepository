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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
public class RegistrationAction extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //ServletContext contexts = servlet.getServletContext();
        //HttpSession session = request.getSession();
        SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
        String forward = "fail";
        boolean flag = false;
        PrintWriter out = response.getWriter();
        try {
            ProfileForm pForm=new ProfileForm();
            
            RegistrationVO regvo = new RegistrationVO();
                       
            String loginname = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String companyName = request.getParameter("company");
            
            System.out.println("====>>loginName" + loginname);
            System.out.println("====>>email" + email);
            System.out.println("====>>password" + password);
            System.out.println("====>>companyName" + companyName);
            regvo.setUserName(loginname);
            regvo.setPassword(password);
            regvo.setEmail(email);
            regvo.setCompanyName(companyName);
            String user_id = locobj.insertUserDetails(regvo);
            System.out.println("====>>user_id===>>" + user_id);
            
            
            //
            
            Date currentDate = new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.DATE, 30); 
            Date currentDatePlusOne = c.getTime();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String newDate=sdf.format(currentDatePlusOne);
        //
            if (user_id!=null) {
                //  ajaxResponse(response, "Success");
                HttpSession session = request.getSession(true);
                session.setAttribute("systemid", session.getId());
                request.setAttribute("fromLogin", "true");
                session.setAttribute("Email", email);         
                session.setAttribute("User", loginname);
                session.setAttribute("UserID", user_id);
                session.setAttribute("ExpiryDate", newDate);
                pForm.setCompanyName(companyName);
                pForm.setEmail(email);
                session.setAttribute("ProfileForm", pForm);
                forward = "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward(forward);
    }

}
