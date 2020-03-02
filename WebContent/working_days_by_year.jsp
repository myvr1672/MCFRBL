<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <% String contextpath=request.getContextPath();%>
  <%@ page import="java.util.Calendar" %>
  <script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>
<!DOCTYPE html>
 <html>
<head>
<style>
.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #8d9c8e;
    color: white;
}
</style>

<title>Welcome</title>
</head>

<body>
 Year:
       <select id="year">
       <%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);
%>
        <option value="<%=year-1%>"><%=year-1%></option>
        <option value="<%=year%>" selected><%=year%></option>
        <option value="<%=year+1%>"><%=year+1%></option>
        
    </select>
<table class="customers">
<tr><th colspan="13"> Working Days in the year of <span id="year_tag"></span></th></tr>
<tr><th>MONTH</th><th>JANUARY</th><th>FEBRUARY</th><th>MARCH</th><th>APRIL</th>
<th>MAY</th><th>JUNE</th><th>JULY</th><th>AUGUST</th>
<th>SEPTEMBER</th><th>OCTOBER</th><th>NOVEMBER</th><th>DECEMBER</th>
<tr><td><b>Total Working Days</b></td> 
<td id="totalWorkingDaysJan"></td>
	<td id="totalWorkingDaysFeb"></td> 
	<td id="totalWorkingDaysMar"></td> 
	<td id="totalWorkingDaysApr"></td> 
	<td id="totalWorkingDaysMay"></td> 
	<td id="totalWorkingDaysJun"></td> 
	<td id="totalWorkingDaysJul"></td> 
	<td id="totalWorkingDaysAug"></td> 
	<td id="totalWorkingDaysSep"></td> 
	<td id="totalWorkingDaysOct"></td> 
	<td id="totalWorkingDaysNov"></td> 
	<td id="totalWorkingDaysDec"></td> 
	</tr>
	
	<tr><td><b>Working Days Over</b></td><td id="currentWorkingDays" colspan="12"></td> 
	<tr><td><b>Total Working Day</b></td><td id="totalWorkingDays" colspan="12"></td>
	
	</tr>
	
	
	
	</table>
	</body>
</html>
	
<script type="text/javascript">

$(document).ready(function() {
	$.ajax({                    
		  url: 'getWorkingDayByYear',     
		  type: 'post', // performing a POST request
		  async: false,
		  
		  dataType: 'json',
			  data : {
				year :$('#year').val(),
				  
			  	  }									                    
	})
			.done(function( msg ) {
				//alert(msg.totalWorkingDaysJan_action);
				$('#totalWorkingDaysJan').html(msg.totalWorkingDaysJan_action);
				$('#totalWorkingDaysFeb').html(msg.totalWorkingDaysFeb);
				$('#totalWorkingDaysMar').html(msg.totalWorkingDaysMar);
				$('#totalWorkingDaysApr').html(msg.totalWorkingDaysApr);
				$('#totalWorkingDaysMay').html(msg.totalWorkingDaysMay);
				$('#totalWorkingDaysJun').html(msg.totalWorkingDaysJun);
				$('#totalWorkingDaysJul').html(msg.totalWorkingDaysJul);
				$('#totalWorkingDaysAug').html(msg.totalWorkingDaysAug);
				$('#totalWorkingDaysSep').html(msg.totalWorkingDaysSep);
				$('#totalWorkingDaysOct').html(msg.totalWorkingDaysOct);
				$('#totalWorkingDaysNov').html(msg.totalWorkingDaysNov);
				$('#totalWorkingDaysDec').html(msg.totalWorkingDaysDec);
				$('#totalWorkingDays').html(msg.totalWorkingDays);
				
				$('#currentWorkingDays').html(msg.currentWorkingDays);
				$('#year_tag').html(msg.year);
			  })
			.error(function (msg){
				alert("Error Fetching working days");
			})
			  ;
  
  
  $("#year").on('change', 
			function() {
		
  	  $.ajax({                    
		  url: 'getWorkingDayByYear',     
		  type: 'post', // performing a POST request
		  async: false,
		  
		  dataType: 'json',
			  data : {
				year :$('#year').val(),
				  
			  	  }									                    
	})
			.done(function( msg ) {
				
				$('#totalWorkingDaysJan').html(msg.totalWorkingDaysJan_action);
				$('#totalWorkingDaysFeb').html(msg.totalWorkingDaysFeb);
				$('#totalWorkingDaysMar').html(msg.totalWorkingDaysMar);
				$('#totalWorkingDaysApr').html(msg.totalWorkingDaysApr);
				$('#totalWorkingDaysMay').html(msg.totalWorkingDaysMay);
				$('#totalWorkingDaysJun').html(msg.totalWorkingDaysJun);
				$('#totalWorkingDaysJul').html(msg.totalWorkingDaysJul);
				$('#totalWorkingDaysAug').html(msg.totalWorkingDaysAug);
				$('#totalWorkingDaysSep').html(msg.totalWorkingDaysSep);
				$('#totalWorkingDaysOct').html(msg.totalWorkingDaysOct);
				$('#totalWorkingDaysNov').html(msg.totalWorkingDaysNov);
				$('#totalWorkingDaysDec').html(msg.totalWorkingDaysDec);
				$('#totalWorkingDays').html(msg.totalWorkingDays);
				$('#currentWorkingDays').html(msg.currentWorkingDays);
				$('#year_tag').html(msg.year);
				
			  })
			.error(function (msg){
				alert("Error Fetching working days");
			})
			  ;
  
				
			});

});
</script>


 
