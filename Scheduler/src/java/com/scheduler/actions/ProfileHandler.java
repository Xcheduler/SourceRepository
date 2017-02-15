/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import com.scheduler.forms.CustomerForm;
import com.scheduler.forms.ProfileForm;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.ecom.lookup.EJBLookUp;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author chidambara-0615
 */
public class ProfileHandler extends DispatchAction {

    /*public ActionForward execute(ActionMapping mapping, ActionForm form,
     HttpServletRequest request, HttpServletResponse response)
     throws Exception {
     ServletContext contexts = servlet.getServletContext();
     HttpSession session = request.getSession();
       
     try {
            
     } catch (Exception e) {
     e.printStackTrace();
     }
     return mapping.findForward("Success");
     }*/
    public ActionForward getProfile(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
       // ServletContext contexts = servlet.getServletContext();
        // HttpSession session = request.getSession();

        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();

            String company = request.getParameter("company");
            System.out.println("===get Profile-->>>>>>>" + company);
            
             HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String user_id = session.getAttribute("UserID").toString();
                System.out.println("===get Profile-user_id->>>>>>>" + user_id);
                List<ProfileForm> profileList = locobj.getProfileList(user_id);
                System.out.println(">>>>>>>>mapppppp>>>>>" + profileList);
                //request.setAttribute("profileList", profileList);
                session.setAttribute("profileList", profileList);

                
                /*if (!profileList.isEmpty()) {
                    request.setAttribute("showList", true);
                }*/
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward companyDetails(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
       // ServletContext contexts = servlet.getServletContext();
        // HttpSession session = request.getSession();

        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            System.out.println("======company Details Profile==>>>");
            
            HttpSession session = request.getSession(false);
            
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                List<ProfileForm> pList = new ArrayList<ProfileForm>();
                ProfileForm pForm=new ProfileForm();
                pForm.setUserId(session.getAttribute("UserID").toString().trim());
                if (request.getParameter("companyName") != null && request.getParameter("companyName").trim().length() > 0) {
                    pForm.setCompanyName(request.getParameter("companyName").trim());
                }
                if (request.getParameter("bookingURL") != null && request.getParameter("bookingURL").trim().length() > 0) {
                    pForm.setBookingURL(request.getParameter("bookingURL").trim());
                }
                if (request.getParameter("companyLogo") != null && request.getParameter("companyLogo").trim().length() > 0) {
                    pForm.setCompanyLogo(request.getParameter("companyLogo").trim());
                }
                if (request.getParameter("email") != null && request.getParameter("email").trim().length() > 0) {
                    pForm.setEmail(request.getParameter("email").trim());
                }
                if (request.getParameter("phone") != null && request.getParameter("phone").trim().length() > 0) {
                    pForm.setPhone(request.getParameter("phone").trim());
                }
                if (request.getParameter("website") != null && request.getParameter("website").trim().length() > 0) {
                    pForm.setWebsite(request.getParameter("website").trim());
                }
                if (request.getParameter("currency") != null && request.getParameter("currency").trim().length() > 0) {
                    pForm.setCurrency(request.getParameter("currency").trim());
                }
                if (request.getParameter("address") != null && request.getParameter("address").trim().length() > 0) {
                    pForm.setAddress(request.getParameter("address").trim());
                }
                if (request.getParameter("city") != null && request.getParameter("city").trim().length() > 0) {
                    pForm.setCity(request.getParameter("city").trim());
                }
                if (request.getParameter("state") != null && request.getParameter("state").trim().length() > 0) {
                    pForm.setState(request.getParameter("state").trim());
                }
                if (request.getParameter("zip") != null && request.getParameter("zip").trim().length() > 0) {
                    pForm.setZip(request.getParameter("zip").trim());
                }
                if (request.getParameter("aboutYou") != null && request.getParameter("aboutYou").trim().length() > 0) {
                    pForm.setAboutYou(request.getParameter("aboutYou").trim());
                }
                if (request.getParameter("facebook") != null && request.getParameter("facebook").trim().length() > 0) {
                    pForm.setFacebook(request.getParameter("facebook").trim());
                }
                if (request.getParameter("twiter") != null && request.getParameter("twiter").trim().length() > 0) {
                    pForm.setTwitter(request.getParameter("twiter").trim());
                }
                pList.add(pForm);
                boolean flag=locobj.updateProfile(pList);
                System.out.println("====Update profile===="+flag);
                System.out.println("======Profile ID==>>>"+session.getAttribute("UserID").toString());
                List<ProfileForm> profileList =locobj.getProfileList(session.getAttribute("UserID").toString().trim());               
                session.setAttribute("profileList", profileList);
                System.out.println("====After Update profile===="+profileList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

}
