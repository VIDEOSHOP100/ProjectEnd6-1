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
                	var list = data.VideoBeanList;
                	var row = $('<row></row');
                	var docFrag = $(document.createDocumentFragment());
                	$.each(list,function(idx,videoBean){
                		var cell = $('<img class="col-md-3 choose">').attr('src','/EEIT/getImage/video/'+videoBean.videoSeqNo).attr('title',videoBean.videoTitle).attr('VideoSeqNo',videoBean.videoSeqNo);
                		
                		row.append(cell);
                		docFrag.append(row);
                	})
                	docFrag.append('<hr><button type="button" class="btn btn-primary btn-block" id="setVideoWallButton">確定</button>')
                	$('#content').html(docFrag).prepend('<h2>首頁管理<small style="color: #bdbdbd;font-size: 16px;">選擇想放在首頁輪播牆上的影片</small></h2>');
                	
                },

                error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError);
                },
            })

        }
        
        
    }
    
    	
//    -----------------------------------以上影片圖片選擇------------------------------------------
    	
    	$(document).on('mouseenter','.choose',function(){
    		$(this).animate({'opacity':'0.5'},200);
    		
    	})

    	$(document).on('mouseleave','.choose',function(){
    		$(this).animate({'opacity':'1'},200);
    	})

    	$(document).on('click','.choose',function(){
    		$(this).css(
    			
    			'border','5px #7700FF solid'
    		
    		).addClass('choosed').removeClass('unchoose');
    	})
    	
    	$(document).on('dblclick','.choose',function(){
    		
    		$(this).css(
    			
    			'border','none'
    		
    		).addClass('unchoose').removeClass('choosed');
    	})
    	
    	
    	
    	
    	$(document).on('click','#setVideoWallButton',function(){
    		var SeqNoList = [];
    		for(i=0;i<$('.choosed').length;i++){
    			alert($('.choosed:eq('+i+')').attr('VideoSeqNo'));
    			SeqNoList.push($('.choosed:eq('+i+')').attr('VideoSeqNo'));
    		}
    		$.ajax({
    			
    			type:'POST',
    			url:'/EEIT/setVideoWall',
    			data:{SeqNoList:JSON.stringify(SeqNoList)},
    			
    			success:function(){
    				
    				alert('更新完成');
    				$('.list-group a:first-child').trigger('click');
    			},error:function(){
    				
    			}
    			
    		})
    		
    		
    	})
    	
    	
    
})
