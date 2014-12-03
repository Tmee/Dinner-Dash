$(document).ready(function() {

  $("input[name='delivery_method']").click(function(){
   $("#delivery-form").removeClass('hidden');   
  });

  $("input[id='radio-pickup']").click(function(){
   $("#delivery-form").addClass('hidden');   
  });

});