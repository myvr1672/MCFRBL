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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Shop Progress</title>
 <style>
      #b1{
          background-color:black;
          color:white;
      
         } 
         </style>
</head>
<body>

      <%
      int ar[]=new int[32];
      int adate[][]=new int[31][3]; 
      String colr="#fff";
      int k=0;
      Calendar cal=Calendar.getInstance();
      //cal.set(2019,2,8);
      Calendar calend=Calendar.getInstance();
      //calend.set(2019,2,8);
      int cur_max=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
      int i,max_prev,max_next;
      int cday= cal.get(Calendar.DATE);//Current date day
      String[] month = {"January", "February",
              "March", "April", "May", "June", "July",
              "August", "September", "October", "November",
              "December"};
	  String mon_cur=month[calend.get(Calendar.MONTH)];
	  int cur_seq=calend.get(Calendar.MONTH);
	  int cur_yr=calend.get(Calendar.YEAR);
	  calend.add(Calendar.MONTH,-1);
	  max_prev=calend.getActualMaximum(Calendar.DAY_OF_MONTH);
      String mon_prev=month[calend.get(Calendar.MONTH)];
      int prev_seq=calend.get(Calendar.MONTH);
      int prev_yr=calend.get(Calendar.YEAR);
      calend.add(Calendar.MONTH,2);
      max_next=calend.getActualMaximum(Calendar.DAY_OF_MONTH);
      String mon_next=month[calend.get(Calendar.MONTH)];
      int next_seq=calend.get(Calendar.MONTH);
      int next_yr=calend.get(Calendar.YEAR);
