<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
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
        <script>
        function myFunction() {
             
         /*  var obj = document.getElementById("staffRole1");
    document.getElementById("demo").innerHTML = 
    obj.options[obj.selectedIndex].text;*/
           
           alert('1');
    document.getElementById("staffRole1").selectedIndex = "Staff";
}
</script>
	
  </head>
  <body>
      <%
          boolean showList = false;
          boolean editForm = false;
          String staffName = "";
          String staffEmail = "";
          String staffMobile = "";
          String staffRole = "";
         //out.print(">>>>>>>>>eeeee>>>>>"+request.getAttribute("customerList")+">>>>>>>"+request.getAttribute("showList"));
          if(request.getAttribute("showList")!=null)
          {
              showList = true;
             
          }
         // out.println("hhhhhhhhhhhh>>>>>>>>>"+request.getAttribute("editForm"));
          if(request.getAttribute("editForm")!=null)
          {
             if(request.getAttribute("staffName")!=null)
              staffName = request.getAttribute("staffName").toString();
             if(request.getAttribute("staffEmail")!=null)
                 staffEmail = request.getAttribute("staffEmail").toString();
             if(request.getAttribute("staffMobile")!=null)
                 staffMobile = request.getAttribute("staffMobile").toString();
             if(request.getAttribute("staffRole")!=null)
                 staffRole = request.getAttribute("staffRole").toString();
              editForm = true;
          }
      %>
          <%if(!showList && !editForm){%>
      
	<table width="100%" border="0" align="center">
	<tr>
	<td align="center">
	<h3>No Staffs Added</h3>
	</td>
	</tr>
	<tr>
	<td align="center">
	<button type="button" class="btn btn-primary" onclick="javascript:addStaff();">Add Staff</button>
	</td>
	</tr>
	</table>
          <%}%>
 <!-- Show the cropped image in modal -->
 <div id="addStaffDiv" style="display:none;">
 <form name="addStaffs" action="/scheduler/staff.do?execute=insertStaff" method="POST">
		
                      <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Add Staff</h4>
                            </div>
                            <div class="modal-body">
				<table width="100%" border="0" class="form-horizontal form-label-left form_label">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="staffName" class="form-control" placeholder="i.e Govindh">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Email</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="staffEmail" class="form-control" placeholder="i.e govindh.mku@gmail.com">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Phone Number</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" name="staffMobile" class="form-control" placeholder="+91-9788168770">
				</td>
				</tr>
                                <!--<tr>
                                    <td>
                                        <div class="dropdown pull-right"> <a class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> open from right </a> <div class="dropdown-menu dropdown-menu-scale from-right"> <a class="dropdown-item">Dropdown item 1</a><a class="dropdown-item">Dropdown item 2</a><a class="dropdown-item">Dropdown item 3</a><a class="dropdown-item">Dropdown item 4</a><a class="dropdown-item">Dropdown item 5</a><a class="dropdown-item">Dropdown item 6</a> </div> </div>
                                     </td>   
                                </tr>-->
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Staff Role</label>
				</td>
				<td style="vertical-align: middle" width="30%">
				<select class="form-control" name="staffRole" id="staffRole">
                                    <!--<option value="0">-----Select------</option>-->
                                    <option value="0">Admin</option>
                                    <option value="1">Staff</option>
                                </select>
				</td>
				</tr>
                                
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Services</label>
				</td>
				<td style="vertical-align: middle" width="30%" >
                                    <%
                                    out.println("mmmmmmmmmmmmmm>>>>"+request.getAttribute("staffServiceHash"));
                                    %>
				<select class="form-control" multiple="multiple" name="staffService" id="staffService">
                                    
                                   <!-- <option value="0">Admin</option>
                                    <option value="1">Staff</option>-->
                                    
                                    <%
                                        
                                    if(request.getAttribute("staffServiceHash")!=null){
                                        Hashtable<Long,String> staffServiceHash=(Hashtable<Long,String>)request.getAttribute("staffServiceHash");
                                        out.println(">>>>>>>>>>>>>>>>>lll>>>>"+staffServiceHash);
                                         Set<Long> keySet = staffServiceHash.keySet();
                                        Iterator<Long> keySetIterator = keySet.iterator();
                                        while (keySetIterator.hasNext()) {
                                           out.println("------------------------------------------------");
                                           out.println("Iterating Map in Java using KeySet Iterator");
                                           Long key = keySetIterator.next();
                                           out.println("key: " + key + " value: " + staffServiceHash.get(key));                                       
                                                 %>
                                                 <option value="<%=key%>"><%=staffServiceHash.get(key)%></option>
                                                 <%
                                            }
                                        }
                                    %>
                                   
                                    
                              </select>
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
         <button type="button" class="btn btn-primary" onclick="javascript:addStaff();">Add Staff</button>    
         </td>
     </tr>
 </table>
 <form name="staffInfo" action="/scheduler/staff.do?execute=addStaffs" method="POST">
     <input type="hidden" id="staffID"/>
 <table class="table table-hover table-striped table-bordered" cellspacing="0" width="100%">
     <tr>
         
         <th width="30%">Staff Name</th>
         <th>Email id</th>
         <th>Mobile No</th>
         <th>Role</th>
                 
     </tr>
 <c:forEach var="row" items="${staffList}">
     <tr> 
              
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getStaffInfo('${row.STAFF_ID}','${row.STAFF_NAME}','${row.STAFF_EMAIL}','${row.STAFF_MOBILE}','${row.STAFF_ROLE}');"><c:out value="${row.STAFF_NAME}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getStaffInfo('${row.STAFF_ID}','${row.STAFF_NAME}','${row.STAFF_EMAIL}','${row.STAFF_MOBILE}','${row.STAFF_ROLE}');"><c:out value="${row.STAFF_EMAIL}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getStaffInfo('${row.STAFF_ID}','${row.STAFF_NAME}','${row.STAFF_EMAIL}','${row.STAFF_MOBILE}','${row.STAFF_ROLE}');"><c:out value="${row.STAFF_MOBILE}"/></a></td>
         <td width="30%"><a href="javascript:void(0);" onclick="javascript:getStaffInfo('${row.STAFF_ID}','${row.STAFF_NAME}','${row.STAFF_EMAIL}','${row.STAFF_MOBILE}','${row.STAFF_ROLE}');"><c:out value="${row.STAFF_ROLE}"/></a></td>
     </a>
     </tr>
