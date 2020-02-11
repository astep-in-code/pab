require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import $ from "jquery";
import Chart from 'chart.js';



// internal imports

$("#accordionExample").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});

$('.tab-underlined').on('click', function(e) {
  $('.active').removeClass('active');
  // e.preventDefault();
  $(this).addClass('active');
});
