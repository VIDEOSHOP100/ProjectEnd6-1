$(document).ready(function () {
	var dialog, form;
	var selectedDeletedSeqNo;
	var selectedtbodyOutside;
	var dialogDel;
	
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
	
	dialogDel = $('#delete-dialog-form').dialog({
		autoOpen : false,
		height : 400,
		width : 350,
		modal : true,
		buttons : {
			"確定刪除圖片" : delHotProduct,
			Cancel : function() {
				dialogDel.dialog("close");
			}
		},
		close : function() {
			form[0].reset();
			
//			allFields.removeClass("ui-state-error");
		}
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
				dialog.dialog("close");
			},
			error : function(e) {
				console.log("ERROR : ", e);
			
			}

		});
	}
	
	function delHotProduct() {
		var form = $('#deleteHotForm')[0];
		var data = new FormData(form);
		
		$.ajax({
			type : "POST",
			cache : false,
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',
			url : "/EEIT/deleteHot",
			data : data,
			timeout : 600000,
			success : function(result) {
				console.log("SUCCESS",result);
				dialogDel.dialog("close");

				selectedtbodyOutside.remove();
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
        '<button type="button" class="btn btn-info checkHot">檢視商城輪播牆的圖片</button>'+
        '<hr>'+
        '<button type="button" class="btn btn-info checkPayPro">檢視有付費的商品</button>'+
        '</div>';
		$('#content > h2').append(insertHotButton);
		
		
		
		$('.insertHot').click(function(){
			dialog.dialog("open");
		})
		
		
		
       
		
		$('.checkHot').click(function(){
			$('.marketcontain').remove();
			$.ajax({
                type: "GET",
                url: "/EEIT/findAllHot",
                dataType: "json",
                timeout: 600000,
                success: function (data) {
                    var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">圖片編號</th><th>圖片</th><th></th></thead><tbody></tbody>');
                    $('#content>h2').after(tab);
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data.HotProduct, function (idx,AllHotProduct) {
                        	var images = '<img src="/EEIT/getImage/ProductHot/'+AllHotProduct.productHotSeqNo+'"'+
    						' width="400" >';
                        	
                            var cell1 = $('<td class="divOne"></td>').text(AllHotProduct.productHotSeqNo).addClass('pointer text-center');
                            var cell2 = $('<td></td>').html(images);
                            var cell3 = $('<td></td>').html('<button class="btn btn-danger garbage"><i id="icongarbage" class="fas fa-trash-alt fa-2x"></i></button>');
                            var row = $('<tr></tr>').append([cell1,cell2,cell3]);
                        
                            docFrag.append(row);
                        })
                        $('#content tbody').html(docFrag);
                       ///垃圾桶程序開始
                        $('.garbage').click(function(){
                        
								selectedDeletedSeqNo = $(this).parents('tr')
										.find('.divOne').text();
								
								
								selectedtbodyOutside = $(this).parents('tr');
						
								$('#seqNoDelete').empty();
								$('#seqNoDelete').val(selectedDeletedSeqNo);
								dialogDel.dialog("open");
//								$('#seqNoDelete').val(
//										$.trim($(this).parents('tr').find(
//												'.divThree').text()))
												
								// $(this).parents('tr').remove
                        	
                        })
                        
                },
                error: function (xhr, ajaxOptions, thrownError) {
                        console.log(thrownError);
                },
             
            });
          
		})
	
		
			
	
	
	
	
	
	})
	
})