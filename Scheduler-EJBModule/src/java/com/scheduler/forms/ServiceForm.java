/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.forms;

/**
 *
 * @author peria
 */
public class ServiceForm implements java.io.Serializable{
    
    public String serviceName;

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceHour() {
        return serviceHour;
    }

    public void setServiceHour(int serviceHour) {
        this.serviceHour = serviceHour;
    }

    public int getServiceBuffer() {
        return serviceBuffer;
    }

    public void setServiceBuffer(int serviceBuffer) {
        this.serviceBuffer = serviceBuffer;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public long getServiceID() {
        return serviceID;
    }

    public void setServiceID(long serviceID) {
        this.serviceID = serviceID;
    }
    public String serviceDesc;
    public double serviceCost;
    public int serviceHour;
    public int serviceBuffer;
    public String userID;
    public long serviceID;   
    
}
