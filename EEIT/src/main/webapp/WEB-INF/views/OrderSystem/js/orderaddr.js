$(document).ready(function(){
	var upName=$('#upName');
	var upTel=$('#upTel');
	var upHomeTel=$('#upHomeTel');
	var upMail=$('#upMail');
	var upAddr=$('#upAddr');
	var cityName;
	var testVal;
	var upcity;
	var upcountry;
	//表格同上Button
	$('.down').click(function(){
		upName.val();
		upTel.val();
		upHomeTel.val();
		upMail.val();
		upAddr.val();
		$('#downName').val(upName.val());
		$('#downTel').val(upTel.val());
		$('#downHomeTel').val(upHomeTel.val());
		$('#downEmail').val(upMail.val());
		$('#downAddr').val(upAddr.val());
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

	
	//一鍵demo
	$('.Demo').click(function(){
		upName.val('彭魚雁');
		upTel.val('0921567432');
		upHomeTel.val('02-33291938');
		upMail.val('marketuser@gmail.com');
	})
});