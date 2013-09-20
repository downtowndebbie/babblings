function checkWidth() {
  var windowSize = $(window).width();
  var $postBox =  $('.post-box img')

  if (windowSize < 768) {
  }
  else if (windowSize >= 768 && windowSize < 992) {
    $postBox.css('width', '210')
  }
  else if (windowSize >= 992 && windowSize < 1200) {
    $postBox.css('width', '284')
  }
  else if (windowSize >= 1200) {
    $postBox.css('width', '350')
  }
}

$(document).ready(function(){
  var $container = $('.masonry');

  checkWidth();

  $container.masonry({
    itemSelector        : '.post-box',
    columnWidth         : '.post-box',
    transitionDuration  : 0
  });

  $(window).resize(checkWidth);
});
