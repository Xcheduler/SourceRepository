/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.tiles.TilesRequestProcessor;

/**
 *
 * @author sasikumar
 */
public class RequestController extends TilesRequestProcessor {

    public static final String OPEN_URL = "|/dashboardAction.do|/Welcome.do|/LoginAction.do|/Register.do|/RegistrationAction.do|/forgotpassword.do|/ForgotPasswordAction.do|/resetpassword.do|/ResetPasswordAction.do|/services.do|/staff.do|/customer.do|/profile.do";

    /**
     * Creates a new instance of RequestController
     */
    public RequestController() {
    }

    @Override
    protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {
        boolean iscontinueaccess = true;
        ServletContext contexts = servlet.getServletContext();
        String strRequestPath = request.getServletPath();
        System.out.println("rquest path--->" + strRequestPath);
        //
        if (!(OPEN_URL.contains(strRequestPath))) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (!session.getId().equals((String) session.getAttribute("systemid"))) {
                    iscontinueaccess = false;
                    try {
                        if (request.getHeader("X-Requested-With") != null && request.getHeader("X-Requested-With").equals("XMLHttpRequest")) {
                            response.sendError(403); // Response error set
                        } else {
                            response.sendRedirect("SessionExpired.jsp");//SessionOut
                        }
                    } catch (Exception e) {
                        iscontinueaccess = false;
                        System.out.println("Exception while Preprocessing: " + e);
                    }
                }
            } else {
                try {
                    System.out.println("session expired ");
                    response.sendRedirect("SessionExpired.jsp");//SessionOut
                } catch (Exception e) {
                    iscontinueaccess = false;
                    System.out.println("Exception while Preproces Session expired " + e);
                }
            }
        }
        if (response.containsHeader("SET-COOKIE")) {
            String sessionid = request.getSession().getId();
            String contextPath = request.getContextPath();
            String secure = "";
            if (request.isSecure()) {
                secure = "; Secure";
            }
            System.out.println("Comes to login servlet :");
            response.addHeader("SET-COOKIE", "JSESSIONID=" + sessionid
                    + "; Path=" + contextPath + "; HttpOnly" + secure);
        }
        return iscontinueaccess;
    }
}
