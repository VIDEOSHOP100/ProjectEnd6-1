

$(document).ready(function () {

	loadProduct(1);
	
//	<table id="QuestionList" class="table table-bordered">
//	<thead>
//		<tr>
//			<th>產品編號</th>
//			<th>產品名稱</th>
//			<th>產品價格</th>
//			<th>庫存量</th>
//			<th>管理</th>
//		</tr>
//	</thead>
//	<tbody>

	   //新增產品
	    $('#buttonAdd').click(function(){
	    	var datas = $('form[name="myForm"]').serialize();
	    	$.post('ProductsInsert',datas,function(data){
	    		alert(data);	 		    		
	    		loadProduct(1);	 		    		
	    		$('#questionListSeqNo').val('');
				$('#questionListTitle').val('');
				$('#questionListArticle').val('');
				$('#questionListStatus').val('');
				$('#questionListUploadDate').val('');
				$('#managerId').val('');
				$('#questionListType').val('');
	    	});
	    })
	   
	    //讀取產品
	   function loadProduct(id){

	    	 $.getJSON('Products', { 'categoryID': id }, function (datas) {			          
		           var docFrag = $(document.createDocumentFragment());
		           var tb = $('#productTable>tbody');
		           tb.empty();
		           $.each(datas, function (idx,product) {
		               var cell1 = $('<td></td>').text(product.ProductID);
		               var cell2 = $('<td></td>').text(product.ProductName);
		               var cell3 = $('<td></td>').text(product.UnitPrice);
		               var cell4 = $('<td></td>').text(product.UnitsInStock);
		               var cell5 = $('<td></td>').html('<button class="btn btn-danger"><i class="fas fa-trash-alt"></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');

		               var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4,cell5]);
		               docFrag.append(row);
		           })
		           tb.append(docFrag);
		       })	   
	   }

	   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
		   var id = $(this).parents('tr').find('td:nth-child(1)').text();
		   $.get('ProductsDelete',{ProductID:id},function(data){
			   alert(data);
			   loadProduct(1);
		   })
	  })
	    
	   $('#productTable>tbody').on('click','tr button:nth-child(2)',function(){
		   var ProductID = $(this).parents('tr').find('td:nth-child(1)').text();
		   var ProductName = $(this).parents('tr').find('td:nth-child(2)').text();
		   var UnitPrice = $(this).parents('tr').find('td:nth-child(3)').text();
		   var UnitsInStock = $(this).parents('tr').find('td:nth-child(4)').text();
		  
		   $('#ProductID').val(ProductID).next('span').text(ProductID);
		   $('#ProductName').val(ProductName);
		   $('#UnitPrice').val(UnitPrice);
		   $('#UnitsInStock').val(UnitsInStock);
	   })
	   
	   
	   //更新產品
	   $('#buttonUpdate').click(function(){

		   var datas = $('form[name="myForm"]').serialize();
	    	$.post('ProductsUpdate',datas,function(data){
	    		alert(data);
	    		loadProduct(1);
	    		 $('#ProductID').val('').next('span').text('');
				   $('#ProductName').val('');
				   $('#UnitPrice').val('');
				   $('#UnitsInStock').val('');
	    	});
	   });

})
