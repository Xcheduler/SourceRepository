<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Xchedule.com</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="css/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/product.js"></script>
	<style>
	.form_label{
	padding-bottom:7px;
	padding-top:8px;
	text-align:right;   
	}
	</style>
	
  </head>
  <body>
      <%
          boolean showList = false;
          boolean editForm = false;
          String cusName = "";
          String cusEmail = "";
          String cusMobile = "";
         //out.print(">>>>>>>>>eeeee>>>>>"+request.getAttribute("customerList")+">>>>>>>"+request.getAttribute("showList"));
          if(request.getAttribute("showList")!=null)
          {
              showList = true;
             
          }
         // out.println("hhhhhhhhhhhh>>>>>>>>>"+request.getAttribute("editForm"));
          if(request.getAttribute("editForm")!=null)
          {
             if(request.getAttribute("cusName")!=null)
              cusName = request.getAttribute("cusName").toString();
             if(request.getAttribute("cusEmail")!=null)
                 cusEmail = request.getAttribute("cusEmail").toString();
             if(request.getAttribute("custMobile")!=null)
                 cusMobile = request.getAttribute("cusMobile").toString();
              editForm = true;
          }
      %>
          <%if(!showList && !editForm){%>
      
	<table width="100%" border="0" align="center">
	<tr>
	<td align="center">
	<h3>No Customers Added</h3>
	</td>
	</tr>
	<tr>
	<td align="center">
	<button type="button" class="btn btn-primary" onclick="javascript:addCustomer();">Add Customer</button>
	</td>
	</tr>
	</table>
          <%}%>
 <!-- Show the cropped image in modal -->
 <div id="addCustomerDiv" style="display:none;">
 <form name="addCustomers" action="/scheduler/customer.do?execute=addCustomers" method="POST">
		
                      <div class="modal fade" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="small-modalLabel" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Add Customer</h4>
                            </div>
                            <div class="modal-body">
				<table width="100%" border="0" class="form-horizontal form-label-left form_label">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="cusName" class="form-control" placeholder="i.e Govindh">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Email</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="cusEmail" class="form-control" placeholder="i.e govindh.mku@gmail.com">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Phone Number</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="cusMobile" class="form-control" placeholder="+91-9788168770">
				</td>
				</tr>
				</table>
			    </div>
                            <div class="modal-footer">
                              <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                             <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                          </div>
                        </div>
                      </div>
		
		</form>
		</div><!-- /.modal -->
 
 <%if(showList){ %>
 
 <table border="0" width="100%">
     <tr>
         <td align="right">
         <button type="button" class="btn btn-primary" onclick="javascript:addCustomer();">Add Customer</button>    
         </td>
     </tr>
 </table>
 <form name="customerInfo" action="/scheduler/customer.do?execute=addCustomers" method="POST">
     <input type="hidden" id="custID"/>
 <table class="table table-hover table-striped table-bordered" cellspacing="0" width="100%">
     <tr>
         
         <th width="30%">Customer Name</th>
         <th>Email id</th>
         <th>Mobile No</th>
                 
     </tr>
 <c:forEach var="row" items="${customerList}">
     <tr> 
              
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getCustomerInfo('${row.CUSTOMER_ID}','${row.CUSTOMER_NAME}','${row.CUSTOMER_EMAIL}','${row.CUSTOMER_MOBILE}');"><c:out value="${row.CUSTOMER_NAME}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getCustomerInfo('${row.CUSTOMER_ID}','${row.CUSTOMER_NAME}','${row.CUSTOMER_EMAIL}','${row.CUSTOMER_MOBILE}');"><c:out value="${row.CUSTOMER_EMAIL}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getCustomerInfo('${row.CUSTOMER_ID}','${row.CUSTOMER_NAME}','${row.CUSTOMER_EMAIL}','${row.CUSTOMER_MOBILE}');"><c:out value="${row.CUSTOMER_MOBILE}"/></a></td>
     </a>
     </tr>
</c:forEach>
    
</table>
 </form>
<%}%>

 <div id="editCustomerDiv" style="display:none;">
 <form name="editCustomer" action="/scheduler/customer.do?execute=updateCustomerInfo" method="POST">
                    <input type="hidden" id="cusId" name="cusId" value=""/>
                    <input type="hidden" id="action" name="action" value="update">
                      <div class="modal fade" id="getCroppedCanvasModal1" aria-hidden="true" aria-labelledby="small-modalLabel" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Edit Customer</h4>
                            </div>
                            <div class="modal-body">
				<table width="60%">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="cusName" name="cusName" class="form-control" value="">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Email</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="cusEmail" name="cusEmail" class="form-control" value="">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Phone Number</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="cusMobile" name="cusMobile" class="form-control" value="">
				</td>
				</tr>
				</table>
			    </div>
                            <div class="modal-footer">
                              <button onclick="javascript:deleteCustomer();" type="button" class="btn btn-danger">Delete</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                             <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                          </div>
                        </div>
                      </div>
		
		</form>
		</div><!-- /.modal -->
               
  </body>
</html>