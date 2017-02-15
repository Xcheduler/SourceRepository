/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.forms;

/**
 *
 * @author My Pc
 */
public class CustomerForm implements java.io.Serializable {
    private String customerName = null;
    private String customerEmail = null;
    private String customerMobile = null;
    private int customerId;
    private String userID = null;
    public CustomerForm()
    {
        super();
    }
    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
    }
    public String getCustomerName()
    {
        return customerName;
    }
    public void setCustomerEmail(String customerEmail)
    {
        this.customerEmail = customerEmail;
    }
    public String getcustomerEmail()
    {
        return customerEmail;
    }
    public void setCustomerMobile(String customerMobile)
    {
        this.customerMobile = customerMobile;
    }
    public String getcustomerMobile()
    {
        return customerMobile;
    }
    public void setUserID(String userID)
    {
        this.userID = userID;
    }
    public String getUserID()
    {
        return userID;
    }
    public int getCustomerID()
    {
        return customerId;
    }
    public void setCustomerID(int customerID)
    {
        this.customerId = customerID;
    }
}
