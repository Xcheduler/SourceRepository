
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.scheduler.forms.ProfileForm" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Xchedule</title>
        <meta name="description" content="Marino, Admin theme, Dashboard theme, AngularJS Theme">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="shortcut icon" href="favicon.ico">
        <!--[if IE]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]--><!-- global stylesheets --> 
       
        <link rel="stylesheet" href="css/styles/profile_div_text.css">
        <link rel="stylesheet" href="css/toggle/toggle.css">
        <link rel="stylesheet" href="css/components/bootstrap.css">
    </head>
    <body data-layout="empty-layout" data-palette="palette-0" data-direction="none">
        <div class="container-fluid">
            <div class="bs-nav-tabs nav-tabs-warning">
                <ul class="nav nav-tabs nav-animated-border-from-left">
                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" data-target="#profile_company_details">Company Details</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" data-target="#profile_business_hours">Business Hours</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" data-target="#profile_booking_policies">Booking Policies</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" data-target="#profile_customization">Customization</a> </li>
                </ul>
                <div class="tab-content">
                    
                    <div role="tabpanel" class="tab-pane in active" id="profile_company_details">		
                        <h5> Configure Your Xchedule Booking Page </h5>
                        <form name="companyDetails" action="/scheduler/profile.do?execute=companyDetails" method="POST">                           
                            
                            <%!
                            String companyName="";
                            String companyEmail="";
                            String bookingURL="";
                            String phone="";
                            String website="";
                            String currency="";
                            String address="";
                            String city="";
                            String state="";
                            String zip="";
                            String aboutyou="";
                            String facebook="";
                            String twitter="";
                            
                            %>
                            <%
                              List<ProfileForm> profileList = (ArrayList<ProfileForm>) session.getAttribute("profileList");
                                  if (profileList != null && profileList.size()>0) {
                                      ProfileForm props = (ProfileForm) profileList.get(0);
                                      if(props!=null){
                                      companyName = (props.getCompanyName()!=null?props.getCompanyName():"");
                                      companyEmail = (props.getEmail()!=null?props.getEmail():"");
                                      bookingURL = (props.getBookingURL()!=null?props.getBookingURL():"");
                                      phone = (props.getPhone()!=null?props.getPhone():"");
                                      website = (props.getWebsite()!=null?props.getWebsite():"");
                                      currency = (props.getCurrency()!=null?props.getCurrency():"");
                                      address = (props.getAddress()!=null?props.getAddress():"");
                                      city = (props.getCity()!=null?props.getCity():"");
                                      state = (props.getState()!=null?props.getState():"");
                                      zip = (props.getZip()!=null?props.getZip():"");
                                      aboutyou = (props.getAboutYou()!=null?props.getAboutYou():"");
                                      facebook = (props.getFacebook()!=null?props.getFacebook():"");
                                      twitter = (props.getTwitter()!=null?props.getTwitter():"");
                                      }
             
                              }
                              
                             %>
                        <div class="table-responsive">
                            <p align="center"><button type="submit"  class="btn btn-info m-r-5"><i class="btn-icon fa fa-edit"></i>Save Company Changes </button></p>
                            <table class="table ">                          
                                <tbody>                             
                                    <tr>
                                        <td style="vertical-align:middle" >
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Your Booking URL</p>
                                            </div>							
                                        </td>
                                        <td >
                                            <div style="width:50%;">												
                                                <input type="text" value='<%=bookingURL%>' name="bookingURL"  class="form-control"> 
                                                <p><small class="color-success">Email, tweet, and share this link with customers.</small></p>												
                                            </div>
                                            <!--<button type="button" data-toggle="modal" data-target="#customer_url-modal" class="btn btn-info m-r-5"><i class="btn-icon fa fa-edit"></i>Edit </button>-->
                                            

                                        </td>
                                    </tr>  

                                    <tr>
                                        <td style="vertical-align:middle" >
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Company Name</p>
                                            </div>							
                                        </td>
                                        <td >
                                            <div style="width:50%;">                                                
                                                <input type="text" name="companyName" value='<%=companyName%>'                                                   
                                                         class="typeahead-2 form-control"> 
                                                <p><small class="color-success">This name will appear at the top of your account.</small></p>												
                                            </div>
                                            <!--<button type="button" data-toggle="modal" data-target="#company-modal" class="btn btn-info m-r-5"><i class="btn-icon fa fa-edit"></i>Edit</button>-->

                                        </td>
                                    </tr>    

                                    <tr>
                                        <td style="vertical-align:middle" >
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Company Logo</p>
                                            </div>							
                                        </td>
                                        <td >

                                            <div class="pull-left w-100 h-100 m-r-10 m-b-10"> 
                                                <img class="img-fluid w-100 img-thumbnail bs-img-thumbnail" name="companyLogo" src="assets/images/thumbs/p4.png"> 
                                            </div>
                                            <div class="col-xs-12 col-xl-6">
                                                <fieldset class="form-group"> <label>Upload image</label> <br> <label class="file"> 
                                                        <input class="form-control" type="file" id="file"><span class="file-custom"></span> </label> </fieldset>
                                            </div>		

                                        </td>
                                    </tr>    

                                    <tr>
                                        <td style="vertical-align:middle" >
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Contact Details</p>
                                            </div>							
                                        </td>
                                        <td >
                                            <div style="width:50%;">													
                                                <input type="text" name="email" placeholder="E-mail" class="form-control" value='<%=companyEmail%>'/> 
                                                <p><small class="color-success">This will be your "Reply-To" address for email notifications.</small></p>
                                                <input type="text" name="phone" value='<%=phone%>' placeholder="Phone" class="form-control"/>
                                                <input type="text" name="website" value='<%=website%>' placeholder="Website" class="form-control"/>
                                                <br/>																									
                                            </div>
                                            <!--<p><button type="button" class="btn btn-info m-r-5"><i class="btn-icon fa fa-check"></i>Submit</button> </p>-->
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Currency</p>
                                            </div>							
                                        </td>
                                        <td >
                                            <div style="width:50%;">												
                                                <div class="select-style">
                                                    <select name="currency">
                                                        <option value=""></option>
                                                        <option value="india">(GMT -5.30) India Time - Kolkatta</option>
                                                        <option value="mercedes">(GMT -5.40) India Time - Kolkatta</option>
                                                        <option value="audi">(GMT -5.50) India Time - Kolkatta</option>
                                                    </select>
                                                </div>										
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Address</p>
                                            </div>							
                                        </td>
                                        <td >											  
                                            <div style="width:50%;">
                                                <input type="text" name="address" value='<%=address%>' placeholder="Address" class="form-control"/>
                                                <input type="text" name="city" value='<%=city%>' placeholder="City" class="form-control"/>
                                                <input type="text" name="state" value='<%=state%>' placeholder="State" class="form-control"/>
                                                <input type="text" name="zip" value='<%=zip%>' placeholder="Zip" class="form-control"/>
                                            </div>												
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">About You</p>
                                            </div>							
                                        </td>
                                        <td >											  
                                            <div style="width:50%;">

                                                <textarea name="aboutYou" value='<%=aboutyou%>' placeholder="A brief overview of what you are all about" class="form-control"></textarea>
                                            </div>												
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="center" class="f-w-400">Social Media</p>
                                            </div>							
                                        </td>
                                        <td >											  											   
                                            <div style="width:50%;">
                                                <input type="text" name="facebook" value='<%=facebook%>' placeholder="Facebook" class="form-control"/>
                                                <input type="text" name="twiter" value='<%=twitter%>' placeholder="Twiter" class="form-control"/>
                                            </div>
                                            <!--<p><button type="button" class="btn btn-info m-r-5"><i class="btn-icon fa fa-check"></i>Submit</button> </p>-->												
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>	
                    </form>
                    </div>
                    
                    <div role="tabpanel" class="tab-pane" id="profile_business_hours">
                        <h5> Business Operating Hours </h5>
                        <div class="table-responsive">
                            <table class="table ">                          
                                <tbody>                             
                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Time Zome</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <div class="select-style">
                                                <select>
                                                    <option value=""></option>
                                                    <option value="india">(GMT -5.30) India Time - Kolkatta</option>
                                                    <option value="mercedes">(GMT -5.40) India Time - Kolkatta</option>
                                                    <option value="audi">(GMT -5.50) India Time - Kolkatta</option>
                                                </select>
                                            </div>										
                                            </div>
                                        </td>
                                    </tr>					

                                </tbody>
                            </table>				
                            <table class="table">
                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Monday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td >						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Tuesday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="profile-business-picker1"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Wednesday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Thursday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Friday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Saturday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>	
                                    <td>
                                        <p  align="right" class="f-w-400">Sunday</p>
                                    </td>		
                                    <td >
                                        <div class="">
                                          <label class="switch switch-green">
                                          <input type="checkbox" class="switch-input" checked>
                                          <span class="switch-label" data-on="On" data-off="Off"></span>
                                          <span class="switch-handle"></span>
                                          </label>
                                          </div>
                                    </td>
                                    <td>						
                                        <div style="width:50%" class="row m-b-20">
                                            <div  class="profile_datepicker">
                                                <div class="input-daterange input-group" id="date-picker3"> <input type="text" class="input-sm form-control" 	name="start"> <span class="input-group-addon">to</span> <input type="text" class="input-sm form-control" 	name="end"> 
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                            </table>
                            <p>To change staff working hours and their availability in the calendar, <a href="#">click here</a></p>

                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile_booking_policies">
                        <h5> How Clients Book Their Own Appointments Online </h5>

                        <div class="table-responsive">
                            <table class="table ">                          
                                <tbody>                             
                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Appointment Lead Time</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>How much advance notice do you need before a client books an appointment?</label>
                                            <fieldset class="form-group"> 
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Day</option>
                                                    <option value="1">1 Day</option> 
                                                    <option value="2">2 Days</option> 
                                                    <option value="3">3 Days</option> 
                                                </select> 
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Hour</option>
                                                    <option value="1">1 Hour</option> 
                                                    <option value="2">2 Hours</option> 
                                                    <option value="3">3 Hours</option>
                                                    <option value="4">4 Hours</option>
                                                    <option value="5">5 Hours</option>											
                                                </select>
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Minute</option>
                                                    <option value="1">1 Minute</option> 
                                                    <option value="2">2 Minutes</option> 
                                                    <option value="3">3 Minutes</option>
                                                    <option value="4">4 Minutes</option>
                                                    <option value="5">5 Minutes</option>
                                                    <option value="6">6 Minutes</option>
                                                    <option value="7">7 Minutes</option>
                                                    <option value="8">8 Minutes</option>
                                                    <option value="9">9 Minutes</option>
                                                    <option value="10">10 Minutes</option>
                                                    <option value="11">11 Minutes</option>
                                                    <option value="12">12 Minutes</option>
                                                    <option value="13">13 Minutes</option>
                                                    <option value="14">14 Minutes</option>
                                                    <option value="15">15 Minutes</option>
                                                    <option value="16">16 Minutes</option>
                                                    <option value="17">17 Minutes</option>
                                                    <option value="18">18 Minutes</option>
                                                    <option value="19">19 Minutes</option>
                                                    <option value="20">20 Minutes</option>
                                                    <option value="21">21 Minutes</option>
                                                    <option value="22">22 Minutes</option>
                                                    <option value="23">23 Minutes</option>
                                                    <option value="24">24 Minutes</option>
                                                    <option value="25">25 Minutes</option>
                                                    <option value="26">26 Minutes</option>
                                                    <option value="27">27 Minutes</option>
                                                    <option value="28">28 Minutes</option>
                                                    <option value="29">29 Minutes</option>
                                                    <option value="30">30 Minutes</option>
                                                    <option value="31">31 Minutes</option>
                                                    <option value="32">32 Minutes</option>
                                                </select>
                                            </fieldset>

                                        </td>			
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Appointment Lead Time</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>How much advance notice do you need before a client books an appointment?</label>
                                            <fieldset class="form-group"> 

                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Hour</option>
                                                    <option value="1">1 Hour</option> 
                                                    <option value="2">2 Hours</option> 
                                                    <option value="3">3 Hours</option>
                                                    <option value="4">4 Hours</option>
                                                    <option value="5">5 Hours</option>											
                                                </select>
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Minute</option>
                                                    <option value="5">5 Minutes</option>
                                                    <option value="10">10 Minutes</option>
                                                    <option value="15">15 Minutes</option>
                                                    <option value="20">20 Minutes</option>
                                                    <option value="25">25 Minutes</option>
                                                    <option value="30">30 Minutes</option>
                                                    <option value="35">35 Minutes</option>
                                                    <option value="40">40 Minutes</option>
                                                    <option value="45">45 Minutes</option>
                                                    <option value="50">50 Minutes</option>
                                                    <option value="55">55 Minutes</option>
                                                </select>
                                            </fieldset>

                                        </td>			
                                    </tr>
									
									
									<tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Scheduling Window</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>How far in advance are customers allowed to book an appointment?</label>
                                            <div class="">
											  <label class="switch switch-green">
												  <input type="checkbox" class="switch-input" checked>
												  <span class="switch-label" data-on="On" data-off="Off"></span>
												  <span class="switch-handle"></span>
											  </label>
                                          </div>

                                        </td>			
                                    </tr>
									
									<tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Contact Fields</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>Select which form fields will show on your booking page.</label>
                                            <table>
												 <tr>
													 <td>
														 <div class="">
															 <label class="switch switch-green">
																 <input type="checkbox" class="switch-input" checked>
																 <span class="switch-label" data-on="On" data-off="Off"></span>
																 <span class="switch-handle"></span>
															 </label>
														 </div>
													 </td>
													 <td>
													 </td>
													 <td style="padding: 20px">
														<input type="checkbox" class="flat" checked="checked"><font face="Verdana" size="2"> Required</font>
													 </td>
												 </tr>
												 <tr>
													 <td>
														 <div class="">
															 <label class="switch switch-green">
																 <input type="checkbox" class="switch-input" checked>
																 <span class="switch-label" data-on="On" data-off="Off"></span>
																 <span class="switch-handle"></span>
															 </label>
														 </div>
													 </td>
													 <td>
													 </td>
													 <td style="padding: 20px">
														<input type="checkbox" class="flat" checked="checked"><font face="Verdana" size="2"> Required</font>
													 </td>
													 </tr>
													 <tr>
													 <td>
													 <div class="">
														 <label class="switch switch-green">
															 <input type="checkbox" class="switch-input" checked>
															 <span class="switch-label" data-on="On" data-off="Off"></span>
															 <span class="switch-handle"></span>
														 </label>
													 </div>
													 </td>
													 <td>
													 </td>
													 <td style="padding: 20px">
														<input type="checkbox" class="flat" checked="checked"><font face="Verdana" size="2"> Required</font>
													 </td>
												 </tr>
											 </table>

                                        </td>			
                                    </tr>
									


                                </tbody>
                            </table>				
							</div>
                        </div>
                        
						<div role="tabpanel" class="tab-pane" id="profile_customization">
						<h5> Customize Your Booking Page </h5>
                         <div class="table-responsive">
                            <table class="table ">                          
                                <tbody>                             
                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Appointment Lead Time</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>How much advance notice do you need before a client books an appointment?</label>
                                            <fieldset class="form-group"> 
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Day</option>
                                                    <option value="1">1 Day</option> 
                                                    <option value="2">2 Days</option> 
                                                    <option value="3">3 Days</option> 
                                                </select> 
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Hour</option>
                                                    <option value="1">1 Hour</option> 
                                                    <option value="2">2 Hours</option> 
                                                    <option value="3">3 Hours</option>
                                                    <option value="4">4 Hours</option>
                                                    <option value="5">5 Hours</option>											
                                                </select>
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Minute</option>
                                                    <option value="1">1 Minute</option> 
                                                    <option value="2">2 Minutes</option> 
                                                    <option value="3">3 Minutes</option>
                                                    <option value="4">4 Minutes</option>
                                                    <option value="5">5 Minutes</option>
                                                    <option value="6">6 Minutes</option>
                                                    <option value="7">7 Minutes</option>
                                                    <option value="8">8 Minutes</option>
                                                    <option value="9">9 Minutes</option>
                                                    <option value="10">10 Minutes</option>
                                                    <option value="11">11 Minutes</option>
                                                    <option value="12">12 Minutes</option>
                                                    <option value="13">13 Minutes</option>
                                                    <option value="14">14 Minutes</option>
                                                    <option value="15">15 Minutes</option>
                                                    <option value="16">16 Minutes</option>
                                                    <option value="17">17 Minutes</option>
                                                    <option value="18">18 Minutes</option>
                                                    <option value="19">19 Minutes</option>
                                                    <option value="20">20 Minutes</option>
                                                    <option value="21">21 Minutes</option>
                                                    <option value="22">22 Minutes</option>
                                                    <option value="23">23 Minutes</option>
                                                    <option value="24">24 Minutes</option>
                                                    <option value="25">25 Minutes</option>
                                                    <option value="26">26 Minutes</option>
                                                    <option value="27">27 Minutes</option>
                                                    <option value="28">28 Minutes</option>
                                                    <option value="29">29 Minutes</option>
                                                    <option value="30">30 Minutes</option>
                                                    <option value="31">31 Minutes</option>
                                                    <option value="32">32 Minutes</option>
                                                </select>
                                            </fieldset>

                                        </td>			
                                    </tr>

                                    <tr>
                                        <td style="vertical-align:middle">
                                            <div class="">
                                                <!-- if u want highlight div selection add media div-->
                                                <p align="right" class="f-w-400">Appointment Lead Time</p>
                                            </div>							
                                        </td>
                                        <td>
                                            <label>How much advance notice do you need before a client books an appointment?</label>
                                            <fieldset class="form-group"> 

                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Hour</option>
                                                    <option value="1">1 Hour</option> 
                                                    <option value="2">2 Hours</option> 
                                                    <option value="3">3 Hours</option>
                                                    <option value="4">4 Hours</option>
                                                    <option value="5">5 Hours</option>											
                                                </select>
                                                <select class="c-select"> 
                                                    <option selected="" value="1">0 Minute</option>
                                                    <option value="5">5 Minutes</option>
                                                    <option value="10">10 Minutes</option>
                                                    <option value="15">15 Minutes</option>
                                                    <option value="20">20 Minutes</option>
                                                    <option value="25">25 Minutes</option>
                                                    <option value="30">30 Minutes</option>
                                                    <option value="35">35 Minutes</option>
                                                    <option value="40">40 Minutes</option>
                                                    <option value="45">45 Minutes</option>
                                                    <option value="50">50 Minutes</option>
                                                    <option value="55">55 Minutes</option>
                                                </select>
                                            </fieldset>

                                        </td>			
                                    </tr>


                                </tbody>
                            </table>				
							</div>

                        </div>
						
						
                    </div>
                </div>
                <!-- large modal --> 
                <div  class="modal fade" id="customer_url-modal" tabindex="-1" role="dialog" aria-labelledby="large-modalLabel" aria-hidden="true">
                    <div style="width: 500px;" class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
                                <h6 class="modal-title" id="large-modalLabel">Modify the URL</h6>
                            </div>
                            <div class="modal-body">
                                <input type="text" class="form-control"/>
                            </div>
                            <div class="modal-footer"> <button type="button" class="btn btn-info" data-dismiss="modal">Close</button> <button type="button" class="btn btn-warning">Save changes</button> </div>
                        </div>
                    </div>
                </div>
                <!-- large modal -->
                <!-- small modal --> 
                <div  class="modal fade" id="company-modal" tabindex="-1" role="dialog" aria-labelledby="large-modalLabel" aria-hidden="true">
                    <div style="width:300px;" class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
                                <h6 class="modal-title" id="small-modalLabel">Modify the company name</h6>
                            </div>
                            <div class="modal-body">
                                <input type="text" class="form-control"/>
                            </div>
                            <div class="modal-footer"> <button type="button" class="btn btn-info" data-dismiss="modal">Close</button> <button type="button" class="btn btn-warning">Save changes</button> </div>
                        </div>
                    </div>
                </div>
                <!-- small modal -->
            </div>
    </body>
</html>