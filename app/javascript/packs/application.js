require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import $ from "jquery";
// import Chart from 'chart.js';



// internal imports

$("#accordionExample").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});


// $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//   e.target // newly activated tab
//   e.relatedTarget // previous active tab
// })


$('.tab-underlined').on('click', function(e) {
  $('.active').removeClass('active');
  // e.preventDefault();
  $(this).addClass('active').prev();
  // e.preventDefault();
});


