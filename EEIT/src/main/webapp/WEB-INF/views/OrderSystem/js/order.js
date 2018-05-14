
$(document).ready(function(){
	var upName;
	var upTel;
	var upMail;
	var upAdder;
	var cityName;
	var testVal;
	$('.down').click(function(){
		upName=$('#upName').val();
		upTel=$('#upTel').val();
		upMail=$('#upMail').val();
		upAdder=$('#upAdder').val();
		$('#downName').val(upName);
		$('#downTel').val(upTel);
		$('#downEmail').val(upMail);
		$('#downAddr').val(upAdder);
	})
	
	$('#sel1').change(function(){
		cityName=$(this).val();
		alert(cityName);
		var myUrl = "/EEIT/odergetcountry?city=" + cityName;
        

		$.ajax({
			type: 'get',
            url: myUrl,
            dataType: 'json',
			
            success: function(data, result) {
            
              var docFrag=$(document.createDocumentFragment());
              $.each(data,function(idx,country){
            	  var cell1 = $("<option></option>").val(country);
            	  docFrag.append(cell1);
              })
              $('#sel2').html(docFrag)
                
                
            },
            error: function() {
                alert('error');
            }
		})


		
	
		
	})
	

});