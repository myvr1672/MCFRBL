<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="model.User" %>
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
<% String contextpath=request.getContextPath();%>
<style>
.hide {
display: none;
}

</style>
<%-- <script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script> --%>

<script>
// $(document).ready(function() {
// 	 $("#subTypeIdSpan").hide();
// $( "select[name='class']" )
// 	  .change(function () {
		
// 		  if($(this).val() == ''){
// 		  $("#subTypeIdSpan").hide();
// 		  }
// 		   if($(this).val() == 'OS')
// 			  {
// 			  $("#subTypeIdSpan").show();
// 			  $('#subTypeId option').each(function()
// 					  {
// 				  var opt=$(this)
// 				  var optValue=opt.val();
				  
// 				  if((optValue=='LDS')||(optValue=='NLDS'))
// 					  { 
// 					  opt.addClass('hide'); 
// 						  }
// 				  else {opt.removeClass('hide');}
					  
// 				  	}
			  
// 			 );
// 			  }
// 		  if($(this).val() == 'LSD')
// 		  {
// 		  $("#subTypeIdSpan").show();
// 		  $('#subTypeId option').each(function()
// 				  {
// 			  var opt=$(this)
// 			  var optValue=opt.val();
			  
// 			  if(optValue=='OS1'||optValue=='OS2'||optValue=='OS3'||optValue=='OS4')
// 				  { 
// 				  opt.addClass('hide'); 
// 							  }
// 			  else {opt.removeClass('hide');}
				  
// 			  	}
		  
		  
// 				  );
// 		  }
		 
		
// 	  })
// 	  ;
// 	$( "select[name='subType']" )
// 	  .change(function () {
// 		  $("#classId").prop( "disabled", true );
// 		 var type=$( "#classId" ).val();
		  
<%-- 		var url="<%=contextpath %>/addComponentPage.jsp?type="; --%>
// 		    url= url+type+"&subType="+$( "#subTypeId" ).val()+"&assetId="+$( "#assetId" ).val();
			
// 		 $( "#new-pages" ).load(url);	 
		
// 	  })
// 	  ;
	
// });
$(document).ready(function() {
	$( "select[name='class']" )	.change(function () {
		//alert ("Hello");
		if($(this).val()!='')
			{
			//alert($(this).val());
			var fieldValue=$( "#classId" ).val();
			var url="<%=contextpath %>/addComponentPage.jsp?type=";
			url=url+fieldValue+"&assetId="+$( "#assetId" ).val();
			//alert(url);
			$( "#new-pages" ).load(url);
			}
	} );
});

</script>
</head>
<body>
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_row;
Statement st_row= con.createStatement();
ResultSet rs_row;
User loginUser = null;
Session session_hibernate = null;
String username= null;
String roles= null;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");
String asssetId= request.getParameter("assetId");

%>
<input type="hidden" id="assetId" value="<%=asssetId%>" />
<p>
<!-- <span id="typeIdSpan"> -->
<b>Select Type: </b>&nbsp;&nbsp;
<select name="class" id="classId">
<option value="">Select</option>
<option value="OS">Earth Side/ Plane Side</option>
<option value="LSD">LDS/ NLDS</option>
  
 </select>
<!--  </span> -->
  &nbsp;&nbsp;&nbsp;&nbsp;
  
<!-- <span id="subTypeIdSpan"> -->

<!-- <b>Select Sub-Type </b>&nbsp;&nbsp; -->

<!--   <select name="subType" id="subTypeId"> -->
<!--    <option value="" selected>Select</option> -->
<!--     <option value="LDS">Lateral Damper Side</option> -->
<!--     <option value="NLDS">Non Lateral Damper Side</option> -->
<!--     <option value="OS1">Earth End Side</option> -->
<!--     <option value="OS2">Earth End Phonic Wheel</option> -->
<!--      <option value="OS3">Plane Side</option> -->
<!--     <option value="OS4">Plane Side Phonic Wheel</option> -->
<!--   </select>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--   </span> -->

 </p>
<div id="new-pages"></div>
</body>
</html>