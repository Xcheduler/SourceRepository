<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<div class="sidebar-outer-wrapper">
    <div class="sidebar-inner-wrapper">
        <div class="sidebar-1">
            <div class="profile">
                <button data-click="toggle-sidebar" type="button" class="btn btn-white btn-outline no-border close-sidebar"> <i class="fa fa-close"></i> </button> 
                <div class="profile-image"> <img class="img-circle img-fluid" src="assets/faces/profile.png"> </div>
                <!--
                                        <div class="social-media"> <button type="button" class="btn btn-facebook btn-circle m-r-5"><i class="fa fa-facebook color-white"></i> </button> <button type="button" class="btn btn-twitter btn-circle m-r-5"><i class="fa fa-twitter color-white"></i> </button> <button type="button" class="btn btn-google btn-circle m-r-5"><i class="fa fa-google color-white"></i> </button> </div>
                <div class="profile-toggle"> <button data-click="toggle-profile" type="button" class="btn btn-white btn-outline no-border"> <i class="pull-right fa fa-caret-down icon-toggle-profile"></i> </button> </div>
                -->
                
                <div class="profile-title">Welcome <%=session.getAttribute("User")%></div>
                <div class="profile-subtitle"><%=session.getAttribute("Email")%></div>
            </div>
            <div class="sidebar-nav">
                <div class="sidebar-section account-links">
                    <div class="section-title">Account</div>
                    <ul class="list-unstyled section-content">
                        <li> <a class="sideline"> <i class="zmdi zmdi-account-circle md-icon pull-left"></i> <span class="title">Profile</span> </a> </li>
                        <li> <a class="sideline"> <i class="zmdi zmdi-settings md-icon pull-left"></i> <span class="title">Settings</span> </a> </li>
                        <li> <a class="sideline"> <i class="zmdi zmdi-favorite-outline md-icon pull-left"></i> <span class="title">Favorites</span> </a> </li>
                        <li> <a class="sideline"> <i class="zmdi zmdi-sign-in md-icon pull-left"></i> <span class="title">Logout</span> </a> </li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="section-title">Navigation</div>
                    <ul class="l1 list-unstyled section-content">
                        <li>
                            <a class="sideline" data-id="ui" data-click="toggle-section" onclick="javascript:MenuFun('dashboard');"> <i class="pull-right fa fa-caret-down icon-ui"></i> <i class="zmdi zmdi-labels md-icon pull-left"></i> <span class="title">Dashboard</span> </a> 

                        </li>
                    </ul>
                    <ul class="l1 list-unstyled section-content">
                        <li>
                            <a class="sideline" data-id="utilities" data-click="toggle-section" onclick="javascript:MenuFun('calender');"> <i class="pull-right fa fa-caret-down icon-utilities"></i> <i class="zmdi zmdi-settings md-icon pull-left"></i> <span class="title">Calendar</span> </a> 

                        </li>
                    </ul>

                    <ul class="l1 list-unstyled section-content">
                        <li>
                            <a class="sideline" data-id="utilities" data-click="toggle-section" onclick="javascript:MenuFun('customers');"> <i class="pull-right fa fa-caret-down icon-utilities"></i> <i class="zmdi zmdi-settings md-icon pull-left"></i> <span class="title">Customer</span> </a> 

                        </li>
                    </ul>

                    <ul class="l1 list-unstyled section-content">
                        <li>
                            <a class="sideline" data-id="icons" data-click="toggle-section" > <i class="pull-right fa fa-caret-down icon-icons"></i> <i class="zmdi zmdi-flash md-icon pull-left"></i> <span class="title">Profile</span> </a> 
                            <ul class="list-unstyled section-icons l2">
                                <li> <a class="sideline" onclick="javascript:MenuFun('booking');"> <span class="title">Your Booking Page</span> </a> </li>
                                <li> <a class="sideline" href="icons-ionicons.html"> <span class="title">Your Website</span> </a> </li>
                                <li> <a class="sideline" href="icons-emoji.html"> <span class="title">Your Customer Reviews</span> </a> </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="l1 list-unstyled section-content">
                        <li>
                            <a class="sideline" data-id="forms" data-click="toggle-section"> <i class="pull-right fa fa-caret-down icon-forms"></i> <i class="zmdi zmdi-folder-outline md-icon pull-left"></i> <span class="title">Settings</span> </a> 
                            <ul class="list-unstyled section-forms l2">
                                <li> <a class="sideline" onclick="javascript:MenuFun('staffs');"> <span class="title">Staff</span> </a> </li>
                                <li> <a class="sideline" onclick="javascript:MenuFun('services');"> <span class="title">Services</span> </a> </li>
                                <li> <a class="sideline" href="#"> <span class="title">Payments</span> </a> </li>
                                <li> <a class="sideline" href="#"> <span class="title">Classes</span> </a> </li>
                                <li> <a class="sideline" href="#"> <span class="title">Notifications</span> </a> </li>
                                <li> <a class="sideline" href="#"> <span class="title">Account Preferences</span> </a> </li>
                            </ul>
                        </li>
                    </ul>                          

                </div>


                <div class="sidebar-progress">
                    <h5>Project status</h5>
                    <div class="col-xs-8"> <progress class="progress-sm progress progress-warning" value="50" max="100">50%</progress> </div>
                    <div class="col-xs-4"> <span class="number">50%</span> </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function MenuFun(menuValue)
    {
        //alert("mmmm>>>"+menuValue);
        if (menuValue == 'dashboard')
        {
            location.href = "/scheduler/dashboardAction.do";
        }
        if (menuValue == 'calender')
        {
            location.href = "/scheduler/calenderAction.do";
        }
        else if (menuValue == 'customers')
        {
            location.href="/scheduler/customer.do?execute=getCustomers";
        }
        else if (menuValue == 'booking')
        {
            location.href = "/scheduler/profile.do?execute=getProfile";
        }
        else if (menuValue == 'yourwebsite')
        {
        }
        else if (menuValue == 'reviews')
        {
        }
        else if (menuValue == 'staffs')
        {
            location.href = "/scheduler/staff.do?execute=getStaffs";
        }
        else if (menuValue == 'services')
        {
            location.href = "/scheduler/services.do?execute=getService";
        }
        else if (menuValue == 'payments')
        {
            location.href = "/scheduler/payments.do";
        }
        else if (menuValue == 'classes')
        {
            location.href = "/scheduler/classes.do";
        }
        else if (menuValue == 'notifications')
        {
            location.href = "/scheduler/notifications.do";
        }
        else if (menuValue == 'preferences')
        {
            location.href = "/scheduler/preferences.do";
        }
    }
</script>