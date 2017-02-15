/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import com.scheduler.forms.StaffForm;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Properties;
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
public class StaffHandler extends DispatchAction {

    public ActionForward insertStaff(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // ServletContext contexts = servlet.getServletContext();
        // HttpSession session = request.getSession();
        System.out.println(">>>>i m in adddstaffff" + request.getParameter("staffID"));
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            System.out.println("locobj==================>" + locobj);
            // HashMap customerMap = new HashMap();
            StaffForm staffForm = new StaffForm();
            if (request.getParameter("staffID") == null) {
                String staffName = "";
                String staffEmail = "";
                String staffMobile = "";
                String staffRole = "";
                String staffService[]=null;
                boolean flag = false;
                String userId = "";
                HttpSession session = request.getSession(false);
                System.out.println("======>>>>>"+session.getAttribute("UserID").toString().trim());
                if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                    userId = session.getAttribute("UserID").toString().trim();
                }
                if (request.getParameter("staffName") != null && request.getParameter("staffName").trim().length() > 0) {
                    staffName = request.getParameter("staffName");
                }
                if (request.getParameter("staffEmail") != null && request.getParameter("staffEmail").trim().length() > 0) {
                    staffEmail = request.getParameter("staffEmail");
                }
                if (request.getParameter("staffMobile") != null && request.getParameter("staffMobile").trim().length() > 0) {
                    staffMobile = request.getParameter("staffMobile");
                }
                if (request.getParameter("staffRole") != null && request.getParameter("staffRole").trim().length() > 0) {
                    
                    staffRole = request.getParameter("staffRole");
                    if(staffRole.equalsIgnoreCase("0")){
                        staffRole="Admin";
                    }else{
                        staffRole="Staff";
                    }
                    System.out.println("");
                }//staffService
                List staffServiceIDList=new ArrayList();
                if (request.getParameter("staffService") != null && request.getParameter("staffService").trim().length() > 0) {
                    
                    staffService = request.getParameterValues("staffService");
                    //staffServiceIDList.add(staffService);
                    System.out.println("==staffService==>>>>>>"+staffService);
                    for(int i=0; i<staffService.length; i++){
                        System.out.println("====>>>>"+staffService[i]);
                        staffServiceIDList.add(staffService[i]);
                    }
                }
                
                staffForm.setStaffName(staffName);
                staffForm.setStaffEmail(staffEmail);
                staffForm.setStaffMobile(staffMobile);
                staffForm.setStaffRole(staffRole);
                staffForm.setUserID(userId);
                staffForm.setStaffServiceIDList(staffServiceIDList);

                System.out.println("staffffName>>>>>" + request.getParameter("staffName") + ">>>>>>staffffEmail>>>>" + request.getParameter("staffEmail") + ">>>>>stafffffPhone>>>>" + request.getParameter("staffMobile") + ">>>>>>>staffRole>>>>>>" + request.getParameter("staffMobile"));
                System.out.println("====>>flag" + flag);
                if (staffEmail.trim().length() > 0) {
                    flag = locobj.insertStaff1(staffForm);
                }
           
                Hashtable staffHash = (Hashtable) locobj.getStaffList(userId);
                System.out.println(">>>>>>>>AFTER get staff list >>>>>" + staffHash);
                if(staffHash!=null){
                    ArrayList staffList=(ArrayList)staffHash.get("staffList");  
                    Hashtable staffServiceHash=(Hashtable)staffHash.get("staffServiceHash");  
                if (!staffList.isEmpty()) {
                    request.setAttribute("staffList", staffList);
                    request.setAttribute("staffServiceHash", staffServiceHash);
                    request.setAttribute("showList", true);
                }
                }
               
            } else if (request.getParameter("staffID") != null) {
                int staffID = Integer.parseInt(request.getParameter("staffID"));
                
                System.out.println("<>>>>>>>><><><><>>>>editttttt>>>>>" + staffID);
                String staffName = staffForm.getStaffName();
                String staffEmail = staffForm.getStaffEmail();
                String staffMobile = staffForm.getStaffMobile();
                String staffRole = staffForm.getStaffRole();
                request.setAttribute("staffName", staffName);
                request.setAttribute("staffEmail", staffEmail);
                request.setAttribute("staffMobile", staffMobile);
                request.setAttribute("staffRole", staffRole);
                request.setAttribute("staffID", staffID);
                request.setAttribute("editForm", true);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward getStaffs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            StaffForm staffForm = new StaffForm();

            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String userId = session.getAttribute("UserID").toString().trim();
                /*ArrayList<Properties> staffList = locobj.getStaffList(userId);
                System.out.println(">>>>>>>>Staff List>>>>>" + staffList);
                request.setAttribute("staffList", staffList);
                if (!staffList.isEmpty()) {
                    request.setAttribute("showList", true);
                }*/
                Hashtable staffHash = (Hashtable) locobj.getStaffList(userId);
                System.out.println(">>>>>>>>AFTER get staff list >>>>>" + staffHash);
                if(staffHash!=null){
                    ArrayList staffList=(ArrayList)staffHash.get("staffList");  
                    Hashtable staffServiceHash=(Hashtable)staffHash.get("staffServiceHash");  
                if (!staffList.isEmpty()) {
                    request.setAttribute("staffList", staffList);
                    request.setAttribute("staffServiceHash", staffServiceHash);
                    request.setAttribute("showList", true);
                }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward getStaffInfo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int staffId = 0;
        if (request.getParameter("staffId") != null) {
            staffId = Integer.parseInt(request.getParameter("staffId"));
        }
        System.out.println(">>>>>>>>stafinfoooooooo>>>>>" + staffId);

        if (staffId > 0) {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            Hashtable serviceIDHash = locobj.getStaffInfo(staffId);
            if (serviceIDHash!=null) {
                String status=(String)serviceIDHash.get("Status");
                if(status.equalsIgnoreCase("true")){
                StaffForm staffForm = new StaffForm();
                int staffIDfromDB = staffForm.getStaffID();
                if (staffIDfromDB == staffId) {

                    String staffName = staffForm.getStaffName();
                    String staffEmail = staffForm.getStaffEmail();
                    String staffMobile = staffForm.getStaffMobile();
                    String staffRole = staffForm.getStaffRole();
                    request.setAttribute("staffName", staffName);
                    request.setAttribute("staffEmail", staffEmail);
                    request.setAttribute("staffMobile", staffMobile);
                    request.setAttribute("staffRole", staffRole);
                    request.setAttribute("staffID", staffId);
                }
                }
                List<Long> staffServiceIDs=(List<Long>)serviceIDHash.get("StaffService");
                if(staffServiceIDs!=null && staffServiceIDs.size()>0){
                    request.setAttribute("StaffServiceID", staffServiceIDs);
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
    public ActionForward updateStaffInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("uuuuuuuuuustafffffff>>>>>>>");
        int staffId = 0;
        String staffName = "";
        String staffEmail = "";
        String staffMobile = "";
        String staffRole = "";
        boolean status = false;
        String action = "update";

        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            StaffForm staffForm = new StaffForm();
            if (request.getParameter("staffId") != null) {
                staffId = Integer.parseInt(request.getParameter("staffId"));
            }
            System.out.println(">>>>>>>>staffffffffffriniupdteeeee>>>>>>>" + staffId + ">>>actionnnnnnn>>>>>" + request.getParameter("action"));
            if (request.getParameter("action") != null) {
                action = request.getParameter("action").toString();
            }
            if (staffId > 0 && action.equals("update")) {
                if (request.getParameter("staffName") != null && request.getParameter("staffName").trim().length() > 0) {
                    staffName = request.getParameter("staffName");
                }
                if (request.getParameter("staffEmail") != null && request.getParameter("staffEmail").trim().length() > 0) {
                    staffEmail = request.getParameter("staffEmail");
                }
                if (request.getParameter("staffMobile") != null && request.getParameter("staffMobile").trim().length() > 0) {
                    staffMobile = request.getParameter("staffMobile");
                }
                if (request.getParameter("staffRole") != null && request.getParameter("staffRole").trim().length() > 0) {
                    staffRole = request.getParameter("staffRole");
                    if(staffRole.equalsIgnoreCase("0")){
                        staffRole="Admin";
                    }else{
                        staffRole="Staff";
                    }
                }

                staffForm.setStaffName(staffName);
                staffForm.setStaffEmail(staffEmail);
                staffForm.setStaffMobile(staffMobile);
                staffForm.setStaffRole(staffRole);
                status = locobj.updateStaffInfo(staffId, staffForm);

            } else if (staffId > 0 && action.equals("delete")) {
                status = locobj.deleteStaff(staffId);
                System.out.println("Deleted Status>>>>>>>" + status);
            }
            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String userId = session.getAttribute("UserID").toString().trim();

               /* ArrayList staffList = (ArrayList) locobj.getStaffList(userId);
                System.out.println(">>>>>>>>Update Staff List>>>>>" + staffList);
                request.setAttribute("staffList", staffList);
                if (!staffList.isEmpty()) {
                    request.setAttribute("showList", true);
                }*/
                Hashtable staffHash = (Hashtable) locobj.getStaffList(userId);
                System.out.println(">>>>>>>>AFTER get staff list >>>>>" + staffHash);
                if(staffHash!=null){
                    ArrayList staffList=(ArrayList)staffHash.get("staffList");  
                    Hashtable staffServiceHash=(Hashtable)staffHash.get("staffServiceHash");  
                if (!staffList.isEmpty()) {
                    request.setAttribute("staffList", staffList);
                    request.setAttribute("staffServiceHash", staffServiceHash);
                    request.setAttribute("showList", true);
                }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }

    public ActionForward deleteStaff(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int staffId = 0;

        boolean status = false;
        try {
            if (request.getParameter("staffId") != null) {
                staffId = Integer.parseInt(request.getParameter("staffId"));
            }
            System.out.println(">>>>>>>>stafffinfooooo>>>>>" + staffId);
            if (staffId > 0) {
                SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
                status = locobj.deleteStaff(staffId);
                HttpSession session = request.getSession(false);
                if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                    String userId = session.getAttribute("UserID").toString().trim();
                    /*ArrayList staffList = (ArrayList) locobj.getStaffList(userId);
                    System.out.println(">>>>>>>>Del Staff List>>>" + staffList);
                    request.setAttribute("staffList", staffList);
                    if (!staffList.isEmpty()) {
                        request.setAttribute("showList", true);
                    }*/
                Hashtable staffHash = (Hashtable) locobj.getStaffList(userId);
                System.out.println(">>>>>>>>AFTER get staff list >>>>>" + staffHash);
                if(staffHash!=null){
                    ArrayList staffList=(ArrayList)staffHash.get("staffList");  
                    Hashtable staffServiceHash=(Hashtable)staffHash.get("staffServiceHash");  
                if (!staffList.isEmpty()) {
                    request.setAttribute("staffList", staffList);
                    request.setAttribute("staffServiceHash", staffServiceHash);
                    request.setAttribute("showList", true);
                }
                }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
}
