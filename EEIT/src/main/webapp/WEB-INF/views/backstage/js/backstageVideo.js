$(document).ready(function () {

	$('.list-group a:first-child').trigger('click');
	
	
    $('.list-group-item').click(selectCategory);
    		
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();

        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '影片客訴') {
            $.ajax({
                type: "GET",
                url: "/EEIT/getAllVideoReport",
                dataType: "json",
                timeout: 600000,
   
                success: function (data) {
                    var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">投訴編號</th><th>投訴人</th><th>影片標題 </th><th>種類</th><th>投訴時間</th><th>投訴狀態</th></tr></thead><tbody></tbody>');
                    $('#content>h2').after(tab);
                        var docFrag = $(document.createDocumentFragment());
                        var video = data.VideoList;
                        
                        $.each(data.VideoReportList, function (idx,VideoReport) {
  
                            var cell1 = $('<td></td>').text(VideoReport.videoReportSeqNo).addClass('pointer text-primary text-center VideoReportSeqNo');
                            var cell2 = $('<td></td>').text(VideoReport.account);
                            var cell3 = $('<td></td>').text(VideoReport.videoTitle);
                            var cell4 = $('<td></td>').text(VideoReport.videoReportType);
                            var ret = new Date(VideoReport.videoReportDate);
                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
                            var cell5 = $('<td></td>').text(formated);
                            if(VideoReport.videoReportStatus == 'pending'){
                            	var cell6 = $('<td></td>').text('處理中');
                            }else{
                            	var cell6 = $('<td></td>').text('已處理');
                            }

                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);

                            docFrag.append(row);

                        })
                         $('#content tbody').html(docFrag);
                },

                error: function (xhr, ajaxOptions, thrownError) {
                },
            })

        }
        
        
    }
    
//   ---------------------------------以上功能列選擇------------------------------------- 

    
    	var vrSN;
    
    $(document).on("click",'.VideoReportSeqNo',function(){
    	vrSN = $(this).text();
    	    	
    	$('#content').empty();
    	    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/getVideoReport/" + vrSN,
    		
    		success:function(datas){
    			var data = datas.VideoReport;
    			var videoTitle = datas.videoTitle;
    			var ret = new Date(data.videoReportDate);
    			var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
    			var format = $('<container></container>').html(
    					'<row>' +
    						'<div class="col-lg-8">' +
    							'<h2 class="mt-4">' + data.videoReportType + '</h2>' +
    							'<p class="lead"> 檢舉人 : ' +  
    								'<a  target="_blank" href="/EEIT/profile/' +data.account + '">' + data.account + '</a>' + 
    								'  被檢舉影片: ' + 
    								'<a  target="_blank" href="/EEIT/videoRoom/' +data.videoSeqNo + '">' + videoTitle + '</a>' +
    							'</p>' +
    							'<p>Posted on' + formated + '</p><hr>' +
    							'<p>' + data.videoReportArticle +'</p><hr>' +
    							'<div class="card my-4"><h5 class="card-header">回覆檢舉</h5><div class="card-body">' +
    							'<form:form method="POST" action="/replyVideoReport" modelAttribute="VideoReportBean" class = "form-horizontal">' + 
    							'<textarea id="replyVRContent" path="videoReportReply" class="form-control" rows="3"></textarea>' + 
    							'<button class = "btn btn-primary" id = "replyVideoReportButton">回覆檢舉</button>' +
    							'</form>' +
    							'</div>'+
    							'</div>'+
    							'</div>'+
    					'</row>'
    			
    				) 
    					
    				$('#content').append(format);
      				
    		},
    		error: function (xhr, ajaxOptions, thrownError) {
        
            
        },
   
    		
    	})
  	
    })
    
    
    $(document).on("click",'#replyVideoReportButton',function(){
    	
    	
    	var reply = $('#replyVRContent').val();
    	
    	$.ajax({
    		
    		type:"POST",
    		url:"/EEIT/replyVideoReport",
    		data:{ _method : "PUT" , videoReportSeqNo:vrSN , videoReportReply:reply},
    		
    		success:function(){
    		
    			alert('回覆投訴完成!');
    			$('.bg-primary').trigger("click");
    		
    		},
    		
    		error:function(e){
    		}
    		
    	})
    	
    })
    
})
