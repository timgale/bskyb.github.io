$(function () {
  $('#main-nav-tabs').inPageNav();

  var circlecontainer = $('.circlecontainer'),
  image = circlecontainer.find('img');
  circlecontainer.width(image.height());
});