$(document).ready(function(){
  $('.tab').on('click', function(){
    var target = $(this).data('target');

    $(this).addClass('active');
    $('.tab').removeClass('active');

    $('.tab-content').addClass('hidden');
    $(target).removeClass('hidden')
  })
})