//       out.println(cur_yr);
//       out.println(prev_yr); 
//       out.println(next_yr);
//       out.println(max_prev);
//       out.println(cur_max);
//       out.println(max_next);
     
      %>
        <div class="table-responsive" style="height:100%;width:100%;">
      <table id="tab1" class="table table-bordered" data-spy="scroll">
       <tr>
      
        <td> 
         <form target="_self">
         <table>
         <tr>
         <td>
         <select name="coach" >
         <option selected disabled>coach type </option>
    <%DbConnection dbf=new DbConnection();
	Connection conf=dbf.getConnection();
	Statement stf=conf.createStatement();
	ResultSet rsf=stf.executeQuery("select coach_type from coach_master");
	while(rsf.next())
        { %> 
        
         <option> <%=rsf.getString(1)%> </option>
        
          
        <%}%> 
           <option>all </option>
           </select>
           </td>
           <td>
            <button id="b1" class="btn btn-xs" type=submit >Get Status</button>
            </td>
           </tr>
        </table>
         </form>
        </td>
        
       </tr>
        <%
          String coach_type=request.getParameter("coach");
         
         %>
       
       
          <%
             if(cday>=15)
             {
            	 int count=15+(cur_max-cday)+1;
             	int c2=15-(cur_max-cday);
             	int mc=1,m1,m2;
             %>
             
             
                   <%  if(cur_max==31 && cday==16)  
                      {
                	    
                       %>
                       <tr>
                         <td> Year</td>
                         <td colspan="<%=cur_max%>"> <%=cur_yr%></td>
                        </tr>
                         <tr> 
                          <td>Month </td>
                         <td align="center" colspan="<%=cur_max%>"><%=mon_cur%></td> </tr>
                    <%
                       for(i=0;i<cur_max;i++)
                       {
                    	   adate[i][0]=cur_yr;
                    	   adate[i][1]=cur_seq;
                       }
                       
                       
                       
                      }
                   
                   else if (cday == 15)
                    {
                	   int mc2,nm,dmon=cur_max-30;
                	   if(dmon>=0)
                	     mc2=30;
                	   else
                	   {
                		   mc2=30-(30-cur_max);
                		   nm=30-cur_max;
                		   
                	   }
                     %>
                        <tr>
                        <td>Year </td>
                         <% if(cur_yr==prev_yr) 
                          {
                            %>
                          
                          <td colspan=31> <%=cur_yr%></td>
                         <%
                          for(i=0;i<31;i++)
                        	   adate[i][0]=cur_yr;
                         }
                         else{ 
                          //out.println("true");
                         %>
                             <td colspan="<%=mc%>"><%=prev_yr%> </td>
                             <td colspan="<%=count%>"><%=cur_yr%> </td>
                             
                        <%
                        for(i=0;i<mc;i++)
                     	   adate[i][0]=prev_yr;
                        for(i=0;i<30;i++)
                     	   adate[i+mc][0]=cur_yr;
                        }%>
                          
                        </tr>
                	  <tr>
                	     <td>Month</td>
                	      <td colspan="<%=mc%>"><%=mon_prev%> </td>
                	      <td colspan="<%=mc2%>"><%=mon_cur%></td>
                	      <%
                	      for(i=0;i<mc;i++)
                        	  adate[i][1]=prev_seq;
                         for(i=mc;i<=mc2;i++)
                         {
                          adate[i][1]=cur_seq;
                          
                         }
                         
                          int next=i;
                	      if(dmon<0) 
                	      {
                	    	  dmon=-1*dmon;%>
                	    	  <td colspan="<%=dmon%>"><%=mon_next%></td>
                	      <% 
                	      for(i=0;i<dmon;i++)
                         	  adate[i+next][1]=next_seq;
                	      }
                	      
                	      %>
                	      </tr>
                       <%
                          
                        } 
                   else{%>
                    	<tr>
                    	  <td>Year</td>
                    	  <%
                    	   if(cur_yr == next_yr)
                    	   {	   
                    	  %>
                    	 <td align="center" colspan="<%=31%>"><%=cur_yr%></td>
                    	 <%
                    	    for(i=0;i<31;i++)
                    	    	adate[i][0]=cur_yr;
                    	   }
                    	  else
                    	  {
                    	  %>
                    	    <td align="center" colspan="<%=count%>"><%=cur_yr%></td>
                    	    <td align="center" colspan="<%=c2%>"> <%=next_yr%></td>
                    	  <%
                    	  for(i=0;i<count;i++)
                  	    	adate[i][0]=cur_yr;
                    	  for(i=0;i<c2;i++)
                    	    	adate[i+count][0]=next_yr;
                    	  
                    	  }
                    	  %>
                    	 
                    	</tr>
                    	<tr>
                    	 <td>Month </td>
                    	 <td align="center" colspan="<%=count%>"><%=mon_cur%></td>
                    	 <td align="center" colspan="<%=c2%>"> <%=mon_next%></td>
                    	</tr>
                    	
                     <%
                      for(i=0;i<count;i++)
                    	  adate[i][1]=cur_seq;
                      for(i=0;i<c2;i++)
                    	  adate[i+count][1]=next_seq;
                         }%>
                     <!-- Month and Year end here -->
                    
                       
                 
                                   
              <!-- Day for greater than 15-->
               <tr>
               <td>Days </td>
            	<%
            	 int d1=cday-15;
            	 if(d1==0)
            	 {
            		d1=1;
            	 %>	
            	   <td><%=max_prev%> </td>	
            	 <%
            	  adate[k][2]=max_prev;
            	  k++;
            	 }
            	 int d2=cur_max-cday;
            	 int left=15-d2;
            	 int start=d1;
            	 int end=cur_max;
            	 for(i=d1;i<=cday;i++)
            	 {
            		 adate[k][2]=i;
            		 k++;
            		 if(i==cday)
            		  colr="#FFFF99";	 
            		 
            	 %>
            		<td style="background-color:<%=colr%>"><%=i%></td> 
            		
            	<% }
            	 int counter=0;
            	 for(i=cday+1;i<=cur_max;i++)
            	 {
            		 adate[k][2]=i;
            		 k++;
            		 counter++;
            		 
            	 %>
             		<td><%=i %></td> 
             	<% 
             	if(counter==15)
       			 break;
            	 }
            	 for(i=1;i<=left;i++)
            	 {
            		 adate[k][2]=i;
            		 k++;
                	 %>
                 		<td><%=i %></td> 
                 	<%}%> 
              </tr>   	
            	 
            <%}
          //For day less than 15
            if(cday<15)   
            {
            	int d1=max_prev-(15-cday);
                int d2=cday+15;
                int c1=15-cday+1;
                int left=15-c1;
                    
            %>
            <tr> 
                <td>Year</td>
                <%
                 if(prev_yr==cur_yr)
                 {// out.println("true");
                  %>
                	<td colspan="<%=31%>"><%=cur_yr%></td> 
                <%
                  for(i=0;i<31;i++)
                	  adate[i][0]=cur_yr;
                 }
                 else{
                	 
                 
                %>
                <td colspan="<%=c1%>"><%=prev_yr%></td>
                <td colspan="<%=d2%>"><%=cur_yr%></td>
                <%
                for(i=0;i<c1;i++)
              	  adate[i][0]=prev_yr;
                for(i=0;i<d2;i++)
                	  adate[i+c1][0]=cur_yr;
                
                 } %>
            </tr>
             <tr>
                  <td>Month</td>
                  <td colspan="<%=c1%>"><%=mon_prev%></td>
                  <td colspan="<%=d2%>"><%=mon_cur%>  </td>
             </tr>
              <%
                 for(i=0;i<c1;i++)
                	 adate[i][1]=prev_seq;
              for(i=0;i<d2;i++)
             	 adate[i+c1][1]=cur_seq;
              %>
             <!--Days start here for less than 15 -->
             <tr>
               <td>Days </td>
             <%
              for(i=d1;i<=max_prev;i++)
              {
            	  adate[k][2]=i;
            	  k++;
              %>
            	<td><%=i%></td>  
              <%
              }
             for(i=1;i<=left;i++)
             {
            	 adate[k][2]=i;
          	      k++;
             %>
           	<td><%=i%></td>  
            <%}
             for(i=cday;i<=d2;i++)
              {
            	 adate[k][2]=i;
           	      k++;
           	      if(i==cday)
           	    	 colr="#FFFF99";
           	      else
           	    	  colr="#fff";
           	    	 
           	      
              %>
            	<td style="background-color:<%=colr %>"><%=i%></td>  
             <%}%>
             </tr>
             
            
            
            <%}
          int a_id;
          
          String color[]=new String[]{"#ff3333","#2222dd","#006400"};
	
    DbConnection db=new DbConnection();
	Connection con=db.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select stages,stage_description,stage_id from public.stage_master where stage_id<7 order by stage_id");
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
	   
	      int c,col=0,j,day,days1=cl1.getActualMaximum(Calendar.DAY_OF_MONTH);
	      String str[]=new String[3];
	      
         	  
	      for(j=0;j<31;j++)
 	      {  
	    	//  count++  
	            	   
	         	    	 
	       %>
	    	  <td>
	    	     <% //wheelset 
	    	       if(rs.getString(1).equalsIgnoreCase("Wheel"))
	    	        { 	   
	    	     ResultSet rs1=st1.executeQuery("select wheelset_transaction_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,dispatch_to,customer  from public.wheelset_tran  ");
	 	        
	    	       while(rs1.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs1.getDate(4)!=null)
	          		{
	          		  cal_db.setTime(rs1.getDate(4));
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
	          		//colr="btn btn-success btn-xs"; 
	          		}
	          	 else if(rs1.getDate(3)!=null )
	            	{
	          		cal_db.setTime(rs1.getDate(3));
	          		colr="btn btn-primary btn-xs";
	            	}
	          	else 
            	{
          		cal_db.setTime(rs1.getDate(2));
          		 colr="btn btn-danger btn-xs";
            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	  int v=cal_db.get(Calendar.MONTH);
	          	  int now1=cal_db.get(Calendar.YEAR);
	          	  
	          	    if(now1==adate[j][0] && v==adate[j][1] && day==adate[j][2] ) 
	          	    { 	
	    	         
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	           
	    	   
	    	        	           
              <button   id="stage_but" title="RBL NO:<%=rs1.getString(1) %><%out.println("\n");%>Date of mounting:<%=rs1.getDate(2)%><%out.println("\n");%>Completion Date:<%=rs1.getDate(3)%><%out.println("\n");%> <% if(rs1.getDate(4)!=null) {%>Dispatch Date: <%=rs1.getDate(4)%><%out.println("\n");%> <%if(rs1.getString(6)!=null){%>Customer:<%=rs1.getString(6)%><% }}%>"   
        	                     
        	                     
        	                 class="<%=colr%> "  >   <%=rs1.getString(1)%>   </button> 
        	         
        	                          
        	                          
        	                         <br>

        	                       
        	                        
        	                     
        	                   
        	                  <% 
	          	    }  }%>
        	                  
	    	       
	    	      <% } //Wheelset ends here
	    	        
	    	        //Bogie
	    	     if(rs.getString(1).equalsIgnoreCase("Bogie"))
	    	        { 	   
	    	     ResultSet rs2=st1.executeQuery("select bogie_set_trx_id,assembly_start_date,assembly_end_date,assembly_exit_date,dispatch_to,customer,assembly_expected_ext_date  from public.bogieset_trans  ");
	 	        
	    	       while(rs2.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs2.getDate(4)!=null)
	          	  { 
	          		    cal_db.setTime(rs2.getDate(4));
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
	          		cal_db.setTime(rs2.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		cal_db.setTime(rs2.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	 int v=cal_db.get(Calendar.MONTH);
	          	int now2=cal_db.get(Calendar.YEAR);
	          	    if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]  ) 
	            	    { 
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Bogie RBL No:<%=rs2.getString(1) %><%out.println("\n");%>Start Date:<%=rs2.getDate(2) %><%out.println("\n");%><%if(rs2.getDate(4)!=null){%>Completion Date: <%=rs2.getDate(3)%><%out.println("\n");%>Dispatch Date:<%=rs2.getDate(4)%><%out.println("\n");%><%if(rs2.getString(6)!=null){%>Customer:<%=rs2.getString(6)%><% }}else if(rs2.getDate(3)!=null){ %>Completion Date: <%=rs2.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs2.getDate(7)%><%out.println("\n");}%>" 
     	                                   class="<%=colr%>" >   <%=rs2.getString(1) %></button> 
     	                           
     	                         <br>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% 
	          	    }  }%>
     	                   
	    	       
	    	      <% } //bogie set ends here
	    	        
	    	        //Shell
	    	         if(rs.getString(1).equalsIgnoreCase("Shell"))
	    	        { 	   
	    	     ResultSet rs3=st1.executeQuery("select shell_transaction_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,shell_type,expected_exit_date  from public.shell_tran  ");
	 	        
	    	       while(rs3.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs3.getDate(4)!=null)
	          		{
	          		cal_db.setTime(rs3.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs3.getDate(3)!=null )
	            	{
	          		cal_db.setTime(rs3.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		cal_db.setTime(rs3.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	   int v=cal_db.get(Calendar.MONTH);
	          	int now2=cal_db.get(Calendar.YEAR);
	          	    if(rs3.getString(5).equalsIgnoreCase(coach_type))
	          	    {	
	          	    if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]  ) 
	            	    { 	
	    	        
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Shell Production Id:<%=rs3.getString(1) %><%out.println("\n"); %>Start Date:<%=rs3.getDate(2) %><%out.println("\n");if(rs3.getDate(4)!=null){ %>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");%>Dispatch Date:<%=rs3.getDate(4)%><%out.println("\n");}else if(rs3.getDate(3)!=null){%>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");} else{ %>Expected Completion Date:<%=rs3.getDate(6)%><%out.println("\n");}%>" 
     	                                  
     	                                 class="<%=colr%>" >   <%=rs3.getString(1) %></button> 
     	                           
     	                         <br>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% 
	          	    } } 
	          	    if(coach_type == null || coach_type.equalsIgnoreCase("all"))
	          	    {
	          	    	 if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]  ) 
		            	    { 	
		    	        
		    	        	
		    	                    	
		    	                    	 %>
		    	                    	
		    	        	            
		    	        	              
		    	   
		    	        	           
		    	         	           <button id="stage_but" title="Shell Production Id:<%=rs3.getString(1) %><%out.println("\n"); %>Start Date:<%=rs3.getDate(2) %><%out.println("\n");if(rs3.getDate(4)!=null){ %>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");%>Dispatch Date:<%=rs3.getDate(4)%><%out.println("\n");}else if(rs3.getDate(3)!=null){%>Completion Date: <%=rs3.getDate(3)%><%out.println("\n");} else{ %>Expected Completion Date:<%=rs3.getDate(6)%><%out.println("\n");}%>" 
	     	                                  
	     	                                 class="<%=colr%>" >   <%=rs3.getString(1) %></button> 
	     	                           
	     	                         <br>
	 
	     	                       
	     	                        
	     	                     
	     	                   
	     	                  <% 
		          	    }
	          	    	
	          	    }
	                
	                
	                
	                
	                
	                
	                
	                
	                }%>
     	                   
	    	       
	    	      <% }//Shell ends here. 
	    	        
	    	        //Paint Code starts here
	    	         if(rs.getString(1).equalsIgnoreCase("Paint"))
	    	        { 	   
	    	     ResultSet rs4=st1.executeQuery("select paint_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,shell_type,expected_exit_date  from public.paint_tran  ");
	 	        
	    	       while(rs4.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs4.getDate(4)!=null)
	          		{
	          		 cal_db.setTime(rs4.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs4.getDate(3)!=null )
	            	{
	          		cal_db.setTime(rs4.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		cal_db.setTime(rs4.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	   int v=cal_db.get(Calendar.MONTH);
	          	int now2=cal_db.get(Calendar.YEAR);
	          	  if(rs4.getString(5).equalsIgnoreCase(coach_type))
	          	  { 
	          	    if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2] ) 
	            	    { 	
	    	      
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Paint Asset Id:<%=rs4.getString(1) %><%out.println("\n"); %>Start Date:<%=rs4.getDate(2) %><%out.println("\n");if(rs4.getDate(4)!=null){ %> Completion Date: <%=rs4.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs4.getDate(4)%><%}else if(rs4.getDate(3)!=null){%> Completion Date: <%=rs4.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs4.getDate(6)%><%out.println("\n");}%>" 
     	                                  
     	                                 class="<%=colr%>" >   <%=rs4.getString(1) %></button> 
     	                           
     	                         <br>
 
     	                       
     	                        
     	                     
     	                   
     	                  <% 
	          	    } }
	          	  
	                 if(coach_type== null || coach_type.equalsIgnoreCase("all"))
	                 {
	                	 if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2] ) 
		            	    { 	
		    	      
		    	                    	 %>
		    	                    	
		    	        	            
		    	        	              
		    	   
		    	        	           
		    	         	           <button id="stage_but" title="Paint Asset Id:<%=rs4.getString(1) %><%out.println("\n"); %>Start Date:<%=rs4.getDate(2) %><%out.println("\n");if(rs4.getDate(4)!=null){ %> Completion Date: <%=rs4.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs4.getDate(4)%><%}else if(rs4.getDate(3)!=null){%> Completion Date: <%=rs4.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs4.getDate(6)%><%out.println("\n");}%>" 
	     	                                  
	     	                                 class="<%=colr%>" >   <%=rs4.getString(1) %></button> 
	     	                           
	     	                         <br>
	 
	     	                       
	     	                        
	     	                     
	     	                   
	     	                  <% 
		          	    }  
	                 }
	               }%>
     	                   
	    	       
	    	      <% }//Paint ends here
	    	      
	    	        //Furnishing Code starts here
	    	         if(rs.getString(1).equalsIgnoreCase("Furnishing"))
	    	        { 	   
	    	     ResultSet rs5=st1.executeQuery("select furnishing_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,shell_type,expected_exit_date  from public.furnishing_tran  ");
	 	        
	    	       while(rs5.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs5.getDate(4)!=null)
	          		{
	          		cal_db.setTime(rs5.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs5.getDate(3)!=null )
	            	{
	          		cal_db.setTime(rs5.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		cal_db.setTime(rs5.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	   int v=cal_db.get(Calendar.MONTH);
	          	int now2=cal_db.get(Calendar.YEAR);
	          	if(rs5.getString(5).equalsIgnoreCase(coach_type))
	          	{
	          	    if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]) 
	            	    { 	
	    	        
	    	        	
	    	                 %>  
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Furnishing Asset Id:<%=rs5.getString(1) %><%out.println("\n"); %>Start Date:<%=rs5.getDate(2) %><%out.println("\n");if(rs5.getDate(4)!=null){ %> Completion Date: <%=rs5.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs5.getDate(4)%><%}else if(rs5.getDate(3)!=null){%> Completion Date: <%=rs5.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs5.getDate(6)%><%out.println("\n");}%>" 
    	                                  
    	                                 class="<%=colr%>" >   <%=rs5.getString(1) %></button> 
    	                           
    	                         <br>

    	                       
    	                        
    	                     
    	                   
    	                  <% 
	          	    } }
	    	       //all
	    	         if(coach_type== null || coach_type.equalsIgnoreCase("all"))
	    	         {
	    	        	 if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]) 
		            	    { 	
		    	        
		    	        	
		    	                    	
		    	                    	 %>
		    	                    	
		    	        	            
		    	        	              
		    	   
		    	        	           
		    	         	           <button id="stage_but" title="Furnishing Asset Id:<%=rs5.getString(1) %><%out.println("\n"); %>Start Date:<%=rs5.getDate(2) %><%out.println("\n");if(rs5.getDate(4)!=null){ %> Completion Date: <%=rs5.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs5.getDate(4)%><%}else if(rs5.getDate(3)!=null){%> Completion Date: <%=rs5.getDate(3)%><%out.println("\n");}else{ %>Expected Completion Date:<%=rs5.getDate(6)%><%out.println("\n");}%>" 
	    	                                  
	    	                                 class="<%=colr%>" >   <%=rs5.getString(1) %></button> 
	    	                           
	    	                         <br>

	    	                       
	    	                        
	    	                     
	    	                   
	    	                  <% 
		          	    }  
	    	         }
	    	       
	    	       
	          	   }%>
    	                   
	    	       
	    	      <% }//Furnishing ends here  
	    	       
	    	         //Finishing starts 
	    	         if(rs.getString(1).equalsIgnoreCase("Finishing"))
	    	        { 	   
	    	     ResultSet rs6=st1.executeQuery("select finishing_asset_id,f.assembly_start_date,f.assembly_end_date,f.assembly_dispatch_date,s.shell_type from public.finishing_tran f,public.shell_tran s where f.shell_asset_id=s.shell_asset_id ");
	 	        
	    	       while(rs6.next()) 
	                {
	          	   Calendar cal_db=Calendar.getInstance();
	          	 if(rs6.getDate(4)!=null)
	          		{
	          		cal_db.setTime(rs6.getDate(4));
	          		//colr=color[2];
	          		 colr="btn btn-success btn-xs";
	          		}
	          	 else if(rs6.getDate(3)!=null )
	            	{
	          		cal_db.setTime(rs6.getDate(3));
	          		//colr=color[1];
	          		colr="btn btn-primary btn-xs";
	            	}
	          	 else
	            	{
	          		cal_db.setTime(rs6.getDate(2));
	          		// colr=color[0];
	          		colr="btn btn-danger btn-xs";
	            	}
	          	   
	          	   day=cal_db.get(Calendar.DAY_OF_MONTH); 
	          	   int v=cal_db.get(Calendar.MONTH);
	          	int now2=cal_db.get(Calendar.YEAR);
	          	if(rs6.getString(5).equalsIgnoreCase(coach_type))
	          	{	
	          	    if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]) 
	            	    { 	
	    	        
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Finishing Asset Id:<%=rs6.getString(1) %><%out.println("\n"); %>Start Date:<%=rs6.getDate(2) %><%out.println("\n"); %>Completion Date: <%=rs6.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs6.getDate(4)%>" 
    	                                  
    	                                 class="<%=colr%>" >   <%=rs6.getString(1) %></button> 
    	                           
    	                         <br>

    	                       
    	                        
    	                     
    	                   
    	                  <% 
	          	    } }
	          	  //all
	          	  if(coach_type== null || coach_type.equalsIgnoreCase("all"))
	          	  {
	          		 if(now2==adate[j][0] && v==adate[j][1] && day==adate[j][2]) 
	            	    { 	
	    	        
	    	        	
	    	                    	
	    	                    	 %>
	    	                    	
	    	        	            
	    	        	              
	    	   
	    	        	           
	    	         	           <button id="stage_but" title="Finishing Asset Id:<%=rs6.getString(1) %><%out.println("\n"); %>Start Date:<%=rs6.getDate(2) %><%out.println("\n"); %>Completion Date: <%=rs6.getDate(3)%><%out.println("\n"); %> Dispatch Date: <%=rs6.getDate(4)%>" 
 	                                  
 	                                 class="<%=colr%>" >   <%=rs6.getString(1) %></button> 
 	                           
 	                         <br>

 	                       
 	                        
 	                     
 	                   
 	                  <% 
	          	    }  
	          	  }
	          	
	          	
	          	    }%>
    	                   
	    	       
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
    ResultSet rs3=st2.executeQuery("select substages from public.substage_master where parent_stages='"+rs.getString(1)+"'");%>
   
      <tbody id="group<%=a_id%>" class="collapse" >
	   <%  while(rs3.next())
	    
	    {%>
	        <tr  class="collapse<%=a_id%>"  > 
	           <td style="color:blue;"><%=rs3.getString(1)%> </td>
	           
	              <%
	                 for(j=1;j<=31;j++)
	                 {
	              %>
	              <td> </td>
	              <%} %>
	           
	          
	    
	    
	            </tr>
	     
	        
		   <% }%>	      
		      
		      
		      </tbody>
		     
		     
		      
	     <% } con.close();%>
	   </table>
        <div>
        <button type="button" id="bu" class="btn btn-danger"> Start</button>  
        <button type="button" id="bu"  class="btn btn-primary">Complete</button> 
        <button type="button" id="bu"  class="btn btn-success">Dispatch </button> 
        <button type="button" id="bu"  class="btn btn-info">Dispatch to RLY </button>     
       </div>
        <%
//           for(i=0;i<31;i++)
//           {
//         	for(int j=0;j<3;j++)
//         	{
//         		out.print(adate[i][j]);
//         	}
//         	out.println("\n");
//           }
        %>
      </div>
</body>
</html>