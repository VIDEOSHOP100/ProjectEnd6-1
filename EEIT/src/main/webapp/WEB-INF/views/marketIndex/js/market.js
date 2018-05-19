$(document).ready(function(){
	

	$('.cate > ul > .list-group-item-action').click(function(){
		buttonType=$(this).val(); 
		var myUrl = "/EEIT/goMarketHomePage/selectProByType/" + buttonType;
		$('.productstart').remove();
		
		$.ajax({
			type: 'get',
            url: myUrl,
            dataType: 'json',
			success: function (data) {
				$.each(data.productByType,function(key, productBean){
					
				var product = '<div class="col-lg-3 col-md-6 mb-4 productstart">'+
					'<div class="card">'+
					'<a href="/EEIT/searchProductIntro/'+productBean.productSeqNo+'">'+
					'<img height="238px" class="card-img-top" src="/EEIT/getImage/Product/'+productBean.productSeqNo+
					'">'+'</a>'+
					'<div class="card-body">'+
					'<h4 class="card-title JQellipsisTitle">'+productBean.proName+'</h4>'+
					'<p class="card-text">限時特價  $NT '+productBean.proPrice+' </p>'+
					'<p class="card-text JQellipsis">'+productBean.proDescription+' </p>'+
					'</div><div class="card-footer">'+
					'<a href="/EEIT/searchProductIntro/'+productBean.productSeqNo+'"'+
						'class="btn btn-primary">點我購買~</a>'+	'</div></div></div>'
			
					var	dor = $('.prorow');
					dor.prepend(product);	
				})
				
				var len = 15; // 超過50個字以"..."取代
			    $(".JQellipsis").each(function(i){
			        if($(this).text().length>len){
			            $(this).attr("title",$(this).text());
			            var text=$(this).text().substring(0,len-1)+"...";
			            $(this).text(text);
			        }
			    });
				
			    var len = 10; // 超過50個字以"..."取代
			    $(".JQellipsisTitle").each(function(i){
			        if($(this).text().length>len){
			            $(this).attr("title",$(this).text());
			            var text=$(this).text().substring(0,len-1)+"...";
			            $(this).text(text);
			        }
			    });
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		
		
		})
		
		
		
	})

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})