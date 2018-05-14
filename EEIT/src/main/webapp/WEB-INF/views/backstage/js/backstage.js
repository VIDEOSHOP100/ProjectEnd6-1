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
                    var tab = $('<table></table>').html('<thead><tr><th>投訴編號</th><th>投訴人</th><th>被投訴人</th><th>標題</th><th>投訴時間</th><th>投訴狀態</th></tr></thead><tbody></tbody>');
                    $('#content>h2').after(tab);
                    // $.getJSON("/EEIT/getAllMemberReport", function (data) {
                        var docFrag = $(document.createDocumentFragment());
                        console.log(data);
                        $.each(data, function (idx,MemberReport) {
                            alert("Key: " + idx + ", Value: " + MemberReport);
                            alert(MemberReport.accountTo);
                            var cell1 = $('<td></td>').text(MemberReport.memberReportSeqNo);
                            var cell2 = $('<td></td>').text(MemberReport.accountFrom);
                            var cell3 = $('<td></td>').text(MemberReport.accountTo);
                            var cell4 = $('<td></td>').text(MemberReport.reportTitle);
                            var cell5 = $('<td></td>').text(MemberReport.reportTime);
                            var cell6 = $('<td></td>').text(MemberReport.reportStatus);

                            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);

                            docFrag.append(row);

                        })
                        $('#content tbody').html(docFrag);
                    // })
                },

                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
            })

        }

    })

})
