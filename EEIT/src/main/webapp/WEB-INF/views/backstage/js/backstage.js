$(document).ready(function() {

    $('.list-group-item').click(function(){

        $('.list-group-item').removeClass('bg-primary').removeClass('text-white').addClass('text-primary');
        $(this).removeClass('text-primary').addClass('bg-primary').addClass('text-white');
        var title = $(this).text();

        $('#content > h2').text(title);
        $('#content> p').remove();

        $.ajax



    })



})
