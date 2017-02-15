/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.action;

import com.scheduler.vo.LoginVO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.ecom.formbeans.LoginForm;
import net.ecom.lookup.EJBLookUp;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author sasikumar.r
 */
public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
        String forward = "success";
        boolean flag = false;
        try {
            HttpSession session = request.getSession(true);
            String loginName = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.println("====>>loginName" + loginName);
            System.out.println("====>>password" + password);
            List<LoginVO> loginList = (ArrayList<LoginVO>)locobj.getUserDetails(loginName, password);
            if(loginList!=null && loginList.size()>0){
                LoginVO loginVO=loginList.get(0);
                if(loginVO.getIsPricing().equalsIgnoreCase("Y")){
                    request.setAttribute("fromLogin", "true");
                }else{
                request.setAttribute("fromLogin", "false");
                }
                session.setAttribute("systemid", session.getId());
                session.setAttribute("Email", loginVO.getEmail());         
                session.setAttribute("User", loginVO.getUserName());
                session.setAttribute("UserID", loginVO.getUserID());
                session.setAttribute("ExpiryDate", loginVO.getExpiryDate());
            }else{
                forward = "fail";
                request.setAttribute("fromLogin", "Invalid Username/Password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //forward = "success";
        return mapping.findForward(forward);
    }
}
