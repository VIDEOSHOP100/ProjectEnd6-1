$(document).ready(function () {

    $('.list-group-item').click(selectCategory);
    		
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();

        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '首頁管理') {
            $.ajax({
                type: "GET",
                url: "/EEIT/getHomePageManage",
                dataType: "json",
                timeout: 600000,
  
                success: function (data) {
                	
                },

                error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError);
                },
            })

        }
        
        
    }
    
//   ---------------------------------以上功能列選擇------------------------------------- 

    
    	var mrSN;
    
    $(document).on("click",'.memberReportSeqNo',function(){
    	mrSN = $(this).text();
    	    	
    	$('#content').empty();
    	    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/memberReport/" + mrSN,
    		
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
    
})
