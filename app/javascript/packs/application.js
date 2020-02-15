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
const toggleWithMenu = document.getElementsByClassName("toggleWithMenu");
var deletenavactive = () => {
  for (var i  = 0; i < beersubnav.length; i++) {
    beersubnav[i].classList.remove('active');
    toggleWithMenu[i].style.display = "none";
  }
};

for (var i  = 0; i < beersubnav.length; i++) {
  beersubnav[i].addEventListener("click", event => {
    event.preventDefault();
    deletenavactive();
    event.currentTarget.classList.add('active');

    if (event.currentTarget.innerHTML.includes('resume')){
      document.getElementById('resume').style.display = "block";
    }
    if (event.currentTarget.innerHTML.includes('ingredients')){
      document.getElementById('ingredients').style.display = "block";
    }
    if (event.currentTarget.innerHTML.includes('caracteristiques')){
      document.getElementById('details').style.display = "block";
    }
    // if (event.currentTarget.firstChild.classList == 'resume') {
    //   console.log(event);
    // }
  });
}
