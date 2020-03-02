<html>
<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">
 var dataForGantChart=[];
		 $(document).ready(function() {
		
			$.ajax({                    
                url: 'gantChartAjaxCall',     
                type: 'GET', // performing a POST request
                async: false,
                
                dataType: 'json',
                                                                  
                })
                  .done(function( msg ) {
                	
                	// alert(msg.gantChartExample);
                     for (var i=0; i< msg.gantChartExample.length; i++) 
                      {
                    	 dataForGantChart[i]=[];
                    	 dataForGantChart[i][0]= msg.gantChartExample[i].taskId;
                    	 dataForGantChart[i][1]= msg.gantChartExample[i].taskName;
                    	 dataForGantChart[i][2]=new Date(msg.gantChartExample[i].startDate);
                    	 dataForGantChart[i][3]=new Date(msg.gantChartExample[i].endDate);
                    	 //dataForGantChart[i][3]=10;
                    	 dataForGantChart[i][4]= Math.abs( (dataForGantChart[i][2].getTime() - dataForGantChart[i][3].getTime() )/ 24 * 60 * 60 * 1000) ;
                   	 
                    	 dataForGantChart[i][5]= msg.gantChartExample[i].progressStatus;
                    	 dataForGantChart[i][6]= msg.gantChartExample[i].dependsOn;
                    
                      }
                                       
                    })	
			
	
	
    google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);
			}); 
    function daysToMilliseconds(days) {
      return days * 24 * 60 * 60 * 1000;
    }

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');

   /*   data.addRows([
        ['Research', 'Find sources',
         new Date(2015, 0, 1), new Date(2015, 0, 5), null,  100,  null],
        ['Write', 'Write paper',
         null, new Date(2015, 0, 9), daysToMilliseconds(3), 25, 'Research,Outline'],
        ['Cite', 'Create bibliography',
         null, new Date(2015, 0, 7), daysToMilliseconds(1), 20, 'Research'],
        ['Complete', 'Hand in paper',
         null, new Date(2015, 0, 10), daysToMilliseconds(1), 0, 'Cite,Write'],
        ['Outline', 'Outline paper',
         null, new Date(2015, 0, 6), daysToMilliseconds(1), 100, 'Research']
      ]); */
      
      data.addRows(dataForGantChart);

      var options = {
        height: 500
      
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
  </script>
</head>
<body>
  <div id="chart_div" style="width: 100%; height: 50%"></div>
</body>
</html>