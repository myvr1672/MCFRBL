<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <style>
      #b1{
          background-color:black;
          color:white;
      
         }
      #bu{
          height:15%;
          width:10%;
          font-size:100%;
      }
      #but1{
           height:25%;
          width:50%;
          font-size:20%;
          
      }
      #tab1{
         width:100%;
         height:100%;
          position: relative;
  
  overflow: auto;
         
      
      }
      stage_but{
         height:25%;
          width:25%;
          
      }
      
       
        
   
   </style>
   
  <script>
                 function sel_chang()
                 {
                   var sel = document.getElementById('s1');
                  console.log( sel.options[sel.selectedIndex].selected);
                 }
                  </script>
<title>Bootstrap Layout</title>
</head>
<body>
    <div class="container">
     <h2>Shop Progress</h2>
      <%
            int a_id=1;
            String colr="btn btn-success";
            Calendar calend=Calendar.getInstance();
            Calendar day_cal=Calendar.getInstance();
            Calendar col_s=Calendar.getInstance();
            Calendar now=Calendar.getInstance();
	      int k,l,day_mon=calend.getActualMaximum(Calendar.DAY_OF_MONTH);
	     
	      String[] month = {"January", "February",
                  "March", "April", "May", "June", "July",
                  "August", "September", "October", "November",
                  "December"};
    	  String mon=month[calend.get(Calendar.MONTH)];
    	  calend.add(Calendar.MONTH,-1);
          String mon2=month[calend.get(Calendar.MONTH)];
          calend.add(Calendar.MONTH,-1);
          String mon3=month[calend.get(Calendar.MONTH)];
          int  yr1=now.get(Calendar.YEAR);
          int yr2=yr1-1;
          int count=col_s.getActualMaximum(Calendar.DAY_OF_MONTH);
       %>
      
      <div class="table-responsive" style="height:100%;width:100%;">
      <div>
      <form  target="_self">
             <select  name="opt1" id="s1">
             <option disabled selected >select a month</option>
             <option ><%=mon%>  </option>
              <option><%=mon2%>  </option>
               <option ><%=mon3%>  </option>
        </select>  
       
        
               <select  name="opt2" id="s2" >
                <option disabled selected >Year</option> 
             <option  value="<%=yr1%>" ><%=yr1%>  </option>
              <option  value="<%=yr2%>" > <%=yr2%>  </option>
               
                </select> 
                
                
          <button id="b1" class="btn btn-xs" type=submit >Get Status</button>    
         </form> 
         </div>  
          
     <table  id="tab1" class="table table-bordered" data-spy="scroll">
   
     <% 
       String[] monthName = {"January", "February",
               "March", "April", "May", "June", "July",
               "August", "September", "October", "November",
               "December"};
 	      Calendar calc=Calendar.getInstance();
 	     int sel_mon_day=0,sel_day;
           String sel_mon=String.valueOf(request.getParameter("opt1"));
           if(sel_mon.equalsIgnoreCase("null"))
           {
        	   sel_mon=mon;
        	   sel_day=calc.getActualMaximum(Calendar.DAY_OF_MONTH);
        	   
        	  
           }
           String y=request.getParameter("opt2");
           int ayr;
           
           if(y== null)
        	   ayr=now.get(Calendar.YEAR);
           else
        	   ayr=Integer.valueOf(y);
           int y1=ayr;
          
           
           
           
           Calendar calen2=Calendar.getInstance();
           Calendar calen=Calendar.getInstance();
          
           
           
           if(sel_mon.equalsIgnoreCase("January"))
             {
        	   sel_mon_day=0;
        	   sel_day=31;
             }
           else if(sel_mon.equalsIgnoreCase("February"))
           {
        	   sel_mon_day=1;
        	   sel_day=28;
           }
           else if(sel_mon.equalsIgnoreCase("March"))
              {
        	   sel_mon_day=2;
        	   sel_day=31;
              }
           else if(sel_mon.equalsIgnoreCase("April"))
        	   {
        	   sel_mon_day=3;
        	   sel_day=30;
        	   }
           else if(sel_mon.equalsIgnoreCase("May"))
             {
        	   sel_mon_day=4;
        	   sel_day=31;
             }
           else if(sel_mon.equalsIgnoreCase("June"))
           {
        	   sel_mon_day=5;
        	   sel_day=30;
           }
           else if(sel_mon.equalsIgnoreCase("July"))
           {
        	   sel_mon_day=6;
        	   sel_day=31; 
           }
           else if(sel_mon.equalsIgnoreCase("August"))
        	   {
        	   sel_mon_day=7;
        	   sel_day=31;
        	   }
           else if(sel_mon.equalsIgnoreCase("September"))
        	   {
        	   sel_mon_day=8;
        	   sel_day=30;
        	   }
           else if(sel_mon.equalsIgnoreCase("October"))
           {
        	   sel_mon_day=9;
        	   sel_day=31;
           }
           else if(sel_mon.equalsIgnoreCase("November"))
        	   {
        	   sel_mon_day=10;
        	   sel_day=30;
        	   }
           else 
        	   {
        	   sel_mon_day=11;
        	   sel_day=31;
        	   }
           String[] day_week={ "Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
 	      int d=calen.get(Calendar.DAY_OF_WEEK);
           
            
        %> 
       <tr class="info">
       <td colspan=<%=sel_day+1 %>> <b>Shops</b></td>
      </tr>
      <tr>
        <td><b>Date</b></td>
	  <% 
	      for(k=1;k<=sel_day;k++)
	      { %>
	    	  <td width=2% align="center"><b><%=k%></b></td>
	    	  <%} %>
      
      </tr>
        <tr >
	    	  
	    	  <td><b>Days</b></td>
	    	  
	    	  <% 
	      for(k=1;k<=sel_day;k++)
	      { 
	    	  day_cal.set(y1,sel_mon_day,k);
	    	  
	    	  %>
	    	  <td width=2% style="text-align:center"><b><%=day_week[day_cal.get(Calendar.DAY_OF_WEEK)-1] %></b></td>
	    	 <% }%> 
	    	 
	      
	     
	    	  
	    </tr>
	     <tr bgcolor="pink">
	    	  
	    	   <%
	    	 
	    	  String m=sel_mon;
	    	  
	    	  %>
	    	  <td colspan=<%=sel_day+1%>><b><%=m%></b></td> 
	     </tr>
	     <%
	//from here     
	String color[]=new String[]{"#ff3333","#2222dd","#006400"};
	
    DbConnection db=new DbConnection();
	Connection con=db.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select stages,stage_description,stage_id from stage_master where stage_id<7 order by stage_id");
    
	while(rs.next())
	{
	
	  if((rs.getString(1)).equalsIgnoreCase("Bogie"))
		  a_id=1;
	  else if((rs.getString(1)).equalsIgnoreCase("Wheel"))
		  a_id=2;
	  else if((rs.getString(1)).equalsIgnoreCase("Shell"))
		  a_id=3;
	  else if((rs.getString(1)).equalsIgnoreCase("Paint"))
		  a_id=4;
	  else if((rs.getString(1)).equalsIgnoreCase("Furnishing"))
		  a_id=5;
	  else 
		  a_id=6;
	  
	  
	  
	
	%>
       <tr>
	    <td  title=" <%=rs.getString(2)%>"  data-toggle="collapse" data-target="#group<%=a_id%>" aria-expanded="false"  >
	        <%if((rs.getString(1)).equalsIgnoreCase("Bogie")) {%>
               <span > <img src="images/bogie_img.jpg"/> </span>
	              <%} 
	          if((rs.getString(1)).equalsIgnoreCase("Wheel")) {%>
	          <span > <img src="images/wheelset_img.jpg"/> </span>
	         
	      
	        <%} %>
	        <%if((rs.getString(1)).equalsIgnoreCase("Shell")) {%>
	      <span><img src="images/shell_img.jpg"/> </span>
	        <%}%>
	        <%if((rs.getString(1)).equalsIgnoreCase("Paint")) {%>
	      <span class="glyphicon glyphicon-tint" style='font-size:15px'> </span>
	       
	        <%} %>
	        <%if((rs.getString(1)).equalsIgnoreCase("Furnishing")) {%>
	      <span class="glyphicon glyphicon-wrench" style='font-size:15px' > </span>
	        <%} %>
	        <%if((rs.getString(1)).equalsIgnoreCase("Finishing")) {%>
	     <span class="glyphicon glyphicon-flag" style='font-size:15px'></span> 
	        <%} %>
	       </td>
	    <% Calendar cl1=Calendar.getInstance();
	    DbConnection db1=new DbConnection();
	 	Connection con1=db1.getConnection();
	 	Statement st1=con1.createStatement();
	 	String var=rs.getString(1);
	   
	      int c,col=0,j,i,day,days1=cl1.getActualMaximum(Calendar.DAY_OF_MONTH);
	       
	      String str[]=new String[3];
	      
         	  
	      for(j=1;j<=sel_day;j++)
 	      {  
	    	//  count++  
	            	   
	         	    	 
	       %>
	    	  <td>
	    	     <% //wheelset 
	    	     
	    	       if(rs.getString(1).equalsIgnoreCase("Wheel"))
	    	        { 	   
	    	   	   ResultSet rs1=st1.executeQuery("select wheelset_transaction_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,dispatch_to,customer  from public.wheelset_tran  ");    
	    	   	int count_disb=0,count_disrsp=0,count_start=0,count_complete=0;
	    	   	   while(rs1.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	          	 if(rs1.getDate(4)!=null)
	          		{
	          		 	
	          		 cal.setTime(rs1.getDate(4));
	          		
	          		  if(rs1.getString(5)==null )
	          		   { colr="btn btn-success btn-xs";
	          		
	          		   }
	          		  else if(rs1.getString(5).equalsIgnoreCase("bogie") )
	          		   {
	          		   colr="btn btn-success btn-xs";
	          		   }
	          		  else {
	          			colr="btn btn-info btn-xs"; 
	          		  }
	          		}
	          	 else if(rs1.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs1.getDate(3));
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs1.getDate(2));
	          		 colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	  int now1=cal.get(Calendar.YEAR);
	          	  
	          	    if(v.equalsIgnoreCase(sel_mon) && now1==y1) 
	          	    { 	
	          	    	 
	    	        if(j==day)
	     	           { 
	    	        		
	    	        	
	    	                    	 %>
	    	                    	     	           
          <%--     <button   id="stage_but" title="RBL NO:<%=rs1.getString(1) %><%out.println("\n");%>Date of mounting:<%=rs1.getDate(2)%><%out.println("\n");%>Completion Date:<%=rs1.getDate(3)%><%out.println("\n");%> <% if(rs1.getDate(4)!=null) {%>Dispatch Date: <%=rs1.getDate(4)%><%out.println("\n");%> <%if(rs1.getString(6)!=null){%>Customer:<%=rs1.getString(6)%><% }}%>"   
        	                     
        	                     
        	                 class="<%=colr%> "  >   <%=rs1.getString(1)%>   </button>  --%>
        	         
        	                          
        	                          <% 
        	                          if(rs1.getDate(4)!=null)
        	                          {
        	                        	   if(rs1.getString(5).equalsIgnoreCase("bogie") )
        	       	          		  		 {
        	       	          		  			 count_disb++;
        	       	          		  			 
        	       	          			     }
        	       	          		  else {
        	       	          					count_disrsp++;
        	       	          		  		} 
        	                        	   
        	                          }
        	                          else if(rs1.getDate(3)!=null )
        	      	            	{	
        	                        	  count_complete++;        	      	            	
        	      	            	}
        	                          else
        	                          {
        	                        	  count_start++;
        	                          }
        	                          %>
        	                         <br>

        	                       
        	                        
        	                     
        	                   
        	                  <% }
	          	    }  
	          	   		 }%>
        	                  
	    	       
	    	      <%
	    	      if(count_disrsp!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of dispatched wheels in rsp " class="btn btn-info btn-xs" >   <%=count_disrsp%>   </button>
	    	     <% }
	    	      if(count_disb!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of dispatched wheels in boggie " class="btn btn-success btn-xs" >   <%=count_disb%>   </button>
	    	     <% }
	    	      if(count_start!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of wheel production started " class="btn btn-danger btn-xs" >   <%=count_start%>   </button>
	    	     <% }
	    	      if(count_complete!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of wheel production completed " class="btn btn-primary btn-xs" >   <%=count_complete%>   </button>
	    	     <% }
	    	      
	    	        } //Wheelset ends here
	    	        
	    	        
	    	     if(rs.getString(1).equalsIgnoreCase("Bogie"))
	    	        { 	   
	    	     ResultSet rs2=st1.executeQuery("select bogie_set_trx_id,assembly_start_date,assembly_end_date,assembly_exit_date,dispatch_to,customer  from bogieset_trans  ");
	    	     int count_disf=0,count_disrsp=0,count_start=0,count_complete=0;
	    	       while(rs2.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	           			  if(rs2.getDate(4)!=null)
	          		{
	          		   cal.setTime(rs2.getDate(4));
	          		   //colr=color[2];
	          		 
	          		     if(rs2.getString(5)==null )
	          		     { colr="btn btn-success btn-xs";
	          		 
	          		      }
	          		    else if(rs2.getString(5).equalsIgnoreCase("furnishing") )
	          		     {
	          		     colr="btn btn-success btn-xs";
	          		     }
	          		    else {
	          			colr="btn btn-info btn-xs"; 
	          		    } 
	          		   
	          		}
	          	 else if(rs2.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs2.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs2.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	int now2=cal.get(Calendar.YEAR);
	          	    if(v.equalsIgnoreCase(sel_mon) && now2 == y1) 
	            	    { 	
	    	        if(j==day)
	     	           {
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	          <%--  <button id="stage_but" title="Bogie RBL No:<%=rs2.getString(1) %><%out.println("\n");%>Start Date:<%=rs2.getDate(2) %><%out.println("\n");%><%if(rs2.getDate(4)!=null){%>Completion Date: <%=rs2.getDate(3)%><%out.println("\n");%>Dispatch Date:<%=rs2.getDate(4)%><%out.println("\n");%><%if(rs2.getString(6)!=null){%>Customer:<%=rs2.getString(6)%><% }}else if(rs2.getDate(3)!=null){ %>Completion Date: <%=rs2.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs2.getDate(7)%><%out.println("\n");}%>" 
     	                                  
     	                                 class="<%=colr%>" >   <%=rs2.getString(1) %></button> 
     	                           
     	                         <br> --%>
     	                          <% 
        	                          if(rs2.getDate(4)!=null)
        	                          {
        	                        	   if(rs2.getString(5).equalsIgnoreCase("furnishing") )
        	       	          		  		 {
        	       	          		  			 count_disf++;
        	       	          		  			 
        	       	          			     }
        	       	          		  else {
        	       	          					count_disrsp++;
        	       	          		  		} 
        	                        	   
        	                          }
        	                          else if(rs2.getDate(3)!=null )
        	      	            	{	
        	                        	  count_complete++;        	      	            	
        	      	            	}
        	                          else
        	                          {
        	                        	  count_start++;
        	                          }
        	                          %>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% }
	    	        
	    	        
	    	        
	          	    }  }%>
     	                   
	    	       
	    	      
	    	     
	    	      <%
	    	      if(count_disrsp!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of BOGGIE dispatched to rsp " class="btn btn-info btn-xs" >   <%=count_disrsp%>   </button>
	    	     <% }
	    	      if(count_disf!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of  BOGGIE dispatched to FURNISHING " class="btn btn-success btn-xs" >   <%=count_disf%>   </button>
	    	     <% }
	    	      if(count_start!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of BOGGIE production started " class="btn btn-danger btn-xs" >   <%=count_start%>   </button>
	    	     <% }
	    	      if(count_complete!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of BOGGIE production completed " class="btn btn-primary btn-xs" >   <%=count_complete%>   </button>
	    	     <% }
	    	      
	    	        }//bogie set ends here
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        
	    	        //Shell
	    	         if(rs.getString(1).equalsIgnoreCase("Shell"))
	    	        { 	   
	    	     ResultSet rs3=st1.executeQuery("select shell_transaction_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,expected_exit_date  from shell_tran  ");
	    	     int count_dis=0,count_start=0,count_complete=0;
	    	       while(rs3.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	          	 if(rs3.getDate(4)!=null)
	          		{
	          		 cal.setTime(rs3.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs3.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs3.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs3.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	int now2=cal.get(Calendar.YEAR);
	          	    if(v.equalsIgnoreCase(sel_mon) && now2 == y1) 
	            	    { 	
	    	        if(j==day)
	     	           {
	    	        	 if(rs3.getDate(4)!=null)
	    	        	 {
	    	        		 count_dis++;
	    	        		
	    	        	 }
	    	        	 else if(rs3.getDate(3)!=null)  
	    	        	 {
	    	        		 count_complete++;
	    	        		
	    	        	 }
	    	        	 else
	    	        	 {
	    	        		 count_start++;
	    	        		 
	    	        	 }
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	          <%--  
	    	         	           <button id="stage_but" title="Shell Production Id:<%=rs3.getString(1) %><%out.println("\n"); %>Start Date:<%=rs3.getDate(2) %><%out.println("\n");if(rs3.getDate(4)!=null){ %>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");%>Dispatch Date:<%=rs3.getDate(4)%><%out.println("\n");}else if(rs3.getDate(3)!=null){%>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");} else{ %>Expected Completion Date:<%=rs3.getDate(5)%><%out.println("\n");}%>" 
     	                                  
     	                                 class="<%=colr%>" >   <%=rs3.getString(1) %></button> 
     	                           
     	                         <br> --%>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% }
	          	    }  }%>
     	                   
	    	       
	    	      <%
	    	      if(count_dis!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of  shell  dispatched  " class="btn btn-success btn-xs" >   <%=count_dis%>   </button>
	    	     <% }
	    	      if(count_start!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell production started " class="btn btn-danger btn-xs" >   <%=count_start%>   </button>
	    	     <% }
	    	      if(count_complete!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell production completed " class="btn btn-primary btn-xs" >   <%=count_complete%>   </button>
	    	     <% }
	    	        }  //Shell ends here. 
	    	        
	    	        //Paint Code starts here
	    	         if(rs.getString(1).equalsIgnoreCase("Paint"))
	    	        { 	   
	    	     ResultSet rs4=st1.executeQuery("select paint_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,expected_exit_date  from paint_tran  ");
	    	     int count_dis=0,count_start=0,count_complete=0;
	    	       while(rs4.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	          	 if(rs4.getDate(4)!=null)
	          		{
	          		 cal.setTime(rs4.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs4.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs4.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs4.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	int now2=cal.get(Calendar.YEAR);
	          	    if(v.equalsIgnoreCase(sel_mon) && now2 == y1) 
	            	    { 	
	    	        if(j==day)
	     	           {
	    	        	
	    	        	
		    	        	 if(rs4.getDate(4)!=null)
		    	        	 {
		    	        		 count_dis++;
		    	        		
		    	        	 }
		    	        	 else if(rs4.getDate(3)!=null)  
		    	        	 {
		    	        		 count_complete++;
		    	        		
		    	        	 }
		    	        	 else
		    	        	 {
		    	        		 count_start++;
		    	        		 
		    	        	 }	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	          <%--  <button id="stage_but" title="Paint Asset Id:<%=rs4.getString(1) %><%out.println("\n"); %>Start Date:<%=rs4.getDate(2) %><%out.println("\n");if(rs4.getDate(4)!=null){ %> Completion Date: <%=rs4.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs4.getDate(4)%><%}else if(rs4.getDate(3)!=null){%> Completion Date: <%=rs4.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs4.getDate(5)%><%out.println("\n");}%>" 
     	                                  
     	                                 class="<%=colr%>" >   <%=rs4.getString(1) %></button> 
     	                           
     	                         <br> --%>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% }
	          	    }  }%>
     	                   
	    	      
	    	      <%
	    	      if(count_dis!=0)
	    	      {%>`
	    	    	
	    	    	   <button   id="stage_but" title="no of shell dispatched from paint  " class="btn btn-success btn-xs" >   <%=count_dis%>   </button>
	    	     <% }
	    	      if(count_start!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell in paint " class="btn btn-danger btn-xs" >   <%=count_start%>   </button>
	    	     <% }
	    	      if(count_complete!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell paint completed " class="btn btn-primary btn-xs" >   <%=count_complete%>   </button>
	    	     <% }}//Paint ends here
	    	      
	    	        //Furnishing Code starts here
	    	         if(rs.getString(1).equalsIgnoreCase("Furnishing"))
	    	        { 	   
	    	     ResultSet rs5=st1.executeQuery("select furnishing_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,expected_exit_date  from furnishing_tran  ");
	    	     int count_dis=0,count_start=0,count_complete=0;
	    	       while(rs5.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	          	 if(rs5.getDate(4)!=null)
	          		{
	          		 cal.setTime(rs5.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs5.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs5.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs5.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	int now2=cal.get(Calendar.YEAR);
	          	    if(v.equalsIgnoreCase(sel_mon) && now2 == y1) 
	            	    { 	
	    	        if(j==day)
	     	           {
	    	        	
	    	        	
		    	        	 if(rs5.getDate(4)!=null)
		    	        	 {
		    	        		 count_dis++;
		    	        		
		    	        	 }
		    	        	 else if(rs5.getDate(3)!=null)  
		    	        	 {
		    	        		 count_complete++;
		    	        		
		    	        	 }
		    	        	 else
		    	        	 {
		    	        		 count_start++;
		    	        		 
		    	        	 }	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	         <%--   <button id="stage_but" title="Furnishing Asset Id:<%=rs5.getString(1) %><%out.println("\n"); %>Start Date:<%=rs5.getDate(2) %><%out.println("\n");if(rs5.getDate(4)!=null){ %> Completion Date: <%=rs5.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs5.getDate(4)%><%}else if(rs5.getDate(3)!=null){%> Completion Date: <%=rs5.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs5.getDate(5)%><%out.println("\n");}%>" 
    	                                  
    	                                 class="<%=colr%>" >   <%=rs5.getString(1) %></button> 
    	                           
    	                         <br> --%>

    	                       
    	                        
    	                     
    	                   
    	                  <% }
	          	    }  }%>
    	                   
	    	       
	    	      <%if(count_dis!=0)
	    	      {%>
		    	    	
	    	    	   <button   id="stage_but" title="no of shell dispatched for furnished  " class="btn btn-success btn-xs" >   <%=count_dis%>   </button>
	    	     <% }
	    	      if(count_start!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell started for furnishing " class="btn btn-danger btn-xs" >   <%=count_start%>   </button>
	    	     <% }
	    	      if(count_complete!=0)
	    	      {%>
	    	    	 
	    	    	   <button   id="stage_but" title="no of shell furnishing completed " class="btn btn-primary btn-xs" >   <%=count_complete%>   </button>
	    	     <% } 
	    	      }//Furnishing ends here  
	    	       
	    	         //Finishing starts
	    	         if(rs.getString(1).equalsIgnoreCase("Finishing"))
	    	        { 	   
	    	     ResultSet rs6=st1.executeQuery("select finishing_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date  from finishing_tran  ");
	 	        
	    	       while(rs6.next()) 
	                {
	          	   Calendar cal=Calendar.getInstance();
	          	 if(rs6.getDate(4)!=null)
	          		{
	          		 cal.setTime(rs6.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs6.getDate(3)!=null )
	            	{
	          		 cal.setTime(rs6.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		 cal.setTime(rs6.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal.get(Calendar.DAY_OF_MONTH); 
	          	 String v=monthName[cal.get(Calendar.MONTH)];
	          	int now2=cal.get(Calendar.YEAR);
	          	    if(v.equalsIgnoreCase(sel_mon) && now2 == y1) 
	            	    { 	
	    	        if(j==day)
	     	           {
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Finishing Asset Id:<%=rs6.getString(1) %><%out.println("\n"); %>Start Date:<%=rs6.getDate(2) %><%out.println("\n"); %>Completion Date: <%=rs6.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs6.getDate(4)%>" 
    	                                  
    	                                 class="<%=colr%>" >   <%=rs6.getString(1) %></button> 
    	                           
    	                         <br>

    	                       
    	                        
    	                     
    	                   
    	                  <% }
	          	    }  }%>
    	                   
	    	       
	    	      <% }//Finishing ends here
	    	      
	    	      %> 
                      
                     
                      </td>
	    	  
	          <% 
		      }%>
		      </tr>
		     
		      
		       
		      <%
    DbConnection db2=new DbConnection();
  	Connection con2=db2.getConnection();
  	Statement st2=con2.createStatement();
    ResultSet rs3=st2.executeQuery("select substages from substage_master where parent_stages='"+rs.getString(1)+"'");%>
   
      <tbody id="group<%=a_id%>" class="collapse" >
	   <%  while(rs3.next())
	    
	    {%>
	        <tr  class="collapse<%=a_id%>"  > 
	           <td style="color:blue;"><%=rs3.getString(1)%> </td>
	           
	              <%
	                 for(j=1;j<=sel_day;j++)
	                 {
	              %>
	              <td> </td>
	              <%} %>
	           
	          
	    
	    
	            </tr>
	     
	        
		   <% }%>	      
		      
		      
		      </tbody>
		     
		     
		      
	     <% }
	     con.close();
	     %>
	
	     
	

       
       
       </table>
       </div> 
       
       
       <div>
        <button type="button" id="bu" class="btn btn-danger"> Start</button>  
        <button type="button" id="bu"  class="btn btn-primary">Complete</button> 
        <button type="button" id="bu"  class="btn btn-success">Dispatch </button>  
        <button type="button" id="bu"  class="btn btn-info">Dispatch to RLY </button>     
     
  
       
       </div>
     </div>

     
     
</body>
</html>