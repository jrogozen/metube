$(document).ready(function() {
  $('.text-box').keypress(function(e) {
    if (e.which === 13) {
      e.preventDefault();
      $('form').submit();
    }
  });
});