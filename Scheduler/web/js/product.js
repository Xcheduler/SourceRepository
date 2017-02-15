/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addCustomer()
{
    //alert("MMMMMMMMMM"+document.getElementById('addCustomerDiv').style.display);
    //alert("ttttt"+document.getElementById('addCustomerDiv').style.display);
    document.getElementById('addCustomerDiv').style.display = "block";
    $('#getCroppedCanvasModal').modal();
}
function getCustomerInfo(custId, cusName, cusEmail, cusMobile)
{
    // alert(">>>>jjjjjjjj>>"+custId+cusName+cusEmail+cusMobile+document.getElementById("editCustomerDiv").style.display+document.getElementById("cusName").value);
    // document.getElementById("custID").value=custId;
    document.getElementById("editCustomerDiv").style.display = "block";
    document.getElementById("cusId").value = custId;
    document.getElementById("cusName").value = cusName;
    document.getElementById("cusEmail").value = cusEmail;
    document.getElementById("cusMobile").value = cusMobile;
    //alert(">>after>>>"+document.getElementById("custID").value+">>>>>>>"+document.getElementById("cusName").value);
    $('#getCroppedCanvasModal1').modal();
    //document.customerInfo.action = "/scheduler/customer.do?execute=addCustomers&custID="+custId;
    //  document.customerInfo.submit();
}
function deleteCustomer()
{
    //alert(">>>>delete>>>>"+document.getElementById("cusId").value);
    document.getElementById("action").value = "delete";
    document.editCustomer.submit();
}

function addStaff()
{
    //alert("MMMMMMMMMM"+document.getElementById('addCustomerDiv').style.display);
    //alert("ttttt"+document.getElementById('addCustomerDiv').style.display);
    document.getElementById('addStaffDiv').style.display = "block";
    $('#getCroppedCanvasModal').modal();
}
function getStaffInfo(staffId, staffName, staffEmail, staffMobile, staffRole)
{
    // alert(">>>>jjjjjjjj>>"+custId+cusName+cusEmail+cusMobile+document.getElementById("editCustomerDiv").style.display+document.getElementById("cusName").value);
    // document.getElementById("custID").value=custId;
    alert("dttststst>>>>"+staffRole);
    document.getElementById("editStaffDiv").style.display = "block";
    oFormObject = document.forms['editStaff'];
    oFormObject.elements["staffId"].value = staffId;
    oFormObject.elements["staffName"].value = staffName;
    oFormObject.elements["staffEmail"].value = staffEmail;
    oFormObject.elements["staffMobile"].value = staffMobile;
    
    var index=1;
    if("Admin"==staffRole){
        index=0;
    }   
    //Ajax Call for setting service selection
    //
    
    //
    //ajaxgetStaffResponse(staffId);
    //var datavalues = "execute=getStaff&staffId=" +staffId ;
    //var response = getAjaxResponse("POST", "/scheduler/StaffAjaxAction", datavalues);
    
    var datavalues = "execute=" + actionType + "&inputParam=" + title+ "&startDate=" + start+ "&endDate=" + end;
    var response = getAjaxResponse("POST", "/scheduler/AjaxAction", datavalues);
    
    alert(response);
    
    oFormObject.elements["staffRole"].selectedIndex=index;  
    $('#getCroppedCanvasModal1').modal();
   
}
function deleteStaff()
{
    //alert(">>>>delete>>>>"+document.getElementById("cusId").value);
    document.getElementById("action").value = "delete";
    document.editStaff.submit();
}


function addService()
{
    //alert("MMMMMMMMMM"+document.getElementById('addCustomerDiv').style.display);
    //alert("ttttt"+document.getElementById('addCustomerDiv').style.display);
    document.getElementById('addServiceDiv').style.display = "block";
    $('#getServiceModal').modal();
}
//
function deleteService()
{
    //alert(">>>>delete>>>>"+document.getElementById("cusId").value);
    document.getElementById("action").value = "delete";
    document.editService.submit();
}
//
function getServiceInfo(serviceId, serviceName, serviceDes, serviceCost, serviceHour, serviceBuffer)
{
    // alert(">>>>jjjjjjjj>>"+custId+cusName+cusEmail+cusMobile+document.getElementById("editCustomerDiv").style.display+document.getElementById("cusName").value);
    // document.getElementById("custID").value=custId;
    document.getElementById("editServiceDiv").style.display = "block";
    document.getElementById("serviceId").value = serviceId;
    document.getElementById("serviceName").value = serviceName;
    document.getElementById("serviceDesc").value = serviceDes;
    document.getElementById("serviceCost").value = serviceCost;
    document.getElementById("serviceHour").value = serviceHour;
    document.getElementById("serviceBuffer").value = serviceBuffer;
    //alert(">>after>>>"+document.getElementById("custID").value+">>>>>>>"+document.getElementById("cusName").value);
    $('#getCroppedCanvasModal1').modal();
    //document.customerInfo.action = "/scheduler/customer.do?execute=addCustomers&custID="+custId;
    //  document.customerInfo.submit();
}
function getAjaxResponse(method, actionurl, datavalues)
{
    alert("getajaxresss");
    var result = $.ajax({
        url: actionurl,
        type: method,
        data: datavalues,
        cache: false,
        async: false,
        success: function (msg) {
        }
    }).responseText;
    return result;
}
function ajaxResponse()
{
    alert(">>>>>ajaxxx>>>>");
    var datavalues = "execute=delete&urlid=112";
    var response = getAjaxResponse("POST", "/scheduler/AjaxAction", datavalues);

}
function newEventAdd(actionType, title,start,end)
{
    alert("adddddddddd" + actionType);
    var datavalues = "execute=" + actionType + "&inputParam=" + title+ "&startDate=" + start+ "&endDate=" + end;
    var response = getAjaxResponse("POST", "/scheduler/AjaxAction", datavalues);
    alert("resssss>>>>" + response);


function ajaxgetStaffResponse(staffId)
{
    alert(">>>>>ajaxxx>>>>"+staffId);
    //var datavalues = "execute=getStaff&staffId=26";
    var datavalues = "execute=getStaff&staffId=" +staffId ;
    var response = getAjaxResponse("POST", "/scheduler/StaffAjaxAction", datavalues);

}

}
