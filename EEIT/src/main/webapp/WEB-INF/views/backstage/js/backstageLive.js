$(document).ready(function () {

    $('.list-group-item').click(selectCategory);
    		
    		
    	function selectCategory() {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();

        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '直播客訴') {
            $.ajax({
                type: "GET",
                url: "/EEIT/getAllLiveStreamReport",
                dataType: "json",
                timeout: 600000,
  
                success: function (data) {
                    var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">投訴編號</th><th>投訴人</th><th>被投訴人</th><th>標題</th><th>投訴時間</th><th>投訴狀態</th><th>投訴分類</th></tr></thead><tbody></tbody>');
                    $('#content>h2').after(tab);
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data, function (idx,MemberReport) {

                            var cell1 = $('<td></td>').text(MemberReport.liveStreamReportSeqNo).addClass('pointer text-primary text-center liveStreamReportSeqNo');
                            var cell2 = $('<td></td>').text(MemberReport.accountFrom);
                            var cell3 = $('<td></td>').text(MemberReport.accountTo);
                            var cell4 = $('<td></td>').text(MemberReport.reportTitle);
                            var ret = new Date(MemberReport.reportTime);
                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
                            var cell5 = $('<td></td>').text(formated);
                            var cell6 = $('<td></td>').text(MemberReport.reportStatus);
                            //應該用STRING **
                            if(MemberReport.reportType ==1){
                            	var aa = "使用暴力或恐嚇傷害他人"
                            }if(MemberReport.reportType == 2){
                            	var aa = "騷擾"
                            }if(MemberReport.reportType == 3){
                            	var aa = "仇恨行為"
                            }if(MemberReport.reportType == 4){
                            	var aa = "色情或性暗示內容"
                            }if(MemberReport.reportType == 5){
                            	var aa = "其他違反服務條款的行為"
                            }if(MemberReport.reportType == 6){
                            	var aa = "粗鄙的使用者名稱"
                            }if(MemberReport.reportType == 7){
                            	var aa = "極端暴力、血腥或淫褻的內容"
                            }
                            var cell7 = $('<td></td>').text(aa);
                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6,cell7]);

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
    
    $(document).on("click",'.liveStreamReportSeqNo',function(){
    	mrSN = $(this).text();
    	    	
    	$('#content').empty();
    	    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/liveStreamReport/" + mrSN,
    		
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
    							'<form:form method="POST" modelAttribute="liveStreamReportBean" class = "form-horizontal">' + 
    							'<textarea id="replyliveStreamContent" path="replyContent" class="form-control" rows="3"></textarea>' + 
    							'<button class = "btn btn-primary" id = "replyliveStreamReportButton">回覆檢舉</button>' +
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
    
    
    $(document).on("click",'#replyliveStreamReportButton',function(){
    	
    	
    	var reply = $('#replyliveStreamContent').val();
    	
    	$.ajax({
    		
    		type:"POST",
    		url:"/EEIT/replyliveStreamReport",
    		data:{ _method : "PUT" ,liveStreamReportSeqNo:mrSN ,replyContent:reply},
    		
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
