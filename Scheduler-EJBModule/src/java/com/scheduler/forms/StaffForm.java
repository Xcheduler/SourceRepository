/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.forms;

import java.util.List;

/**
 *
 * @author My Pc
 */
public class StaffForm implements java.io.Serializable {
    private String staffName = null;
    private String staffEmail = null;
    private String staffMobile = null;
    private int staffId;
    private String userID = null;
    private int staffRoleID;
    private String staffRole=null;
    private List staffServiceIDList=null;

    public List getStaffServiceIDList() {
        return staffServiceIDList;
    }

    public void setStaffServiceIDList(List staffServiceIDList) {
        this.staffServiceIDList = staffServiceIDList;
    }

    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }
    public StaffForm()
    {
        super();
    }
    public void setStaffName(String staffName)
    {
        this.staffName = staffName;
    }
    public String getStaffName()
    {
        return staffName;
    }
    public void setStaffEmail(String staffEmail)
    {
        this.staffEmail = staffEmail;
    }
    public String getStaffEmail()
    {
        return staffEmail;
    }
    public void setStaffMobile(String staffMobile)
    {
        this.staffMobile = staffMobile;
    }
    public String getStaffMobile()
    {
        return staffMobile;
    }
    public void setUserID(String userID)
    {
        this.userID = userID;
    }
    public String getUserID()
    {
        return userID;
    }
    public int getStaffID()
    {
        return staffId;
    }
    public void setStaffID(int staffID)
    {
        this.staffId = staffID;
    }
    public void setStaffRoleID(int staffRoleID)
    {
        this.staffRoleID = staffRoleID;
    }
    public int getStaffRoleID()
    {
        return staffRoleID;
    }
}
