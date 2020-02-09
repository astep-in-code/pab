require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

$("#accordionExample").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});

$('.tab-underlined').on('click', function() {
  // $('.active').removeClass('active');
  $(this).addClass('active').siblings().removeClass('active');
});

// internal imports


