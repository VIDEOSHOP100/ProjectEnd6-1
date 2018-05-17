$(document).ready(function () {
	

    $('.list-group-item').click(selectCategory);
    		
    var title; 
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        title = $(this).text();
        
        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '問答集管理') {
            $.ajax({
                type: "GET",
                url: "/EEIT/QuestionList/getAllQuestionList",
                dataType: "json",
                timeout: 600000,
  
                success: function (data) {
                    var btn1 = $('<div></div> ').html('<input type="button" value="新增問題"  class="btn btn-primary">').addClass('text-white');
                    var btn2 = $('<div></div> ').html('<input type="button" value="刪除問題"  class="btn btn-primary">')
                    var btn3 = $('<div></div> ').html('<input type="button" value="修改問題"  class="btn btn-primary">')
                    $('#content>h2').after(btn1,btn2,btn3);
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        	
                        
                        
                        btnJSONP.addEventListener("click",function(){
                    		var script = document.createElement('script');
                    		script.setAttribute("src","JSONP.jsp?callback=jsonHandler");
                    		
                    		document.body.appendChild(script);
                    	})
                        	
                        
//                            var cell1 = $('<td></td>').text(MemberReport.memberReportSeqNo).addClass('pointer text-primary text-center memberReportSeqNo');
//                            var cell2 = $('<td></td>').text(MemberReport.accountFrom);
//                            var cell3 = $('<td></td>').text(MemberReport.accountTo);
//                            var cell4 = $('<td></td>').text(MemberReport.reportTitle);
//                            var ret = new Date(MemberReport.reportTime);
//                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//                            var cell5 = $('<td></td>').text(formated);
//                            var cell6 = $('<td></td>').text(MemberReport.reportStatus);
//
//                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
//
//                            docFrag.append(row);
//
//                        })
//                        $('#content tbody').html(docFrag);
//                },
//
//                error: function (xhr, ajaxOptions, thrownError) {
//                        alert(thrownError);
//                },
//            })

        }

    })
    
//   ---------------------------------以上功能列選擇------------------------------------- 

    
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
//    							'<a href="/EEIT/profile/' +data.accountFrom + '">' + data.accountFrom + '</a>' + 
//    							'  被檢舉人 : ' + 
//    							'<a href="/EEIT/profile/' +data.accountTo + '">' + data.accountTo + '</a>' +
//    							'</p>' +
//    							'<p>Posted on' + formated + '</p><hr>' +
//    							'<p>' + data.reportContent +'</p><hr>' +
//    							'<div class="card my-4"><h5 class="card-header">回覆檢舉</h5><div class="card-body">' +
//    							'<form:form method="POST" action="/replyMemberReport" modelAttribute="MemberReportBean" class = "form-horizontal">' + 
//    							'<textarea id="replyMRContent" path="replyContent" class="form-control" rows="3"></textarea>' + 
//    							'<button class = "btn btn-primary" id = "replyMemberReportButton">回覆檢舉</button>' +
//    							'</form>' +
//    						'<div>' +
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
//    			
//    			
//    			
//    		},
//    		error:function(e){
//    			alert(e);
//    		}
//    		
//    		
//    		
//    		
//    		
    		
    	}
    	
    	
    }
//    
    
    
    
    
    
    
    
    
    
    
    
    

    

})
