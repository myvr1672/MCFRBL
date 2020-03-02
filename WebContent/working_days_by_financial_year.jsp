<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <% String contextpath=request.getContextPath();%>
  <%@ page import="java.util.Calendar" %>
  <script src="<%=contextpath%>/js/jquery-1.8.2.js" type="text/javascript"></script>
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
       <select id="financialyear">
       <%
       Calendar cal = Calendar.getInstance();
       int year= cal.get(Calendar.YEAR);
       int month=cal.get(Calendar.MONTH);
       if (month<3)
       {
       	year=year-1;
       }

%>
        <option value="<%=year-1%>-<%=year%>"><%=year-1%>-<%=year%></option>
        <option value="<%=year%>-<%=year+1%>" selected><%=year%>-<%=year+1%></option>
        <option value="<%=year+1%>-<%=year+2%>"><%=year+1%>-<%=year+2%></option>
        
    </select>
<table class="customers">
<tr><th colspan="13"> Working Days in the financial year of <span id="financialyear_tag"></span></th></tr>
<tr><th>MONTH</th><th>APR,<span id="yr_april"></span></th>
<th>MAY,<span id="yr_may"></span></th><th>JUN,<span id="yr_june"></span></th><th>JUL,<span id="yr_july"></span></th><th>AUG,<span id="yr_august"></span></th>
<th>SEP,<span id="yr_september"></span></th><th>OCT,<span id="yr_october"></span></th><th>NOV,<span id="yr_november"></span></th>
<th>DEC,<span id="yr_december"></span></th>
<th>JAN,<span id="yr1_january"></span></th><th>FEB,<span id="yr1_february"></span></th>
<th>MAR,<span id="yr1_march"></span></th></tr>
<tr><td><b>Total Working Days</b></td> 
     
	<td id="totalWorkingDaysApr"></td> 
	<td id="totalWorkingDaysMay"></td> 
	<td id="totalWorkingDaysJun"></td> 
	<td id="totalWorkingDaysJul"></td> 
	<td id="totalWorkingDaysAug"></td> 
	<td id="totalWorkingDaysSep"></td> 
	<td id="totalWorkingDaysOct"></td> 
	<td id="totalWorkingDaysNov"></td> 
	<td id="totalWorkingDaysDec"></td>
	<td id="totalWorkingDaysJan"></td>
	<td id="totalWorkingDaysFeb"></td> 
	<td id="totalWorkingDaysMar"></td> 
	</tr>
	<tr><td><b>Total Working Days</b></td><td id="totalWorkingDays" colspan="12"></td>
	<tr><td><b>Working Days Over</b></td><td id="currentWorkingDays" colspan="12"></td> 
	
	</tr>
	
	
	
	</table>
	</body>
</html>
<script type="text/javascript">

$(document).ready(function() {
	$.ajax({                    
		  url: 'getWorkingDayByFinancialYear',     
		  type: 'post', // performing a POST request
		  async: false,
		  
		  dataType: 'json',
			  data : {
				  financialyear :$('#financialyear').val(),
				  
			  	  }									                    
	})
			.done(function( msg ) {
				//alert(msg.totalWorkingDaysJan_action);
				
				$('#totalWorkingDaysApr').html(msg.totalWorkingDaysApr);
				$('#totalWorkingDaysMay').html(msg.totalWorkingDaysMay);
				$('#totalWorkingDaysJun').html(msg.totalWorkingDaysJun);
				$('#totalWorkingDaysJul').html(msg.totalWorkingDaysJul);
				$('#totalWorkingDaysAug').html(msg.totalWorkingDaysAug);
				$('#totalWorkingDaysSep').html(msg.totalWorkingDaysSep);
				$('#totalWorkingDaysOct').html(msg.totalWorkingDaysOct);
				$('#totalWorkingDaysNov').html(msg.totalWorkingDaysNov);
				$('#totalWorkingDaysDec').html(msg.totalWorkingDaysDec);
				$('#currentWorkingDays').html(msg.currentWorkingDays);
				$('#totalWorkingDaysJan').html(msg.totalWorkingDaysJan_action);
				$('#totalWorkingDaysFeb').html(msg.totalWorkingDaysFeb);
				$('#totalWorkingDaysMar').html(msg.totalWorkingDaysMar);
				$('#totalWorkingDays').html(msg.totalWorkingDays);
				$('#financialyear_tag').html(msg.financialyear);
				$('#yr_april').html(msg.yr);
				$('#yr_may').html(msg.yr);
				$('#yr_june').html(msg.yr);
				$('#yr_july').html(msg.yr);
				$('#yr_august').html(msg.yr);
				$('#yr_september').html(msg.yr);
				$('#yr_october').html(msg.yr);
				$('#yr_november').html(msg.yr);
				$('#yr_december').html(msg.yr);
				$('#yr1_january').html(msg.yr1);
				$('#yr1_february').html(msg.yr1);
				$('#yr1_march').html(msg.yr1);
			  })
			.error(function (msg){
				alert("Error Fetching working days");
			})
			  ;
  
  
  $("#financialyear").on('change', 
			function() {
		
  	  $.ajax({                    
		  url: 'getWorkingDayByFinancialYear',     
		  type: 'post', // performing a POST request
		  async: false,
		  
		  dataType: 'json',
			  data : {
				  financialyear :$('#financialyear').val(),
				  
			  	  }									                    
	})
			.done(function( msg ) {			
				$('#totalWorkingDaysApr').html(msg.totalWorkingDaysApr);
				$('#totalWorkingDaysMay').html(msg.totalWorkingDaysMay);
				$('#totalWorkingDaysJun').html(msg.totalWorkingDaysJun);
				$('#totalWorkingDaysJul').html(msg.totalWorkingDaysJul);
				$('#totalWorkingDaysAug').html(msg.totalWorkingDaysAug);
				$('#totalWorkingDaysSep').html(msg.totalWorkingDaysSep);
				$('#totalWorkingDaysOct').html(msg.totalWorkingDaysOct);
				$('#totalWorkingDaysNov').html(msg.totalWorkingDaysNov);
				$('#totalWorkingDaysDec').html(msg.totalWorkingDaysDec);
				$('#currentWorkingDays').html(msg.currentWorkingDays);
				$('#totalWorkingDaysJan').html(msg.totalWorkingDaysJan_action);
				$('#totalWorkingDaysFeb').html(msg.totalWorkingDaysFeb);
				$('#totalWorkingDaysMar').html(msg.totalWorkingDaysMar);
				$('#totalWorkingDays').html(msg.totalWorkingDays);
				$('#financialyear_tag').html(msg.financialyear);
				$('#yr_april').html(msg.yr);
				$('#yr_may').html(msg.yr);
				$('#yr_june').html(msg.yr);
				$('#yr_july').html(msg.yr);
				$('#yr_august').html(msg.yr);
				$('#yr_september').html(msg.yr);
				$('#yr_october').html(msg.yr);
				$('#yr_november').html(msg.yr);
				$('#yr_december').html(msg.yr);
				$('#yr1_january').html(msg.yr1);
				$('#yr1_february').html(msg.yr1);
				$('#yr1_march').html(msg.yr1);
			  })
			.error(function (msg){
				alert("Error Fetching working days");
			})
			  ;
  			
			});

});
</script>


 
