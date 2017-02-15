/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.actions;

import com.google.gson.Gson;
import com.scheduler.vo.EventVo;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.ecom.lookup.EJBLookUp;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 *
 * @author chidambara-0615
 */
public class CalenderAction extends org.apache.struts.action.Action{
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SchedulerCntrlBeanRemote locobj = EJBLookUp.getSchedulerCntrlBeanLookUp();
        HttpSession session = request.getSession();
        session.setAttribute("systemid",session.getId());
        Gson gson=new Gson();
        try {
             String user_id = session.getAttribute("UserID").toString();
             ArrayList arr=(ArrayList)locobj.selectEvent(user_id);
             String json=new Gson().toJson(arr);
             System.out.println("$$$$$$$$$$$$$$$$$$$$$"+json);
             request.setAttribute("Result", json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward("Success");
    }
    
}
