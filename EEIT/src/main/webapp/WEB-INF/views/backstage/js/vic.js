$(document).ready(function () {

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
                    $('#content>h2').after(tab);
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data, function (idx,QuestList) {

                            var cell1 = $('<td></td>').text(QuestList.questionListSeqNo).addClass('pointer text-primary text-center questionListSeqNo');
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
 
    

    	var mrSN;
    
    $(document).on("click",'.questionListSeqNo',function(){
    	mrSN = $(this).text();
    	    	
    	$('#content').empty();
    	    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/QuestionList/" + mrSN,
    		
    		success:function(data){
    			var ret = new Date(data.reportTime);
    			var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
    			var format = $('<container></container>').html(
    					'<row>' +
    						'<div class="col-lg-8">' +
    							'<h2 class="mt-4">' + data.reportTitle + '</h2>' +
    							'<p class="lead"> 檢舉人 : ' +  
    								'<a  target="_blank" href="/EEIT/profile/' +data.accountFrom + '">' + data.accountFrom + '</a>' + 
    								'  被檢舉人 : ' + 
    								'<a  target="_blank" href="/EEIT/profile/' +data.accountTo + '">' + data.accountTo + '</a>' +
    							'</p>' +
    							'<p>Posted on' + formated + '</p><hr>' +
    							'<p>' + data.reportContent +'</p><hr>' +
    							'<div class="card my-4"><h5 class="card-header">回覆檢舉</h5><div class="card-body">' +
    							'<form:form method="POST" action="/replyMemberReport" modelAttribute="MemberReportBean" class = "form-horizontal">' + 
    							'<textarea id="replyMRContent" path="replyContent" class="form-control" rows="3"></textarea>' + 
    							'<button class = "btn btn-primary" id = "replyMemberReportButton">回覆檢舉</button>' +
    							'</form>' +
    							'</div>'+
    							'</div>'+
    							'</div>'+
    					'</row>'
    			
    				) 
    					
    				$('#content').append(format);
      				
    		},
    		error: function (xhr, ajaxOptions, thrownError) {
        
                alert(thrownError);
            
        },
   
    		
    	})
  	
    })
    
    
    $(document).on("click",'#replyMemberReportButton',function(){
    	
    	
    	var reply = $('#replyMRContent').val();
    	
    	$.ajax({
    		
    		type:"POST",
    		url:"/EEIT/memberReport",
    		data:{ _method : "PUT" ,memberReportSeqNo:mrSN ,replyContent:reply},
    		
    		success:function(){
    		
    			alert('回覆投訴完成!');
    			$('.bg-primary').trigger("click");
    		
    		},
    		
    		error:function(e){
    			alert(e);
    		}
    		
    	})
    	
    })

//    	var mrSN;
//    
//    $(document).on("click",'.memberReportSeqNo',function(){
//    	mrSN = $(this).text();
//    	    	
//    	$('#content').empty();
//    	    	
//    	$.ajax({
//    		
//    		type:"GET",
//    		url:"/EEIT/memberReport/" + mrSN,
//    		
//    		success:function(data){
//    			var ret = new Date(data.reportTime);
//    			var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//    			var format = $('<container></container>').html(
//    					'<row>' +
//    						'<div class="col-lg-8">' +
//    							'<h2 class="mt-4">' + data.reportTitle + '</h2>' +
//    							'<p class="lead"> 檢舉人 : ' +  
//    								'<a  target="_blank" href="/EEIT/profile/' +data.accountFrom + '">' + data.accountFrom + '</a>' + 
//    								'  被檢舉人 : ' + 
//    								'<a  target="_blank" href="/EEIT/profile/' +data.accountTo + '">' + data.accountTo + '</a>' +
//    							'</p>' +
//    							'<p>Posted on' + formated + '</p><hr>' +
//    							'<p>' + data.reportContent +'</p><hr>' +
//    							'<div class="card my-4"><h5 class="card-header">回覆檢舉</h5><div class="card-body">' +
//    							'<form:form method="POST" action="/replyMemberReport" modelAttribute="MemberReportBean" class = "form-horizontal">' + 
//    							'<textarea id="replyMRContent" path="replyContent" class="form-control" rows="3"></textarea>' + 
//    							'<button class = "btn btn-primary" id = "replyMemberReportButton">回覆檢舉</button>' +
//    							'</form>' +
//    							'</div>'+
//    							'</div>'+
//    							'</div>'+
//    					'</row>'
//    			
//    				) 
//    					
//    				$('#content').append(format);
//      				
//    		},
//    		error: function (xhr, ajaxOptions, thrownError) {
//        
//                alert(thrownError);
//            
//        },
//   
//    		
//    	})
//  	
//    })
//    
//    
//    $(document).on("click",'#replyMemberReportButton',function(){
//    	
//    	
//    	var reply = $('#replyMRContent').val();
//    	
//    	$.ajax({
//    		
//    		type:"POST",
//    		url:"/EEIT/memberReport",
//    		data:{ _method : "PUT" ,memberReportSeqNo:mrSN ,replyContent:reply},
//    		
//    		success:function(){
//    		
//    			alert('回覆投訴完成!');
//    			$('.bg-primary').trigger("click");
//    		
//    		},
//    		
//    		error:function(e){
//    			alert(e);
//    		}
//    		
//    	})
//    	
//    })

    
})
