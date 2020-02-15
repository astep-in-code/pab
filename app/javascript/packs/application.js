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
const beersubnav = document.getElementsByClassName("tab-underlined-beer");
var deletenavactive = () => {
  for (var i  = 0; i < beersubnav.length; i++) {
    beersubnav[i].classList.remove('active');
  }
};
for (var i  = 0; i < beersubnav.length; i++) {
  beersubnav[i].addEventListener("click", event => {
    deletenavactive();
    event.currentTarget.classList.add('active');
  });
}
