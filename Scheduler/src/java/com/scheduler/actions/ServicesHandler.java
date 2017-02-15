/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import com.scheduler.forms.ServiceForm;
import java.util.ArrayList;
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
public class ServicesHandler extends DispatchAction{
    /* public ActionForward execute(ActionMapping mapping, ActionForm form,
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
    
    
    public ActionForward addServices(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ServletContext contexts = servlet.getServletContext();
        HttpSession session = request.getSession(false);
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            // HashMap customerMap = new HashMap();
            ServiceForm serviceForm = new ServiceForm();
            System.out.println("====Service=>>");
            if (request.getParameter("serviceID") == null) {
                String serviceName = "";
                String serviceDesc = "";
                double serviceCost = 0.00;
                int serviceHour=0;
                int serviceBuffer=0;
                String userId = "";
                boolean flag = false;
                if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                    userId = session.getAttribute("UserID").toString().trim();
                }
                if (request.getParameter("serviceName") != null && request.getParameter("serviceName").trim().length() > 0) {
                    serviceName = request.getParameter("serviceName");
                }
                if (request.getParameter("serviceDesc") != null && request.getParameter("serviceDesc").trim().length() > 0) {
                    serviceDesc = request.getParameter("serviceDesc");
                }
                if (request.getParameter("serviceCost") != null && request.getParameter("serviceCost").trim().length() > 0) {
                    serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
                }
                if (request.getParameter("serviceHour") != null && request.getParameter("serviceHour").trim().length() > 0) {
                    serviceHour = Integer.parseInt(request.getParameter("serviceHour"));
                }
                if (request.getParameter("serviceBuffer") != null && request.getParameter("serviceBuffer").trim().length() > 0) {
                    serviceBuffer = Integer.parseInt(request.getParameter("serviceBuffer"));
                }

                serviceForm.setServiceName(serviceName);
                serviceForm.setServiceDesc(serviceDesc);
                serviceForm.setServiceCost(serviceCost);
                serviceForm.setServiceHour(serviceHour);
                serviceForm.setServiceBuffer(serviceBuffer);
                serviceForm.setUserID(userId);

                if (serviceName.trim().length() > 0) {
                    flag = locobj.insertService(serviceForm);
                }
                System.out.println("====Service Flag=>>" + flag);

           
                ArrayList<Properties> serviceList = locobj.getServiceList(serviceForm.getUserID());
                System.out.println(">>>>>>>>Service List>>>>>" + serviceList);
                request.setAttribute("serviceList", serviceList);
                if (!serviceList.isEmpty()) {
                    request.setAttribute("showList", true);
                }
                //return mapping.findForward(".customerList");
            } else if (request.getParameter("serviceID") != null) {
                long serviceID = Integer.parseInt(request.getParameter("serviceID"));
               
                System.out.println("===Service  ID=>>>>>" + serviceID);
                String serviceName = serviceForm.getServiceName();
                String serviceDesc = serviceForm.getServiceDesc();
                double serviceCost = serviceForm.getServiceCost();
                int serviceHour=serviceForm.getServiceHour();
                int serviceBuffer=serviceForm.getServiceBuffer();
                request.setAttribute("serviceName", serviceName);
                request.setAttribute("serviceDesc", serviceDesc);
                request.setAttribute("serviceCost", serviceCost);
                request.setAttribute("serviceHour", serviceHour);
                request.setAttribute("serviceBuffer", serviceBuffer);
                request.setAttribute("serviceID", serviceID);
                request.setAttribute("editForm", true);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
    
     public ActionForward getService(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String user_id = session.getAttribute("UserID").toString();
                System.out.println("====uSER id>>>>"+user_id);
                ArrayList<Properties> serviceList = locobj.getServiceList(user_id);
                System.out.println(">>>>>>>>sevrive List>>>>>" + serviceList);
                request.setAttribute("serviceList", serviceList);
                if (!serviceList.isEmpty()) {
                    request.setAttribute("showList", true);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
     //
      public ActionForward updateServiceInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("updateServiceInfo>>>>>>>");
        int serviceId = 0;
        String serviceName = "";
        String serviceDesc = "";
        double serviceCost = 0.00;
        int serviceHour = 0;
        int serviceBuffer = 0;
        boolean status = false;
        String action = "update";

        try {
            SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
            ServiceForm serviceForm = new ServiceForm();
            if (request.getParameter("serviceId") != null) {
                serviceId = Integer.parseInt(request.getParameter("serviceId"));
            }
            System.out.println(">>>>>>>>Service Update>>>>>>>" + serviceId + ">>>actionnnnnnn>>>>>" + request.getParameter("action"));
            if (request.getParameter("action") != null) {
                action = request.getParameter("action").toString();
            }
            if (serviceId > 0 && action.equals("update")) {
                if (request.getParameter("serviceName") != null && request.getParameter("serviceName").trim().length() > 0) {
                    serviceName = request.getParameter("serviceName");
                }
                if (request.getParameter("serviceDesc") != null && request.getParameter("serviceDesc").trim().length() > 0) {
                    serviceDesc = request.getParameter("serviceDesc");
                }
                if (request.getParameter("serviceCost") != null && request.getParameter("serviceCost").trim().length() > 0) {
                    serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
                }
                if (request.getParameter("serviceHour") != null && request.getParameter("serviceHour").trim().length() > 0) {
                    serviceHour = Integer.parseInt(request.getParameter("serviceHour"));
                }
                if (request.getParameter("serviceBuffer") != null && request.getParameter("serviceBuffer").trim().length() > 0) {
                    serviceBuffer = Integer.parseInt(request.getParameter("serviceBuffer"));
                }

                serviceForm.setServiceName(serviceName);
                serviceForm.setServiceDesc(serviceDesc);
                serviceForm.setServiceCost(serviceCost);
                serviceForm.setServiceHour(serviceHour);
                serviceForm.setServiceBuffer(serviceBuffer);
                status = locobj.updateServiceInfo(serviceId, serviceForm);

            } else if (serviceId > 0 && action.equals("delete")) {
                status = locobj.deleteService(serviceId);
                System.out.println("Service Deleted Status>>>>>>>" + status);
            }
            HttpSession session = request.getSession(false);
            if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                String userId = session.getAttribute("UserID").toString().trim();

                ArrayList serviceList = (ArrayList) locobj.getServiceList(userId);
                System.out.println(">>>>>>>>Update serviceList>>>>>" + serviceList);
                request.setAttribute("serviceList", serviceList);
                if (!serviceList.isEmpty()) {
                    request.setAttribute("showList", true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
      //
      public ActionForward deleteService(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        int serviceId = 0;

        boolean status = false;
        try {
            if (request.getParameter("serviceId") != null) {
                serviceId = Integer.parseInt(request.getParameter("serviceId"));
            }
            System.out.println(">>>>>>>>serviceId>>>>>" + serviceId);
            if (serviceId > 0) {
                SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
                status = locobj.deleteService(serviceId);
                HttpSession session = request.getSession(false);
                if (session.getAttribute("UserID") != null && session.getAttribute("UserID").toString().trim().length() > 0) {
                    String userId = session.getAttribute("UserID").toString().trim();
                    ArrayList serviceList = (ArrayList) locobj.getServiceList(userId);
                    System.out.println(">>>>>>>>Del service List>>>" + serviceList);
                    request.setAttribute("serviceList", serviceList);
                    if (!serviceList.isEmpty()) {
                        request.setAttribute("showList", true);
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
    
}
