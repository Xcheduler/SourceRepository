<%-- 
    Document   : Top
    Created on : 18 Sep, 2016, 4:51:16 PM
    Author     : sasi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
      <nav class="navbar navbar-fixed-top navbar-1">
         <a class="navbar-brand" href="index.html">Xchedule</a> 
         <ul class="nav navbar-nav pull-left toggle-layout">
            <li class="nav-item"> <a class="nav-link" data-click="toggle-layout"> <i class="zmdi zmdi-menu"></i> </a> </li>
         </ul>
         <ul class="nav navbar-nav pull-left toggle-fullscreen-mode">
            <li class="nav-item"> <a class="nav-link" data-click="toggle-fullscreen-mode"> <i class="zmdi zmdi-fullscreen"></i> </a> </li>
         </ul>
         <!--<ul class="nav navbar-nav pull-left navbar-dropdown">
            <li class="nav-item dropdown mega-dropdown">
               <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown"> <i class="fa fa-plus"></i> <span class="nav-link-text">Navigation</span> </a> 
               <div class="dropdown-menu mega-menu-1 dropdown-menu-scale from-left">
                  <div>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="view-dashboard md-icon pull-left"></i> <span>Dashboards</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="dashboards-analytics.html"> <span>Analytics</span> </a> </li>
                              <li> <a href="dashboards-e-commerce.html"> <span>e-Commerce</span> </a> </li>
                              <li> <a href="dashboards-finance.html"> <span>Finance</span> </a> </li>
                              <li> <a href="dashboards-saas.html"> <span>SAAS</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="collection-image-o md-icon pull-left"></i> <span>Layouts</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a data-id="default-sidebar" data-click="set-layout"> <span>Default sidebar</span> </a> </li>
                              <li> <a data-id="collapsed-sidebar" data-click="set-layout"> <span>Collapsed sidebar</span> </a> </li>
                              <li> <a data-id="off-canvas" data-click="set-layout"> <span>Off canvas</span> </a> </li>
                              <li> <a data-id="left-sidebar-over" data-click="set-layout"> <span>Left sidebar over</span> </a> </li>
                              <li> <a data-id="left-sidebar-under" data-click="set-layout"> <span>Left sidebar under</span> </a> </li>
                              <li> <a data-id="horizontal-navigation-1" data-click="set-layout"> <span>Horizontal navigation 1</span> </a> </li>
                              <li> <a data-id="horizontal-navigation-2" data-click="set-layout"> <span>Horizontal navigation 2</span> </a> </li>
                              <li> <a data-id="horizontal-navigation-3" data-click="set-layout"> <span>Horizontal navigation 3</span> </a> </li>
                              <li> <a data-id="mega-menu" data-click="set-layout"> <span>Mega menu</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="star-circle md-icon pull-left"></i> <span>Widgets</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="widgets-activity-widgets.html"> <span>Activity widgets</span> </a> </li>
                              <li> <a href="widgets-chart-widgets.html"> <span>Chart widgets</span> </a> </li>
                              <li> <a href="widgets-social-media-widgets.html"> <span>Social Media widgets</span> </a> </li>
                              <li> <a href="widgets-text-widgets.html"> <span>Text widgets</span> </a> </li>
                              <li> <a href="widgets-user-widgets.html"> <span>User widgets</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="labels md-icon pull-left"></i> <span>UI</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="ui-elements-timers-and-counters.html"> <span>Timers and counters</span> </a> </li>
                              <li> <a href="ui-elements-images.html"> <span>Images</span> </a> </li>
                              <li> <a href="ui-elements-overlays.html"> <span>Overlays</span> </a> </li>
                              <li> <a href="ui-elements-lists.html"> <span>Lists</span> </a> </li>
                              <li> <a href="ui-elements-typography.html"> <span>Typography</span> </a> </li>
                              <li> <a href="ui-elements-buttons.html"> <span>Buttons</span> </a> </li>
                              <li> <a href="ui-elements-labels.html"> <span>Labels</span> </a> </li>
                              <li> <a href="ui-elements-progress-bars.html"> <span>Progress Bars</span> </a> </li>
                              <li> <a href="ui-elements-carousel.html"> <span>Carousel</span> </a> </li>
                              <li> <a href="ui-elements-tabs.html"> <span>Tabs</span> </a> </li>
                              <li> <a href="ui-elements-grid.html"> <span>Grid</span> </a> </li>
                              <li> <a href="ui-elements-alerts-and-notifications.html"> <span>Alerts &amp; notifications</span> </a> </li>
                              <li> <a href="ui-elements-animations.html"> <span>Animations</span> </a> </li>
                              <li> <a href="ui-elements-breadcrumbs.html"> <span>Breadcrumbs</span> </a> </li>
                              <li> <a href="ui-elements-google-maps.html"> <span>Google Maps</span> </a> </li>
                              <li> <a href="ui-elements-vector-maps.html"> <span>Vector Maps</span> </a> </li>
                              <li> <a href="ui-elements-cards.html"> <span>Cards</span> </a> </li>
                              <li> <a href="ui-elements-dropdowns.html"> <span>Dropdowns</span> </a> </li>
                              <li> <a href="ui-elements-drag-and-drop.html"> <span>Drag and drop</span> </a> </li>
                              <li> <a href="ui-elements-modals.html"> <span>Modals</span> </a> </li>
                              <li> <a href="ui-elements-other-elements.html"> <span>Other elements</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="settings md-icon pull-left"></i> <span>Utilities</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="utilities-color-utilities.html"> <span>Color utilities</span> </a> </li>
                              <li> <a href="utilities-border-utilities.html"> <span>Border utilities</span> </a> </li>
                              <li> <a href="utilities-height-utilities.html"> <span>Height utilities</span> </a> </li>
                              <li> <a href="utilities-margin-utilities.html"> <span>Margin Utilities</span> </a> </li>
                              <li> <a href="utilities-other-utilities.html"> <span>Other utilities</span> </a> </li>
                              <li> <a href="utilities-padding-utilities.html"> <span>Padding utilities</span> </a> </li>
                              <li> <a href="utilities-position-utilities.html"> <span>Position utilities</span> </a> </li>
                              <li> <a href="utilities-text-utilities.html"> <span>Text utilities</span> </a> </li>
                              <li> <a href="utilities-width-utilities.html"> <span>Width utilities</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="flash md-icon pull-left"></i> <span>Icons</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="icons-font-awesome.html"> <span>Font Awesome</span> </a> </li>
                              <li> <a href="icons-ionicons.html"> <span>Ionicons</span> </a> </li>
                              <li> <a href="icons-emoji.html"> <span>Emoji</span> </a> </li>
                              <li> <a href="icons-flags.html"> <span>Flags</span> </a> </li>
                              <li> <a href="icons-material-design-icons.html"> <span>Material Design Icons</span> </a> </li>
                              <li> <a href="icons-weather-icons.html"> <span>Weather Icons</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="folder-outline md-icon pull-left"></i> <span>Forms</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="forms-basic.html"> <span>Basic forms</span> </a> </li>
                              <li> <a href="forms-sample.html"> <span>Sample forms</span> </a> </li>
                              <li> <a href="forms-validation.html"> <span>Form Validation</span> </a> </li>
                              <li> <a href="forms-jquery-file-upload.html"> <span>jQuery File Upload</span> </a> </li>
                              <li> <a href="forms-text-editor.html"> <span>Text editor</span> </a> </li>
                              <li> <a href="forms-pickers.html"> <span>Pickers</span> </a> </li>
                              <li> <a href="forms-nouislider.html"> <span>NoUiSlider</span> </a> </li>
                              <li> <a href="forms-typeahead.html"> <span>Typeahead</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="format-list-numbered md-icon pull-left"></i> <span>Tables</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="tables-static.html"> <span>Static Tables</span> </a> </li>
                              <li> <a href="tables-datatable.html"> <span>Datatable</span> </a> </li>
                              <li> <a href="tables-sortable.html"> <span>Sortable</span> </a> </li>
                              <li> <a href="tables-table-export.html"> <span>Table export</span> </a> </li>
                              <li> <a href="tables-jquery-treegrid.html"> <span>jQuery Treegrid</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="shopping-cart md-icon pull-left"></i> <span>e-Commerce</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="e-commerce-dashboard.html"> <span>Dashboard</span> </a> </li>
                              <li> <a href="http://localhost:9002/e-commerce-order.htmls"> <span>Orders</span> </a> </li>
                              <li> <a href="e-commerce-order.html"> <span>Order</span> </a> </li>
                              <li> <a href="http://localhost:9002/e-commerce-product.htmls"> <span>Products</span> </a> </li>
                              <li> <a href="e-commerce-product.html"> <span>Product</span> </a> </li>
                              <li> <a href="e-commerce-customers.html"> <span>Customers</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="email-open md-icon pull-left"></i> <span>Email</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="email-inbox.html"> <span>Inbox</span> </a> </li>
                              <li> <a href="email-view.html"> <span>View email</span> </a> </li>
                              <li> <a href="email-compose.html"> <span>Compose email</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="chart md-icon pull-left"></i> <span>Charts</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="charts-nvd3.html"> <span>NVD3</span> </a> </li>
                              <li> <a href="charts-chartist.html"> <span>Chartist</span> </a> </li>
                              <li> <a href="charts-chart-js.html"> <span>Chart.js</span> </a> </li>
                              <li> <a href="charts-easy-pie-chart.html"> <span>Easy Pie Chart</span> </a> </li>
                              <li> <a href="charts-jquery-knob.html"> <span>jQuery Knob</span> </a> </li>
                              <li> <a href="charts-gauge.html"> <span>Gauges</span> </a> </li>
                              <li> <a href="charts-morris-js.html"> <span>Morris.js</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="file-text md-icon pull-left"></i> <span>Pages</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="pages-error-page.html"> <span>Error page</span> </a> </li>
                              <li> <a href="pages-empty-page.html"> <span>Empty Page</span> </a> </li>
                              <li> <a href="pages-login.html"> <span>Login</span> </a> </li>
                              <li> <a href="pages-register.html"> <span>Register</span> </a> </li>
                              <li> <a href="pages-forgot-password.html"> <span>Forgot Password</span> </a> </li>
                              <li> <a href="pages-lock-screen.html"> <span>Lock Screen</span> </a> </li>
                              <li> <a href="pages-profile.html"> <span>User profile</span> </a> </li>
                              <li> <a href="pages-coming-soon.html"> <span>Coming soon</span> </a> </li>
                              <li> <a href="pages-under-maintenance.html"> <span>Under maintenance</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                     <ul class="list-unstyled">
                        <li>
                           <a class="title"> <i class="lamp md-icon pull-left"></i> <span>Extras</span> </a> 
                           <ul class="list-unstyled">
                              <li> <a href="extras-invoice.html"> <span>Invoice</span> </a> </li>
                              <li> <a href="extras-zoom.html"> <span>Zoom</span> </a> </li>
                              <li> <a href="extras-search-results.html"> <span>Search Results</span> </a> </li>
                              <li> <a href="extras-pricing-tables.html"> <span>Pricing tables</span> </a> </li>
                              <li> <a href="extras-wow.html"> <span>Wow</span> </a> </li>
                              <li> <a href="extras-syntax-highlighting.html"> <span>Syntax highlighting</span> </a> </li>
                              <li> <a href="extras-calendar.html"> <span>Calendar</span> </a> </li>
                              <li> <a href="extras-crop.html"> <span>Image cropping</span> </a> </li>
                              <li> <a href="extras-mousetrap.html"> <span>Mousetrap</span> </a> </li>
                              <li> <a href="extras-typed.html"> <span>Typed.js</span> </a> </li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div>
                     <ul class="list-unstyled">
                        <li> <a class="title" href="documentation.html"> <i class="info-outline md-icon pull-left"></i> <span>Docs</span> </a> </li>
                     </ul>
                  </div>
               </div>
            </li>
         </ul>-->
         <ul class="nav navbar-nav pull-left toggle-search">
            <li class="nav-item"> <a class="nav-link" data-click="toggle-search"> <i class="zmdi zmdi-search"></i> </a> </li>
         </ul>
         <!--<div class="navbar-drawer pull-left hidden-lg-down">
            <form class="form-inline navbar-form"> <input class="form-control" type="text" placeholder="Search"> </form>
         </div>-->
         <!--<ul class="nav navbar-nav pull-right hidden-lg-down navbar-toggle-theme-selector">
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown"> <i class="zmdi zmdi-settings"></i> </a> 
            <div class="dropdown-menu dropdown-menu-scale from-right dropdown-menu-right"> <a class="dropdown-item animated fadeIn" href="email-inbox.html"> <i class="zmdi zmdi-email"></i> <span class="label label-pill label-danger label-xs pull-right">New</span> <span class="dropdown-text">Inbox</span> </a> <a class="dropdown-item animated fadeIn" href="pages-profile.html"> <i class="zmdi zmdi-settings-square"></i> <span class="dropdown-text">Profile</span> </a> <a class="dropdown-item animated fadeIn" href="pages-lock-screen.html"> <i class="zmdi zmdi-alarm"></i> <span class="dropdown-text">Lock screen</span> </a> <a class="dropdown-item animated fadeIn" href="/scheduler"> <i class="zmdi zmdi-power"></i> <span class="dropdown-text">Logout</span> </a> </div>
            </li>
         </ul>-->
         <!--<ul class="nav navbar-nav pull-right hidden-lg-down navbar-flags">
            <li class="nav-item dropdown dropdown-menu-right">
               <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown"> <span class="flag flag-icon flag-icon-gb"></span> </a> 
               <div class="dropdown-menu dropdown-menu-scale from-right dropdown-menu-right"> <a class="dropdown-item"> <span class="flag flag-icon flag-icon-gb"></span> <span class="title">English</span> </a> <a class="dropdown-item"> <span class="flag flag-icon flag-icon-de"></span> <span class="title">German</span> </a> <a class="dropdown-item"> <span class="flag flag-icon flag-icon-es"></span> <span class="title">Spanish</span> </a> <a class="dropdown-item"> <span class="flag flag-icon flag-icon-fr"></span> <span class="title">French</span> </a> </div>
            </li>
         </ul>-->
         <ul class="nav navbar-nav pull-right hidden-lg-down navbar-notifications">
            <li class="nav-item"> <a class="nav-link" data-click="toggle-right-sidebar"> <i class="zmdi zmdi-notifications-active"></i> <span class="label label-rounded label-danger label-xs">3</span> </a> </li>
         </ul>
         <ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
            <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown"> <img class="img-circle img-fluid profile-image" src="assets/faces/profile.png"> </a> 
               <div class="dropdown-menu dropdown-menu-scale from-right dropdown-menu-right"> <a class="dropdown-item animated fadeIn" href="email-inbox.html"> <i class="zmdi zmdi-email"></i> <span class="label label-pill label-danger label-xs pull-right">New</span> <span class="dropdown-text">Inbox</span> </a> <a class="dropdown-item animated fadeIn" href="pages-profile.html"> <i class="zmdi zmdi-settings-square"></i> <span class="dropdown-text">Profile</span> </a> <a class="dropdown-item animated fadeIn" href="pages-lock-screen.html"> <i class="zmdi zmdi-alarm"></i> <span class="dropdown-text">Lock screen</span> </a> <a class="dropdown-item animated fadeIn" href="/scheduler"> <i class="zmdi zmdi-power"></i> <span class="dropdown-text">Logout</span> </a> </div>
            </li>
         </ul>
         <ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
            <li class="nav-item"> <a class="nav-link direction" data-click="toggle-direction">RTL</a> </li>
         </ul>
         <ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
             <li class="nav-item"> <a class="nav-link" href="#">Expiry Date : <%=session.getAttribute("ExpiryDate")%></a> </li>
         </ul>
      </nav>
      
      