$(document).ready(function(){
	var upName;
	var upTel;
	var upMail;
	var upAdder;
	
	
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
	
});