$(document).ready(function () {

    $('.list-group-item').click(function () {

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        $('#content').empty();

        var title = $(this).text();

        $('#content').prepend($('<h2></h2>').text(title));
        $('#content> p').remove();
        if (title == '會員客訴') {
            $.ajax({
                type: "GET",
                url: "/EEIT/getAllMemberReport",
                dataType: "json",
                timeout: 600000,
  
                success: function (data) {
                    var tab = $('<table></table>').addClass('table table-striped').html('<thead><tr><th class="text-center">投訴編號</th><th>投訴人</th><th>被投訴人</th><th>標題</th><th>投訴時間</th><th>投訴狀態</th></tr></thead><tbody></tbody>');
                    $('#content>h2').after(tab);
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data, function (idx,MemberReport) {

                            var cell1 = $('<td></td>').text(MemberReport.memberReportSeqNo).addClass('pointer text-primary text-center memberReportSeqNo');
                            var cell2 = $('<td></td>').text(MemberReport.accountFrom);
                            var cell3 = $('<td></td>').text(MemberReport.accountTo);
                            var cell4 = $('<td></td>').text(MemberReport.reportTitle);
                            var ret = new Date(MemberReport.reportTime);
                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
                            var cell5 = $('<td></td>').text(formated);
                            var cell6 = $('<td></td>').text(MemberReport.reportStatus);

                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);

                            docFrag.append(row);

                        })
                        $('#content tbody').html(docFrag);
                },

                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
            })

        }

    })
    
//   ---------------------------------以上功能列選擇------------------------------------- 
    
    
    $('.memberReportSeqNo').click(function(){
    	alert("DD");
    	var mrSN = $(this).text();
    	alert(mrSN);
    	
    	$('#content').empty();
    	
    	
    	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/memberReport/" + meSN,
    		dataType: "json",
    		
    		success:function(data){
    			
    			alert(data);
    			
    		},
    		error: function (xhr, ajaxOptions, thrownError) {
        
                alert(thrownError);
            
        },
    		
    		
    		
    		
    		
    	})
    	
    	
    	
    	
    	
    	
    	
    	
    	
    
    
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

})
