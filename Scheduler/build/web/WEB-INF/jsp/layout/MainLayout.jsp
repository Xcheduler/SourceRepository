<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta charset="utf-8">
            <title>Xcheduler</title>
            <meta name="description" content="Marino, Admin theme, Dashboard theme, AngularJS Theme">
                <meta name="viewport" content="width=device-width,initial-scale=1">
                    <link rel="shortcut icon" href="favicon.ico">
                        <!--[if IE]>
                        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                        <![endif]--><!-- global stylesheets --> 
                        <link rel="stylesheet" href="css/components/bootstrap.css">
                            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
                                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css">
                                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
                                        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css">
                                            <link href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/1.0.0/css/flag-icon.min.css" rel="stylesheet" type="text/css">
                                                <link rel="stylesheet" href="css/styles/main.css">
                                                    <link rel="stylesheet" href="css/chartist/dist/chartist.min.css">
                                                        </head>
                                                        <body data-layout="empty-layout" data-palette="palette-0" data-direction="none">

                                                            <!-- top navigation -->
                                                            <tiles:insert attribute="top"/>
                                                            <!-- /top navigation -->


                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <!-- sidebar menu -->
                                                                    <tiles:insert attribute="menu"/>
                                                                    <!--<div class="col-xs-12 main" id="main" style=";background-color: azure;">-->
                                                                    <div class="col-xs-12 main" id="main" style="">
                                                                        <tiles:insert attribute="body"/>
                                                                        <div class="footer" style="width: 100% !important">
                                                                            <tiles:insert attribute="footer"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- global scripts --> <script src="js/components/jquery/dist/jquery.js"></script> 
                                                            <script src="js/components/tether/tether.js"></script> 
                                                            <script src="js/components/bootstrap/dist/js/bootstrap.js"></script> 
                                                            <script src="js/components/pace/pace.js"></script>
                                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.0.0/lodash.min.js"></script>
                                                            <script src="js/components/jquery/jquery-fullscreen/jquery.fullscreen-min.js"></script>
                                                            <script src="js/components/jquery-storage-api/jquery.storageapi.min.js"></script> 
                                                            <script src="js/components/wow/wow.min.js"></script>
                                                            <script src="js/components/common/functions.js"></script>
                                                            <script src="js/components/common/colors.js"></script> 
                                                            <script src="js/components/common/left-sidebar.js"></script> 
                                                            <script src="js/components/common/navbar.js"></script> 
                                                            <script src="js/components/common/horizontal-navigation-1.js"></script> 
                                                            <script src="js/components/common/horizontal-navigation-2.js"></script> 
                                                            <script src="js/components/common/horizontal-navigation-3.js"></script>
                                                            <script src="js/components/common/main.js"></script>
                                                            <script src="js/components/notifyjs/dist/notify.js"></script> 
                                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
                                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script> 
                                                            <script src="js/components/d3/d3.js"></script>
                                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/topojson/1.6.9/topojson.min.js">
                                                            </script> 
                                                            <script src="js/components/common/index.js"></script> 
                                                            <script src="js/components/common/main.js"></script> 
                                                            <script src="js/components/moment/moment.js"></script>
                                                            
                                                            <script src="bower_components/jquery/dist/jquery.js"></script>
	
	<script src="scripts/colors.js"></script>
	<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="scripts/forms-pickers.js"></script>
        
                                                        </body>
                                                        </html>
