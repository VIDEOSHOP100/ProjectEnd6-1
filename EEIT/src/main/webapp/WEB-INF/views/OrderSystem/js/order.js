
$(document).ready(function(){
	var upName;
	var upTel;
	var upMail;
	var upAddr;
	var cityName;
	var testVal;
	var upcity;
	var upcountry;
	$('.down').click(function(){
		upName=$('#upName').val();
		upTel=$('#upTel').val();
		upMail=$('#upMail').val();
		upAddr=$('#upAddr').val();
		$('#downName').val(upName);
		$('#downTel').val(upTel);
		$('#downEmail').val(upMail);
		$('#downAddr').val(upAddr);
	})
	
	$('#sel1').change(function(){
		cityName=$(this).val();
		
		var myUrl = "/EEIT/odergetcountry?city=" + cityName;

		$.ajax({
			type: 'get',
            url: myUrl,
            dataType: 'json',
			
            success: function(data, result) {
            
            	$("#sel2 option").remove();
            	var cell1 = $("<option value=''>" + "請選擇" + "</option>");         	 
            	$('#sel2').append(cell1);
            	$.each(data.countrylist,function(idx,country){
            			var cell2 = $("<option value='"+ country + "'>" + country + "</option>");         	 
            		$('#sel2').append(cell2);
            	})//.each結束             
      
            },//success結束
            error: function() {
                alert('error');
            }
		})
	})//sel1 change事件結束
	
	$('#sel2').change(function(){
		 upcity=$('#sel1').val();
		upcountry=$('#sel2').val();
		$('input[name="textaddr"]').val(upcity+upcountry);
		})

});