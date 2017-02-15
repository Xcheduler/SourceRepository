/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author chidambara-0615
 */
public class PaymentsHandler extends org.apache.struts.action.Action{
     public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ServletContext contexts = servlet.getServletContext();
        HttpSession session = request.getSession();
       
        try {
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
    
}
