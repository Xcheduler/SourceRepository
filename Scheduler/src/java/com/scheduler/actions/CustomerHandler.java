/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import com.scheduler.forms.CustomerForm;
import java.util.ArrayList;
import java.util.HashMap;
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
public class CustomerHandler extends DispatchAction {

    public ActionForward addCustomers(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ServletContext contexts = servlet.getServletContext();
        HttpSession session = request.getSession(false);
       // System.out.println(">>>>i m in addcustomerrrrr" + request.getParameter("custID"));
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            // HashMap customerMap = new HashMap();
            CustomerForm cusForm = new CustomerForm();
            if (request.getParameter("custID") == null) {
                String customerName = "";
                String customerEmail = "";
                String customerMobile = "";
                String userId = "";
                boolean flag = false;
                if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                    userId = session.getAttribute("UserID").toString().trim();
                }
                if (request.getParameter("cusName") != null && request.getParameter("cusName").trim().length() > 0) {
                    customerName = request.getParameter("cusName");
                }
                if (request.getParameter("cusEmail") != null && request.getParameter("cusEmail").trim().length() > 0) {
                    customerEmail = request.getParameter("cusEmail");
                }
                if (request.getParameter("cusMobile") != null && request.getParameter("cusMobile").trim().length() > 0) {
                    customerMobile = request.getParameter("cusMobile");
                }

                cusForm.setCustomerName(customerName);
                cusForm.setCustomerEmail(customerEmail);
                cusForm.setCustomerMobile(customerMobile);
                cusForm.setUserID(userId);

                System.out.println("cusName>>>>>" + request.getParameter("cusName") + ">>>>>>cusEmail>>>>" + request.getParameter("cusEmail") + ">>>>>cusPhone>>>>" + request.getParameter("cusPhone"));
                if (customerEmail.trim().length() > 0) {
                    flag = locobj.insertCustomer(cusForm);
                }
                System.out.println("====>>flag" + flag);

            //if (flag) {
                //  ajaxResponse(response, "Success");
                //forward = "success";
                //    cusForm.setCustomerID(Integer.parseInt(request.getParameter("custID")));
                ArrayList<Properties> customerList = locobj.getCustomerList(cusForm.getUserID());
                System.out.println(">>>>>>>>mapppppp>>>>>" + customerList);
                request.setAttribute("customerList", customerList);
                if (!customerList.isEmpty()) {
                    request.setAttribute("showList", true);
                }
                //return mapping.findForward(".customerList");
            } else if (request.getParameter("custID") != null) {
                int custID = Integer.parseInt(request.getParameter("custID"));
               // boolean status = locobj.getCustomerInfo(custId);
                //if(status)
                //{

                System.out.println("<>>>>>>>><><><><>>>>editttttt>>>>>" + custID);
                String customerName = cusForm.getCustomerName();
                String customerEmail = cusForm.getcustomerEmail();
                String customerMobile = cusForm.getcustomerMobile();
                request.setAttribute("custName", customerName);
                request.setAttribute("custEmail", customerEmail);
                request.setAttribute("custMobile", customerMobile);
                request.setAttribute("custID", custID);
                request.setAttribute("editForm", true);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward getCustomers(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            CustomerForm cusForm = new CustomerForm();
            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String user_id = session.getAttribute("UserID").toString();
                System.out.println("====uSER id>>>>"+user_id);
                ArrayList<Properties> customerList = locobj.getCustomerList(user_id);
                System.out.println(">>>>>>>>mapppppp>>>>>" + customerList);
                request.setAttribute("customerList", customerList);
                if (!customerList.isEmpty()) {
                    request.setAttribute("showList", true);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward getCustomerInfo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int custId = 0;
        if (request.getParameter("custId") != null) {
            custId = Integer.parseInt(request.getParameter("custId"));
        }
        System.out.println(">>>>>>>>customerinfooooooo>>>>>" + custId);

        if (custId > 0) {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            boolean status = locobj.getCustomerInfo(custId);
            if (status) {
                CustomerForm cusForm = new CustomerForm();
                int custIDfromDB = cusForm.getCustomerID();
                if (custIDfromDB == custId) {

                    String customerName = cusForm.getCustomerName();
                    String customerEmail = cusForm.getcustomerEmail();
                    String customerMobile = cusForm.getcustomerMobile();
                    request.setAttribute("custName", customerName);
                    request.setAttribute("custEmail", customerEmail);
                    request.setAttribute("custMobile", customerMobile);
                    request.setAttribute("custID", custId);

                }
            }
        }
        return mapping.findForward("Success");

    }

    /*public ActionForward execute(ActionMapping mapping, ActionForm form,
     HttpServletRequest request, HttpServletResponse response)
     throws Exception {
     ServletContext contexts = servlet.getServletContext();
     HttpSession session = request.getSession();
     System.out.println(">>>>i m in execute");
     try {
            
     } catch (Exception e) {
     e.printStackTrace();
     }
     return mapping.findForward("Success");
     }*/
    public ActionForward updateCustomerInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("uuuuuuuuuu>>>>>>>");
        int custId = 0;
        String customerName = "";
        String customerEmail = "";
        String customerMobile = "";
        boolean status = false;
        String action = "update";

        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            CustomerForm cusForm = new CustomerForm();
            if (request.getParameter("cusId") != null) {
                custId = Integer.parseInt(request.getParameter("cusId"));
            }
            System.out.println(">>>>>>>>customeriniupdteeeee>>>>>>>" + custId + ">>>actionnnnnnn>>>>>" + request.getParameter("action"));
            if (request.getParameter("action") != null) {
                action = request.getParameter("action").toString();
            }
            if (custId > 0 && action.equals("update")) {
                if (request.getParameter("cusName") != null && request.getParameter("cusName").trim().length() > 0) {
                    customerName = request.getParameter("cusName");
                }
                if (request.getParameter("cusEmail") != null && request.getParameter("cusEmail").trim().length() > 0) {
                    customerEmail = request.getParameter("cusEmail");
                }
                if (request.getParameter("cusMobile") != null && request.getParameter("cusMobile").trim().length() > 0) {
                    customerMobile = request.getParameter("cusMobile");
                }

                cusForm.setCustomerName(customerName);
                cusForm.setCustomerEmail(customerEmail);
                cusForm.setCustomerMobile(customerMobile);
                status = locobj.updateCustomerInfo(custId, cusForm);

            } else if (custId > 0 && action.equals("delete")) {
                status = locobj.deleteCustomer(custId);
                System.out.println("i m in deleteeeee>>>>>>>" + status);
            }
            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
            ArrayList<Properties> customerList = locobj.getCustomerList(session.getAttribute("UserID").toString());
            System.out.println(">>>>>>>>updstcudsssssssssss>>>>>" + customerList);
            request.setAttribute("customerList", customerList);
            if (!customerList.isEmpty()) {
                request.setAttribute("showList", true);
            }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward deleteCustomer(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int custId = 0;

        boolean status = false;
        try {
            if (request.getParameter("custId") != null) {
                custId = Integer.parseInt(request.getParameter("custId"));
            }
            System.out.println(">>>>>>>>customerinfooooooo>>>>>" + custId);
            if (custId > 0) {
                SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
                status = locobj.deleteCustomer(custId);
                CustomerForm cusForm = new CustomerForm();
                ArrayList<Properties> customerList = locobj.getCustomerList(cusForm.getUserID());
                System.out.println(">>>>>>>>mapppppp>>>>>" + customerList);
                request.setAttribute("customerList", customerList);
                if (!customerList.isEmpty()) {
                    request.setAttribute("showList", true);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
}
