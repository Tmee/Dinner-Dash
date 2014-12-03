$(document).ready(function () {
  $('#tim-poop').hide();
  $('#submit-item').click(function() {
    checked = $("input[type=checkbox]:checked").length;

    if(!checked) {
      $('#tim-poop').slideDown();
      setTimeout(function(){$('#tim-poop').slideUp();},2000);
      return false;
    }

  });
});
