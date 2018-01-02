$(document).ready(function(){
  $('.tab').on('click', function(){
    var target = $(this).data('target');

    $('.tab').removeClass('active');
    $(this).addClass('active');

    $('.tab-content').addClass('hidden');
    $(target).removeClass('hidden')
  })
})