</c:forEach>
    
</table>
 </form>
<%}%>

 <div id="editStaffDiv" style="display:none;">
 <form name="editStaff" action="/scheduler/staff.do?execute=updateStaffInfo" method="POST">
                    <input type="hidden" id="staffId" name="staffId" value=""/>
                    <input type="hidden" id="action" name="action" value="update">
                      <div class="modal fade docs-cropped" id="getCroppedCanvasModal1" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="getCroppedCanvasTitle">Edit Staff</h4>
                            </div>
                            <div class="modal-body">
				<table width="100%" border="0" class="form-horizontal form-label-left form_label">
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Name</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="staffName" name="staffName" class="form-control" value="">
				</td>
				</tr>
                                <br</br>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Email</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="staffEmail" name="staffEmail" class="form-control" value="">
				</td>
				</tr>
				<tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Phone Number</label>
				</td>
				<td style="vertical-align: middle" width="60%">
				<input type="text" id="staffMobile" name="staffMobile" class="form-control" value="">
				</td>
				</tr>
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Staff Role</label>
				</td>
				<td style="vertical-align: left" width="30%">
                                   
                                    <select class="form-control" name="staffRole" id="staffRole">
                                    <!--<option value="0">-----Select------</option>-->
                                    <option value="0">Admin</option>
                                    <option value="1">Staff</option>
                                       </select>
                                   
                                    
				</td>
				</tr>
                                <tr>
				<td style="vertical-align: middle" align="center" width="40%">
				<label class="col-sm-3 control-label">Services</label>
				</td>
				<td style="vertical-align: middle" width="30%" >
                                    <%
                                    out.println("mmmmmmmmmmmmmm>>>>"+request.getAttribute("staffServiceHash"));
                                    %>
				<select class="form-control" multiple="multiple" name="staffService" id="staffService">
                                    
                                   <!-- <option value="0">Admin</option>
                                    <option value="1">Staff</option>-->
                                    
                                    <%
                                        List<Long> staffServiceList=new ArrayList<Long>();
                                    if(request.getAttribute("staffServiceHash")!=null){
                                        if(request.getAttribute("StaffServiceID")!=null){
                                          staffServiceList=(List<Long>)request.getAttribute("StaffServiceID");
                                        }
                                        out.println("List value : "+staffServiceList);
                                        out.println("List size : "+staffServiceList.size());
                                        Hashtable<Long,String> staffServiceHash=(Hashtable<Long,String>)request.getAttribute("staffServiceHash");
                                        out.println(">>>>>>>>>>>>>>>>>lll>>>>"+staffServiceHash);
                                         Set<Long> keySet = staffServiceHash.keySet();
                                        Iterator<Long> keySetIterator = keySet.iterator();
                                        while (keySetIterator.hasNext()) {
                                           out.println("------------------------------------------------");
                                           out.println("Iterating Map in Java using KeySet Iterator");
                                           Long key = keySetIterator.next();
                                           out.println("key: " + key + " value: " + staffServiceHash.get(key));
                                           if(staffServiceList!=null && staffServiceList.size()>0){
                                           for(int i=0;i<staffServiceList.size();i++){
                                               out.println("list : "+staffServiceList.get(i));
                                               out.println("key : "+key);
                                           if(staffServiceList.get(i)==key){
                                               
                                           
                                                 %>
                                                 <option value="<%=key%>" selected><%=staffServiceHash.get(key)%></option>
                                                 <%
                                           }
                                           else{
                                               %>
                                               <option value="<%=key%>"><%=staffServiceHash.get(key)%></option>
                                               <%
                                           }
                                            }
                                           }else{
                                                %>
                                               <option value="<%=key%>"><%=staffServiceHash.get(key)%></option>
                                               <%
                                           }
                                        }
                                    }
                                    %>
                                   
                                    
                              </select>
				</td>
				</tr>
				</table>
			    </div>
                            <div class="modal-footer">
                              <button onclick="javascript:deleteStaff();" type="button" class="btn btn-danger">Delete</button>
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