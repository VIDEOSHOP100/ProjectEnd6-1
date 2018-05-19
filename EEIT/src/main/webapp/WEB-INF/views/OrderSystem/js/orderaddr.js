$(document).ready(function(){
	var upName;
	var upTel;
	var upHomeTel
	var upMail;
	var upAddr;
	var cityName;
	var testVal;
	var upcity;
	var upcountry;
	//表格同上Button
	$('.down').click(function(){
		upName=$('#upName').val();
		upTel=$('#upTel').val();
		upHomeTel=$('#upHomeTel').val();
		upMail=$('#upMail').val();
		upAddr=$('#upAddr').val();
		$('#downName').val(upName);
		$('#downTel').val(upTel);
		$('#downHomeTel').val(upHomeTel);
		$('#downEmail').val(upMail);
		$('#downAddr').val(upAddr);
	})
	//事件結束
	
	//縣市選擇事件
	$('#sel1').change(function(){
		cityName=$(this).val();
		
		var myUrl = "/EEIT/odergetcountry?city=" + cityName;

		$.ajax({
			type: 'get',
            url: myUrl,
            dataType: 'json',
			
            success: function(data, result) {
            
            	$(".newOp").remove();
            	var cell1 = $("<option value='' hidden='hidden'>" + "" + "</option>");         	 
            	$('#sel2').append(cell1);
            	$.each(data.countrylist,function(idx,country){
            			var cell2 = $("<option class='newOp' value='"+ country + "'>" + country + "</option>");         	 
            		$('#sel2').append(cell2);
            	})//.each結束             
      
            },//success結束
            error: function() {
                alert('error');
            }
		})
	})//sel1 change事件結束
	//地區選擇事件
	$('#sel2').change(function(){
		
		 upcity=$('#sel1').val();
		
		upcountry=$('#sel2').val();
		
		$('#upAddr').val(upcity+upcountry);
	})
	//地區選擇事件結束

});