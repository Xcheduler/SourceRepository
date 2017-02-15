<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

<%
   session.invalidate();
%>
<head>
    <meta charset="utf-8">
  <!---CSS Files-->
  <link rel="stylesheet" href="css/master.css">
  <!---Fonts-->
  <link href='css/fontfaces.css' rel='stylesheet' type='text/css'>

</head>
<body>
     <div id="wrapper-vtop1">

</div>
<div class="content container_12">
     <h1 id="error-heading" style="font-size: 32px;">Session Expired</h1>
     <p id="error-desc">Your login session has expired.<br></p>
     <p id="error-back"><a href="Welcome.do">Click here </a>to login.</p>
</div>

</body>
</html>
