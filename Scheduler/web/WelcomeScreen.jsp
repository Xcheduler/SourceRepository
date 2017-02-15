<%@page contentType="text/html" language="java" import="net.ecom.common.Validation,net.ecom.vo.*,java.util.ArrayList,java.util.List" errorPage="" %>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
            String strUserName = "";
            strUserName = (String) session.getAttribute("SESSION_USERNAME");
            strUserName = (strUserName != null && (!"".equalsIgnoreCase(strUserName))) ? strUserName.trim() : "";
%>
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
        <META HTTP-EQUIV="Expires" CONTENT="0">
        <title>Login - E-Commerce Home page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="eCommerce Page">
        <link rel="stylesheet" href="css/tables.css">
        <link href='css/fontfaces.css' rel='stylesheet' type='text/css'>
        <script src="js/new/jquery-1.7.2.js"></script>
        <script src="js/new/jquery-ui-1.8.17.min.js"></script>
        <script type="text/javascript" src="js/ecomScript.js"></script>


        <script src="js/new/global.js"></script>

        <script src="js/new/jquery.dataTables.min.js"></script>
        <!--
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>-->

    </head>
    <style>
        fieldset {
            border:2px solid #888;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            padding:1em;
        }
        legend {

        }
    </style>
    <script>
        $(document).ready( function(){

            var datFormat =trim(document.getElementById("txtdateFormat").value)
            $("#frdateport").datepicker(
            {dateFormat:datFormat}
        );
            $("#todateport").datepicker(
            {dateFormat:datFormat}
        );
        });

        /*
         * Created By : S.Gnanamoorthi
         * Date   : 25/05/2013
         * Purpose : Design Changes for ViewBooking Details on the Dialog
         */
        function getXmlHttpRequestObject() {
            if (window.XMLHttpRequest) {
                return new XMLHttpRequest();
            } else if(window.ActiveXObject) {
                return new ActiveXObject("Microsoft.XMLHTTP");
            }
            else {
                alert("Your Browser doesnt support ajax!\nIt's about time to upgrade don't you think?");
            }
        }
        function popUpWindow(URLStr, left, top, width, height)
        {
            $( "#detBookviewDIV" ).dialog({
                autoOpen: false,
                resizable: false,
                width: '900px',
                height: '500',
                modal: true
            });
            document.getElementById("detBookviewDIV").innerHTML ="";


            var xt1="<div id='processLoad_ebookingView' style='display:none;top:310px;left:450px;position:fixed;border:1px solid #003366; background-color:#FFFFFF;'>";
            var xt2=" <table cellpadding='0' cellspacing='0'  width='200px' height='50px'>";
            var xt3="<tr><td><img src='images/progress2.gif' align='absmiddle'></td></tr></table></div>";
            var xt=xt1+xt2+xt3;
            document.getElementById("detBookviewDIV").innerHTML =xt;
            document.getElementById('processLoad_ebookingView').style.display='block';
            $( "#detBookviewDIV" ).dialog( "open" );setDetailViewdialog(URLStr);
            return false;

        }
        var searchReq2= getXmlHttpRequestObject();
        function setDetailViewdialog(URLStr)
        {


            var styleStr = 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=800,height=300,left=100, top=200';
            searchReq2.open("POST", URLStr, true);
            searchReq2.onreadystatechange = setDetailRoot;
            searchReq2.send(URLStr, 'popUpWin', styleStr);
        }


        function setDetailRoot() {
            if (searchReq2.readyState == 4) {
                if (searchReq2.status == 200) {

                    document.getElementById("detBookviewDIV").innerHTML =searchReq2.responseText;
                    document.getElementById('processLoad_ebookingView').style.display='none';
                }
            }
        }
        /*
         * Created By : A.J.Durkga Devi
         * Date   : 29/03/2011
         * Purpose : to get the records within the particular from  date and to date
         */
        function searchRequest()
        {
            if (searchReq2.readyState == 0 || searchReq2.readyState == 4)
            {

                var from_date=trim(document.forms[0].frdateport.value);
                var to_date=trim(document.forms[0].todateport.value);
                fromDate=new Date(from_date);
                toDate=new Date(to_date);
                if(from_date=="")
                {
                    alert("Please Select From Date");
                    return false;
                }
                if(to_date=="")
                {
                    alert("Please Select To Date");
                    return false;
                }
                if(fromDate.getTime()>toDate.getTime())
                {
                    alert("From date should not greater than To Date");
                    document.forms[0].frdateport.value="";
                    document.forms[0].todateport.value=""
                    return false;
                }
                document.getElementById('processLoad_ebookingView').style.display="block";
                searchReq2.open("POST", "AjaxRequestDateRecords.do", true);
                searchReq2.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
                var params = "type=search"+"&fromdate="+from_date+"&todate="+to_date;

                searchReq2.onreadystatechange=getListRequest;
                searchReq2.send(params);
            }
        }
        /*
         * Created By : A.J.Durkga Devi
         * Date   : 29/03/2011
         * Purpose : to get the records
         */
        function getListRequest()
        {
            if (searchReq2.readyState == 4) {


                if (searchReq2.status == 200) {
                    var result=searchReq2.responseText;

                    var reqdiv=document.getElementById("requestdiv");


                    reqdiv.innerHTML = result;

                    callTableProp();

                    document.getElementById('processLoad_ebookingView').style.display="none";
                }
            }
        }
    </script>

    <body leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0" onLoad="preloader();" ondrop="return false;">


        <%

                    String bookno = "";
                    String originport = "";
                    String deliveryport = "";
                    String loadport = "";
                    String dischargeport = "";
                    String trust_action_no = "";

                    String status = "";
                    String crdate = "";
                    String LRPStatus = "";
                    String action = "";
                    String cruser = "";
                    String trColor = "";
                    String Subdate = "";
                    ArrayList book = (ArrayList) session.getAttribute("BookingView");

                    EbookingViewAll eBooking = null;
        %>

        <div  class ="content container_12">
            <fieldset>
                <legend><img src="img/nav/book b.PNG" align="center" />EBooking View</legend>




                <div class="box grid_12" id="requestdiv" >
                    <div class="box-head"><h2>EBooking View</h2></div>
                    <div class="box-content no-pad" style="min-height: 0px; display: block;" id="requestdiv">

                        <table class="display" id="example" >
                            <thead>
                                <tr>
                                    <th><bean:message key="EBookingView.trustbookkno" ></bean:message></th>
                                    <th><bean:message key="EBookingView.bookno" ></bean:message></th>
                                    <th><bean:message key="EBookingView.origin" ></bean:message></th>
                                    <th><bean:message key="EBookingView.delivery" ></bean:message></th>
                                    <th><bean:message key="EBookingView.crdate" ></bean:message></th>
                                    <th><bean:message key="EBookingView.submitdate" ></bean:message></th>
                                    <th><bean:message key="EBookingView.crusername" ></bean:message></th>
                                    <th>Status</th>
                                    <th><bean:message key="EBookingView.action"  ></bean:message></th>
                                </tr>
                            </thead>
                            <tbody >

                                <%
                                            if (book != null && (!book.isEmpty())) {
                                                int size = book.size();
                                                String strStyleName = "";
                                                for (int i = 0; i < size; i++) {
                                                    trColor = "";
                                                    eBooking = (EbookingViewAll) book.get(i);
                                                    trust_action_no = eBooking.getTrust_action();
                                                    trust_action_no = (trust_action_no != null && (!"".equalsIgnoreCase(trust_action_no))) ? trust_action_no.trim() : "N/A";
                                                    bookno = eBooking.getBookNo();
                                                    originport = eBooking.getOriginPortText();
                                                    deliveryport = eBooking.getFinalPortText();
                                                    loadport = eBooking.getLoadPortText();
                                                    dischargeport = eBooking.getDischargePortText();
                                                    cruser = eBooking.getCruser();
                                                    status = eBooking.getStatus_desc();
                                                    crdate = eBooking.getCrdate();
                                                    Subdate = eBooking.getSubmitdate();
                                                    if (Subdate != null) {
                                                        Subdate = eBooking.getSubmitdate();
                                                    } else {
                                                        Subdate = "-";
                                                    }
                                                    LRPStatus = "";
                                                    if (eBooking.getLrpstatus() == null) {
                                                    } else {
                                                        LRPStatus = eBooking.getLrpstatus();
                                                    }
                                                    if ("C".equalsIgnoreCase(LRPStatus)) {
                                                        LRPStatus = "Confirmed";
                                                    } else if ("E".equalsIgnoreCase(LRPStatus)) {
                                                        cruser = "-";
                                                        Subdate = "-";
                                                        LRPStatus = "Draft";
                                                    } else if ("DD".equalsIgnoreCase(LRPStatus)) {
                                                        LRPStatus = "Declined";
                                                        trColor = "orange";
                                                    } else if ("P".equalsIgnoreCase(LRPStatus)) {
                                                        LRPStatus = "Accepted";
                                                    } else if ("D".equalsIgnoreCase(LRPStatus)) {
                                                        LRPStatus = "Sent To Agency";
                                                    }

                                                    action = eBooking.getAction();

                                                    if (i % 2 == 0) {
                                                        strStyleName = "even";
                                                    } else {
                                                        strStyleName = "odd";
                                                    }


                                %>


                                <tr class="<%=strStyleName%>" >

                                    <td class="  sorting_1"><font color="<%=trColor%>"><%=trust_action_no%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=bookno%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=originport%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=deliveryport%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=crdate%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=Subdate%></font></td>
                                    <td class=" "><font color="<%=trColor%>"><%=cruser%></font></td>
                                    <td class=""><font color="<%=trColor%>"><%=LRPStatus%></font></td>
                                    <td class="center "><font color="<%=trColor%>"><%=action%></font></td>

                                    <%}
                                                }%>
                                </tr></tbody></table>
                        <div class="clear"></div>
                    </div>
                </div>




            </fieldset>
        </div>


        <div id="detBookviewDIV"  title="Booking">

        </div>


        <script>

            $(document).ready(function(){

                $('#example').dataTable( {
                    "bJQueryUI": true
                });
                $("#frdateport").datepicker();


                $("#todateport").datepicker();

            });
            function newBooking(){
            <%
                        session.setAttribute("BookingRequestType", "NewBooking");
            %>

                    document.EBookingViewAllForm.submit();



                }

                function callTableProp(){
                    $('#example').dataTable( {
                        "bJQueryUI": true
                    });
                }

        </script>

        <div id="processLoad_ebookingView" style="display:none;top:10px;left:450px;position:fixed;border:1px solid #003366; background-color:#FFFFFF;">
            <table cellpadding="0" cellspacing="0"  width="200px" height="50px">
                <tr>
                    <td><img src="images/progress2.gif" align="absmiddle"></td>
                </tr>

            </table>
        </div>



    </body>
</html>



