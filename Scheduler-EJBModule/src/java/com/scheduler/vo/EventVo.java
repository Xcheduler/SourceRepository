/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scheduler.vo;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author peria
 */
public class EventVo implements Serializable {
    
    private ArrayList events=null;

    /**
     * @return the events
     */
    public ArrayList getEvents() {
        return events;
    }

    /**
     * @param events the events to set
     */
    public void setEvents(ArrayList events) {
        this.events = events;
    }
    
}
