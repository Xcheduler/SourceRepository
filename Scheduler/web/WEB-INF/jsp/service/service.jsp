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
          String serviceName = "";
          String serviceDesc = "";
          String serviceCost = "";
          String serviceHour = "";
          String serviceBuffer = "";
         //out.print(">>>>>>>>>eeeee>>>>>"+request.getAttribute("customerList")+">>>>>>>"+request.getAttribute("showList"));
          if(request.getAttribute("showList")!=null)
          {
              showList = true;
             
          }
         // out.println("hhhhhhhhhhhh>>>>>>>>>"+request.getAttribute("editForm"));
          if(request.getAttribute("editForm")!=null)
          {
             if(request.getAttribute("serviceName")!=null)
              serviceName = request.getAttribute("serviceName").toString();
             if(request.getAttribute("serviceDesc")!=null)
                 serviceDesc = request.getAttribute("serviceDesc").toString();
             if(request.getAttribute("serviceCost")!=null)
                 serviceCost = request.getAttribute("serviceCost").toString();
             if(request.getAttribute("serviceHour")!=null)
                 serviceHour = request.getAttribute("serviceHour").toString();
             if(request.getAttribute("serviceBuffer")!=null)
                 serviceBuffer = request.getAttribute("serviceBuffer").toString();
              editForm = true;
          }
      %>
          <%if(!showList && !editForm){%>
      
	<table width="100%" border="0" align="center">
	<tr>
	<td align="center">
	<h3>No Service Added</h3>
	</td>
	</tr>
	<tr>
	<td align="center">
	<button type="button" class="btn btn-primary" onclick="javascript:addService();">Add Service</button>
	</td>
	</tr>
	</table>
          <%}%>
 <!-- Show the cropped image in modal -->
 <div id="addServiceDiv" style="display:none;">
 <form name="addServices" action="/scheduler/services.do?execute=addServices" method="POST">
		
                      <div class="modal fade docs-cropped" id="getServiceModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Add Service</h4>
                            </div>
                            <div class="modal-body">
				<table width="100%" border="0" class="form-horizontal form-label-left form_label">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Sevice Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="serviceName" class="form-control" placeholder="i.e Govindh">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Description</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="serviceDesc" class="form-control" placeholder="Description">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Cost</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="serviceCost" class="form-control" placeholder="0.00">
				</td>
				</tr>
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Hour</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="serviceHour" class="form-control" placeholder="+91-9788168770">
				</td>
				</tr>
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Buffer</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="serviceHour" class="form-control" placeholder="+91-9788168770">
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
         <button type="button" class="btn btn-primary" onclick="javascript:addService();">Add Service</button>    
         </td>
     </tr>
 </table>
 <form name="serviceInfo" action="/scheduler/services.do?execute=addServices" method="POST">
     <input type="hidden" id="serviceID"/>
 <table class="table table-hover table-striped table-bordered" cellspacing="0" width="100%">
     <tr>
         
         <th width="30%">Service Name</th>
         <th>Service Description</th>
         <th>Service Cost</th>
         <th>Service Hour</th>
         <th>Service Buffer</th>
                 
     </tr>
 <c:forEach var="row" items="${serviceList}">
     <tr> 
              
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getServiceInfo('${row.SER_ID}','${row.SERVICE_NAME}','${row.SERVICE_DESC}','${row.SERVICE_COST}','${row.SERVICE_HOUR}','${row.SERVICE_BUFFER}');"><c:out value="${row.SERVICE_NAME}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getServiceInfo('${row.SER_ID}','${row.SERVICE_NAME}','${row.SERVICE_DESC}','${row.SERVICE_COST}','${row.SERVICE_HOUR}','${row.SERVICE_BUFFER}');"><c:out value="${row.SERVICE_DESC}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getServiceInfo('${row.SER_ID}','${row.SERVICE_NAME}','${row.SERVICE_DESC}','${row.SERVICE_COST}','${row.SERVICE_HOUR}','${row.SERVICE_BUFFER}');"><c:out value="${row.SERVICE_COST}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getServiceInfo('${row.SER_ID}','${row.SERVICE_NAME}','${row.SERVICE_DESC}','${row.SERVICE_COST}','${row.SERVICE_HOUR}','${row.SERVICE_BUFFER}');"><c:out value="${row.SERVICE_HOUR}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getServiceInfo('${row.SER_ID}','${row.SERVICE_NAME}','${row.SERVICE_DESC}','${row.SERVICE_COST}','${row.SERVICE_HOUR}','${row.SERVICE_BUFFER}');"><c:out value="${row.SERVICE_BUFFER}"/></a></td>
     </a>
     </tr>
</c:forEach>
    
</table>
 </form>
<%}%>

<div id="editServiceDiv" style="display:none;">
 <form name="editService" action="/scheduler/services.do?execute=updateServiceInfo" method="POST">
                    <input type="hidden" id="serviceId" name="serviceId" value=""/>
                    <input type="hidden" id="action" name="action" value="update">
                      <div class="modal fade docs-cropped" id="getCroppedCanvasModal1" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Edit Service</h4>
                            </div>
                            <div class="modal-body">
				<table width="100%" border="0" class="form-horizontal form-label-left form_label">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Sevice Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="serviceName" name="serviceName" class="form-control" placeholder="i.e Govindh">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Description</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="serviceDesc" name="serviceDesc" class="form-control" placeholder="Description">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Cost</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="serviceCost" name="serviceCost" class="form-control" placeholder="0.00">
				</td>
				</tr>
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Hour</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="serviceHour" name="serviceHour" class="form-control" placeholder="0">
				</td>
				</tr>
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Service Buffer</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="serviceBuffer" name="serviceBuffer" class="form-control" placeholder="0">
				</td>
				</tr>
				</table>
			    </div>
                            <div class="modal-footer">
                              <button onclick="javascript:deleteService();" type="button" class="btn btn-danger">Delete</button>
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