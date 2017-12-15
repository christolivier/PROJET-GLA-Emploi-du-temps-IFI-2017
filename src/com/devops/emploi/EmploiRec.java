package com.devops.emploi;


import com.dhtmlx.planner.DHXEventRec;

public class EmploiRec extends DHXEventRec
{ 
  public String color,etitle,edesc,event_type;
   
  public String getColor() {
   return color;
  }
  public void setColor(String color) {
   this.color = color;
  }
 
  public String getEtitle() {
   return etitle;
  }
  public void setEtitle(String etitle) {
   this.etitle = etitle;
  }
 
  public String getEdesc() {
   return edesc;
  }
  public void setEdesc(String edesc) {
   this.edesc = edesc;
  }
  
  public String getEvent_type() {
   return event_type;
  }
  public void setEvent_type(String event_type) {
   this.event_type = event_type;
  }
 
}
