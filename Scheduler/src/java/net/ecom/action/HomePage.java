/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import javax.servlet.ServletContext;

/**
 *
 * @author sasikumar.r
 */
public class HomePage extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    String SUCCESS = "success";
    static int i = 0;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //  ServletContext context = servlet.getServletContext();
        //   HttpSession session = request.getSession();
        try {
            //    String login_user = (String) session.getAttribute("AgencyAdminMap");

            System.out.println("======================>>>>login");

            SUCCESS = "success";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapping.findForward(SUCCESS);
    }
}
