$(document).ready(function () {
	var numb = null;
	
    $('.list-group-item').click(selectCategory);
    		
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();

        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '問答集管理') {
            $.ajax({
                type: "GET",
                url: "/EEIT/QuestionList/getAllQuestionList",
                dataType: "json",
                timeout: 600000,
   
                success: function (data) {
                    var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">問題編號</th><th>編輯人員</th><th>問題類型</th><th>標題</th><th>上傳時間</th><th>是否顯示</th></tr></thead><tbody></tbody>');
                    $('#content>h2').after(tab).after('<a href =" /EEIT/QuestionList/addQuestionList">新增問題</a>');
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data, function (idx,QuestList) {
                        	numb =  QuestList.questionListSeqNo;
                        	console.log(numb);
                            var cell1 = $('<td data-toggle="modal" data-target="#exampleModal"></td>').text(QuestList.questionListSeqNo).addClass('pointer text-primary text-center questionListSeqNo');
                            $('#updateQList > #QSeqNum').val(QuestList.questionListSeqNo);
//                            alert('#updateQList > #QSeqNum')
                            var cell2 = $('<td></td>').text(QuestList.managerId);
                           
                            if(QuestList.questionListType == 1){
                            	var cell3 = $('<td></td>').text("帳號問題");
                            }else if(QuestList.questionListType == 2){
                            	var cell3 = $('<td></td>').text("密碼與登入");
                            }else if(QuestList.questionListType == 3){
                            	var cell3 = $('<td></td>').text("建立帳號與刪除帳號");
                            }else if(QuestList.questionListType == 4){
                            	var cell3 = $('<td></td>').text("商品交易");
                        	}else if(QuestList.questionListType == 5){
                        		var cell3 = $('<td></td>').text("直播拍賣");
                        	}else if(QuestList.questionListType == 6){
                        		var cell3 = $('<td></td>').text("影片上傳");
                        	}else if(QuestList.questionListType == 7){
                        		var cell3 = $('<td></td>').text("聯絡我們");
                        	}
                            
                            var cell4 = $('<td></td>').text(QuestList.questionListTitle);
                            
                            var ret = new Date(QuestList.questionListUploadDate);
                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
                            var cell5 = $('<td></td>').text(formated);
                            
                            if(QuestList.questionListStatus == 1){
                            	var cell6 = $('<td></td>').text("顯示");
                            }else{
                            	var cell6 = $('<td></td>').text("不顯示");
                            }

                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);

                            docFrag.append(row);
                            
                           })
                         $('#content tbody').html(docFrag);
                    },

                        error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError);
                    },
               })
  
          }
              
    }
    
//   ---------------------------------以上功能列選擇------------------------------------- 
   $(document).on("click",'.btn btn-primary',function(){
	
    });
    	
    
    


   var dialog, form;
    
    $(document).on("click",'.questionListSeqNo',function(){
    	mrSN = $(this).text();
//    	alert($(this).parent('tr').children('td:eq(0)').text());
//    	alert($(this).parent('tr').children('td:eq(1)').text());
//    	alert($(this).parent('tr').children('td:eq(2)').text());
//    	alert($(this).parent('tr').children('td:eq(3)').text());
//    	alert($(this).parent('tr').children('td:eq(4)').text());
//    	alert($(this).parent('tr').children('td:eq(5)').text());
    	
    	$('input[name="managerId"]').val($(this).parent('tr').children('td:eq(1)').text());
    	$('input[name="questionListTitle"]').val($(this).parent('tr').children('td:eq(3)').text());
//    	$('input[name="questionListArticle"]').val($(this).parent('tr').children('td:eq(3)').text());
    	$('input[name="questionListType"]').val($(this).parent('tr').children('td:eq(2)').text());
    	$('input[name="questionListStatus"]').val($(this).parent('tr').children('td:eq(5)').text());
    	
//    	alert();
    	dialog = $('#insert-dialog-form').dialog({
    		autoOpen : false,
    		height : 600,
    		width : 400,
    		modal : true,
    		buttons : {
//    			"確定新增圖片" : inserthotproduct,
    			Cancel : function() {
    				dialog.dialog("close");
    			}
    		},
    		close : function() {
    			form[0].reset();
//    			allFields.removeClass("ui-state-error");
    		}
    	});
    	form = dialog.find("form").on("submit",function(event) {
    		event.preventDefault();
    		alert('aaaaa');
    		$.ajax({
        		type:"POST",
        		url:"/EEIT/QuestionList",
        		success:function(data){
        			alert('OK')
        		},
        		error: function (xhr, ajaxOptions, thrownError) {
        		},
        	})
    	});
    	
    	
    	
//    	-----------------------------------
    	var mrSN;

    	$('#QSeqNum').val(mrSN);
    	    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/QuestionList/updateQuestionList/" + mrSN,
    		
    		
    		success:function(data){
    			var ret = new Date(data.questionListUploadDate);
    			var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
    			var format = $('<container></container>').html(
    					
    			
    				) 
    					
    				$('#content').append(format);
      				
    		},
    		error: function (xhr, ajaxOptions, thrownError) {
        
                alert(thrownError);
            
    		},
   
    		
    	})
  	
    })
    
    
    $(document).on("click",'#updateQuestListButton',function(){
    	
//    	alert('aaaa')
//    	var questionListSeqNo = $('input[name="questionListSeqNo"]').val();
//    	var questionListTitle = $('input[name="managerId"]').val();
//    	var questionListStatus = $('input[name="questionListTitle"]').val();
//    	var questionListUploadDate = $('input[name="questionListArticle"]').val();
//    	var managerId = $('input[name="questionListType"]').val();
//    	var questionListType = $('input[name="questionListStatus"]').val();
    	var form = $('#updateQList')[0];
		var data = new FormData(form);
		console.log(data)
		console.log(form)
		
//    	alert('bbbb')
    	$.ajax({
    		
    		type:"POST",
    		url:"/EEIT/QuestionList/update",
			cache: false,
	        contentType: false,
	        processData: false,
	        timeout: 600000,
	        enctype: 'multipart/form-data',
    		data:data,
    		success:function(){
    		
    			alert('選項修改完成!');
    			$('.bg-primary').trigger("click");
    			$('.modal').removeClass('show')
    			$('#cancel').trigger("click");
    		},
    		
    		error:function(e){
    			alert(e);
    		}
    		
    	})
    	
    })

})
