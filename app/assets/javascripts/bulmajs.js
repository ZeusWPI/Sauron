jQuery(document).ready(function ($) {
  $('.nav-toggle').click(function() {
    $('.nav-menu').toggleClass('is-active');
    $('.nav-toggle').toggleClass('is-active');
  });
});
