/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ecom.lookup;

import net.ecom.lookup.EJBLookUp.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import net.scheduler.apptier.ctrl.SchedulerCntrlBeanRemote;


public class EJBLookUp {

    public static SchedulerCntrlBeanRemote getSchedulerCntrlBeanLookUp() {
        InitialContext ctx;
        SchedulerCntrlBeanRemote scheLookUpObj = null;
        if (scheLookUpObj == null) {
            try {
                ctx = new InitialContext();
                System.out.println("=================>>>>>>>>>>>");
                scheLookUpObj = (SchedulerCntrlBeanRemote) ctx.lookup("SchedulerCntrlBean/remote");
            } catch (NamingException ex) {
                ex.printStackTrace();
            }
        }
        return scheLookUpObj;
    }
}
