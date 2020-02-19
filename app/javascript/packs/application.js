require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import $ from "jquery";
// import Chart from 'chart.js';



// ---- internal imports ---- //
import { subSteps } from '../component/_brews.js';
let val = subSteps();

import { getmyelementid } from '../component/_timer.js';
let countdown = getmyelementid();

// Show Beers
$("#accordionExample").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});


// Show Beer + Display Bloc logic with Nav Tab-underlined
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
  });
}

// Ispindle
import { sendOnSubmitSearch } from '../component/_ispindle.js';
sendOnSubmitSearch;
