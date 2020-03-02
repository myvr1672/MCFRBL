<%String cp = request.getContextPath(); %> 
<script src="<%=cp%>/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="<%=cp%>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script> 
<script>
$(document).ready(function() {
	//alert("resetting height");
	var width=$(window).width();
 	var height= $(window).height();
 	
    $('iframe').css('height', height * 1.0);
    $('iframe').css('width', width * 0.98);
    //alert("height:"+height+"  width:"+width);
    
});

</script>
<iframe src="<%=cp%>/userManual/ShiftAllotrment.pdf">
</iframe>