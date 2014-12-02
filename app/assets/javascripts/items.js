$(document).ready(function () {
  $('.alert-box').hide();
  $('#submit-item').click(function() {
    checked = $("input[type=checkbox]:checked").length;

    if(!checked) {
      $('.alert-box').slideDown();
      setTimeout(function(){$('.alert-box').slideUp();},2000);
      return false;
    }

  });
});
