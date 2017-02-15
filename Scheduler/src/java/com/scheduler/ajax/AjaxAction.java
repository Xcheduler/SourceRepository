/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.ajax;

import com.scheduler.vo.CalendarVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.ecom.lookup.EJBLookUp;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;

/**
 *
 * @author chidambara-0615
 */
public class AjaxAction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
         HttpSession session = request.getSession();
        try {
            System.out.println(">>>>>>>>>>Test>>>>>ajaxxxxxxx>>>>>");
            boolean result;
            String user_id = session.getAttribute("UserID").toString();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String exe = request.getParameter("execute");
            String param = request.getParameter("inputParam");
            Long startDate = Long.parseLong(request.getParameter("startDate"));
            Long endDate = Long.parseLong(request.getParameter("endDate"));
            Date strdate = new Date(startDate);
            Date enddt = new Date(endDate-1);
            String stdate = formatter.format(strdate);
            String edate = formatter.format(enddt);
            System.out.println(">>>>>>>>>>>>>>>ajaxxxxxxx>>>>>" + exe + ">>>>>>>>" + param);
            CalendarVO calForm = new CalendarVO();
            calForm.setUserID(1l);
            calForm.setEventName(param);
            calForm.setEventDesc(exe);
            calForm.setType(1);
            calForm.setEvent_startDate(stdate);
            calForm.setEvent_endDate(edate);
              calForm.setUserUniqId(user_id);
            if ("addNew".equalsIgnoreCase(exe)) {
                result = locobj.addEvent(calForm);
            } else if ("update".equalsIgnoreCase(exe)) {
                result = locobj.updateEvent(1l, calForm);
            } else {
                result = locobj.deleteEvent(1l);
            }

            out.println("successsss");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
