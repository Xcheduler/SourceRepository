<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html lang="en" ng-app="loginApp" ng-controller="loginController" data-ng-cloak>
    <%session.invalidate();%>

    <head>
        <meta charset="utf-8">
        <title>Scheduler</title>
        <META Http-Equiv="Cache-Control" Content="no-cache"/>
        <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"/>
        <META HTTP-EQUIV="Expires" CONTENT="0"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0"/>
        <noscript>
        Java Script disabled!!!
        <META HTTP-EQUIV="Refresh" CONTENT="0;URL=disabled.html"/>
        </noscript>
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
    </head>
    <body data-layout="empty-layout" data-palette="palette-0" data-direction="none">
        <div class="fullsize-background-image-1"> <img src="images/backgrounds/bg845.png"> </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="login-page text-center animated fadeIn delay-2000">
                        <h1> Account login </h1>

                        <% if (request.getAttribute("fromLogin") != null) {%>
                        <h4><%= (String) request.getAttribute("fromLogin")%><%} else {%></h4>
                        <h4> Please enter your email address and password to login </h4>
                        <%}%>

                        <div class="row">
                            <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-4">
                                <span class="userNameAlert" style="color: #d9534f; text-align: center; font-weight: 300;font-size: 13px; line-height: 24px;"></span>
                                <form id="LoginForm" name="LoginForm" method="post" action="LoginAction.do" >
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group floating-labels">
                                                <label for="email">Email</label> <input id="email" autocomplete="off" type="email" name="email" data-ng-model="email" data-ng-blur="checkEmailExist()"/> 

                                               <!-- <p class="error-block"></p>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-b-40">
                                        <div class="col-xs-12">
                                            <div class="form-group floating-labels">
                                                <label for="password">Password</label> <input id="password" autocomplete="off" type="password" name="password" onblur="myFunction()"> 
                                                 <!-- <p class="error-block"></p>-->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row buttons">
                                        <div class="col-xs-12 col-md-6"> <input type="button" class="btn-login btn btn-lg btn-info btn-block m-b-20" value="Login" > </div>
                                        <div class="col-xs-12 col-md-6"> <a href="/scheduler/Register.do" class="btn btn-lg btn-danger btn-block m-b-20">Register</a> </div>
                                        <!--<div class="col-xs-12 col-md-6"> <a href="/scheduler/forgotpassword.do"> Forget Password </a>  </div>-->
                                        <a href="/scheduler/forgotpassword.do" style="color: rgb(0,255,0)"><font color="FF00CC">Forget Password</font></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <p class="social-buttons"> <button type="button" class="btn btn-solid btn-circle btn-facebook btn-lg"><i class="fa fa-facebook"></i> </button> <button type="button" class="btn btn-solid btn-circle btn-twitter btn-lg"><i class="fa fa-twitter"></i> </button> <button type="button" class="btn btn-solid btn-circle btn-google btn-lg"><i class="fa fa-google"></i> </button> </p>
                        <p class="copyright text-sm">&copy; Copyright 2016</p>
                    </div>
                </div>
            </div>
        </div>
        <script>
                    function trim(value) {
                        return LTrim(RTrim(value));
                    }
                    function submitForm() {
                        document.LoginForm.action = "LoginAction.do";
                        document.getElementById('email').focus();
                        document.LoginForm.method = "POST";
                        document.LoginForm.submit();
                    }

        </script>
        <!-- global scripts --> 
        <script src="js/components/jquery/jquery.js"></script> 
        <script src="js/components/tether/tether.js"></script>
        <script src="js/components/bootstrap/bootstrap.js"></script> 
        <script src="js/components/pace/pace.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.0.0/lodash.min.js"></script>
        <script src="js/components/jquery/jquery-fullscreen/jquery.fullscreen-min.js"></script>
        <script src="js/components/jquery/jquery.storageapi.min.js"></script>
        <script src="js/components/wow/wow.min.js"></script>
        <script src="js/components/common/functions.js"></script> 
        <script src="js/components/common/colors.js"></script> 
        <script src="js/components/common/left-sidebar.js"></script>
        <script src="js/components/common/navbar.js"></script> 
        <script src="js/components/common/horizontal-navigation-1.js"></script>
        <script src="js/components/common/horizontal-navigation-2.js"></script> 
        <script src="js/components/common/horizontal-navigation-3.js"></script> 
        <script src="js/components/common/main.js"></script> 
        <script src="js/components/common/floating-labels.js"></script>
        <script src="js/loginController.js"></script> 
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="loginRegistration/scripts/controllers/loginController.js"></script> 
        <script src="loginRegistration/scripts/services/pcLoginService.js"></script> 
    </body>
</html>
