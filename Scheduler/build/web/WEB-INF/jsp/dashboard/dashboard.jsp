

<%-- 
   Document   : dashboard
   Created on : 6 Nov, 2016, 2:59:49 PM
   Author     : sasi
   --%>
<!doctype html> 
<html lang="en">
   <head>
      <meta charset="utf-8">
      <title>Xchedule</title>
      <meta name="description" content="Marino, Admin theme, Dashboard theme, AngularJS Theme">
      <meta name="viewport" content="width=device-width,initial-scale=1">
      <link rel="shortcut icon" href="favicon.ico">
      <!--<link rel="stylesheet" href="css/styles/profile_div_text.css">-->
      <!--[if IE]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]--><!-- global stylesheets --> 
   </head>
   <script>
      function LoadPricing()
      {          
      document.getElementById('pricingDiv').style='block';
      $("#large-modal").modal();
      }
   </script>
   <%
      boolean showPricing = false;
         if(request.getAttribute("fromLogin")!=null && request.getAttribute("fromLogin").toString().equalsIgnoreCase("true"))
         {
             showPricing=true;
         }
         %>
   <%if(showPricing){%>
   <body onload="LoadPricing()">
      <%
         request.setAttribute("fromLogin","false");
         }
         %>
      <body data-layout="empty-layout" data-palette="palette-5" data-direction="none">
         <!-- small modal --><!-- large modal --> 
         <div id="pricingDiv" style="display:none;">
            <div class="modal fade" id="large-modal" tabindex="-1" role="dialog" aria-labelledby="large-modalLabel" aria-hidden="true">
               <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> 
                        <h4 class="modal-title" id="large-modalLabel">Pricing Table</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row m-b-20 pricing-table-2">
                           <div class="col-xs-12 col-lg-4 text-center t1">
                              <div class="header">
                                 <h3>Basic</h3>
                                 <h1> <sup>$</sup> <span>29</span> <span class="text-xs"> / month</span> </h1>
                              </div>
                              <div class="inner">
                                 <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                       <tbody>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Free setup</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Unlimited bandwidth</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">100 GB storage</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">5 user accounts</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-remove color-danger-900"></i> <span class="text">0% transaction fee</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-remove color-danger-900"></i> <span class="text">Free support</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-remove color-danger-900"></i> <span class="text">Unlimited upgrades</span> </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                                 <button class="btn btn-white btn-outline">Start trial</button> 
                              </div>
                           </div>
                           <div class="col-xs-12 col-lg-4 text-center t2">
                              <div class="header">
                                 <h3>Professional</h3>
                                 <h1> <sup>$</sup> <span>59</span> <span class="text-xs"> / month</span> </h1>
                              </div>
                              <div class="inner">
                                 <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                       <tbody>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Free setup</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Unlimited bandwidth</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">200 GB storage</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">10 user accounts</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">0% transaction fee</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-remove color-danger-900"></i> <span class="text">Free support</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-remove color-danger-900"></i> <span class="text">Unlimited upgrades</span> </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                                 <button class="btn btn-white btn-outline btn-lg">Start trial</button> 
                              </div>
                           </div>
                           <div class="col-xs-12 col-lg-4 text-center t3">
                              <div class="header">
                                 <h3>Business</h3>
                                 <h1> <sup>$</sup> <span>99</span> <span class="text-xs"> / month</span> </h1>
                              </div>
                              <div class="inner">
                                 <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                       <tbody>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Free setup</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Unlimited bandwidth</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">1 TB storage</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Unlimited user accounts</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">0% transaction fee</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Free support</span> </td>
                                          </tr>
                                          <tr>
                                             <td> <i class="fa fa-check color-success-900"></i> <span class="text">Unlimited upgrades</span> </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                                 <button class="btn btn-white btn-outline">Start trial</button> 
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer"> <button type="button" class="btn btn-info" data-dismiss="modal">Close</button> <button type="button" class="btn btn-warning">Save changes</button> </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- large modal --> 
         <div class="container-fluid">
            <div class="" id="main">
               <div class="table-responsive">
                  <table class="table table-bordered table-striped responsive-utilities">
                     <thead>
                        <tr>
                           <th>
                              <h3><b>This Week</h3>
                              <small>Jan 30 - Feb 02</small> 
                           </th>
                           <th>
                              <h3><b> &nbsp;&nbsp;&nbsp;&nbsp; 1</h3>
                              <small>Appointment</small> 
                           </th>
                           <th>
                              <h3><b> &nbsp;&nbsp;&nbsp;&nbsp;$0</h3>
                              <small>Confirmed Revenue</small> 
                           </th>
                           <th>
                              <h3><b> &nbsp;&nbsp;&nbsp;&nbsp;$0</h3>
                              <small>Projected Revenue</small> 
                           </th>
                           <th>
                              <h3><b> &nbsp;&nbsp;&nbsp;&nbsp;$0</h3>
                              <small>Total Revenue</small> 
                           </th>
                        </tr>
                     </thead>
                  </table>
				  
				  <ul class="list-group"> 
				  <li class="list-group-item"> <span class="text-xs pull-right"><p align="center"><a href="/scheduler/calenderAction.do" class="btn btn-info m-r-5">Book Appointment</a></p></span> 				  				  
				   <label class="bg-warning-100" >THIS WEEK'S SCHEDULE</label></li> 
				  </ul> 
				  
				 <div class="table-responsive"> <table class="table">  
                                         <tbody> <tr> <th scope="row">1</th> 
                                                 <td>Apple, Inc.</td> <td>Australia</td> <td> <span class="label label-success">success</span> </td> </tr> <tr> <th scope="row">2</th> <td>Pinterest</td> <td>USA</td> <td> <span class="label label-info">info</span> </td> </tr> <tr> <th scope="row">3</th> <td>Reddit</td> <td>England</td> <td> <span class="label label-success">success</span> </td> </tr> <tr> <th scope="row">4</th> <td>Coursera</td> <td>USA</td> <td> <span class="label label-warning">warning</span> </td> </tr>  </tbody> </table> </div>
                        
                       
                     </div>
                  </div>
               </div>
   </body>
</html>

