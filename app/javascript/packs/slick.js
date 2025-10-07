$(document).on('turbolinks:load', function() {
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 4000,
    dots: true,
    arrows: false
  });
});