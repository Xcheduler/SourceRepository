/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.vo;

import java.io.Serializable;

/**
 *
 * @author My Pc
 */
public class CalendarVO implements Serializable{
private Long userID;
private String eventName;
private String eventDesc;
private Long taskID;
private int type;
private Long eventTime;
private String event_startDate;
private String event_endDate;
private String userUniqId;

    /**
     * @return the userID
     */
    public Long getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(Long userID) {
        this.userID = userID;
    }

    /**
     * @return the eventName
     */
    public String getEventName() {
        return eventName;
    }

    /**
     * @param eventName the eventName to set
     */
    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    /**
     * @return the eventDesc
     */
    public String getEventDesc() {
        return eventDesc;
    }

    /**
     * @param eventDesc the eventDesc to set
     */
    public void setEventDesc(String eventDesc) {
        this.eventDesc = eventDesc;
    }

    /**
     * @return the taskID
     */
    public Long getTaskID() {
        return taskID;
    }

    /**
     * @param taskID the taskID to set
     */
    public void setTaskID(Long taskID) {
        this.taskID = taskID;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }
public Long getEventTime() {
        return eventTime;
    }

    /**
     * @param EventTime the type to set
     */
    public void setEventTime(Long eventTime) {
        this.eventTime = eventTime;
    }

    /**
     * @return the event_startDate
     */
    public String getEvent_startDate() {
        return event_startDate;
    }

    /**
     * @param event_startDate the event_startDate to set
     */
    public void setEvent_startDate(String event_startDate) {
        this.event_startDate = event_startDate;
    }

    /**
     * @return the event_endDate
     */
    public String getEvent_endDate() {
        return event_endDate;
    }

    /**
     * @param event_endDate the event_endDate to set
     */
    public void setEvent_endDate(String event_endDate) {
        this.event_endDate = event_endDate;
    }

    /**
     * @return the userUniqId
     */
    public String getUserUniqId() {
        return userUniqId;
    }

    /**
     * @param userUniqId the userUniqId to set
     */
    public void setUserUniqId(String userUniqId) {
        this.userUniqId = userUniqId;
    }


}
