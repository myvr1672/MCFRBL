<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<html>
<head>
<style>
.error-msg{
   background-color: #FF0000;
}
</style>
<% String contextpath=request.getContextPath();%>

<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	//start: retrieving axle number for auto complete
    var axleNumbers=[]; 

	var j=1;
	axleNumbers[0]={ value:null, label: "Select" };
	<c:forEach var="b" items="${axleNumberListForCTRBSIP}">
	axleNumbers[j]={ key: "${b.key}", value: "${b.value}"};
		j++;
	    </c:forEach>
	  //end: retrieving axle number for autocomplete

	   $("#assetidDisplay").autocomplete({
        source: axleNumbers,
        minLength: 2,
        focus: function( event, ui ) {
            $( "#assetidDisplay" ).val( ui.item.value );
            return false;
          },
        select: function (event, ui) {
            $('#assetidDisplay').val(ui.item.value);
            $("#assetid").val(ui.item.key);
        }
    });
	  
	  
	$( "#buttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/wheelCTRBReport.jsp?wheelAssetId="+$( "#assetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
});

</script>
</head>
<body>
<div id="errorMessage"></div>
<p><b>Enter Axle No</b><input type ="hidden" id="assetid" name="assetid"/> <input type ="text" id="assetidDisplay" name="assetidDisplay"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="buttonId" value="Run Report"/></p>
 
<hr />

<div id="new-pages"></div>
</body>
</html>