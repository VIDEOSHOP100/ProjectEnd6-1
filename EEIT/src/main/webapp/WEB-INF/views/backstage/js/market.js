$(document).ready(function () {
	var dialog, form;
	
	dialog = $('#insert-dialog-form').dialog({
		autoOpen : false,
		height : 400,
		width : 350,
		modal : true,
		buttons : {
			"確定新增圖片" : inserthotproduct,
			Cancel : function() {
				dialog.dialog("close");
			}
		},
		close : function() {
			form[0].reset();
//			allFields.removeClass("ui-state-error");
		}
	});
	form = dialog.find("form").on("submit",function(event) {
		event.preventDefault();
		
	});
	function inserthotproduct() {
		var form = $('#hotForm')[0];
		var data = new FormData(form);
		
		$.ajax({
			type : "POST",
			cache : false,
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',
			url : "/EEIT/hot.do",
			data : data,
			timeout : 600000,
			success : function(data) {
				console.log("SUCCESS : ", data);
				
			},
			error : function(e) {
				console.log("ERROR : ", e);
			
			}

		});
	}

	$('.mallManage').click(function(){
		var marketbutton=$(this);
		var title = marketbutton.text();
		var insertHotButton = '<hr><div class="container marketcontain">'+
        '<button type="button" class="btn btn-info insertHot">新增熱門商品圖片至首頁牆</button>'+
        '<hr>'+
        '<button type="button" class="btn btn-info checkPayPro">檢視有付費的商品</button>'+
        '</div>';
		$('#content > h2').append(insertHotButton);
		
		
		
		$('.insertHot').click(function(){
			dialog.dialog("open");
		})
		
		
	
	
	
	
	
	
	
	})
	
})