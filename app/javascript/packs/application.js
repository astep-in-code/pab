require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import $ from "jquery";
// import Chart from 'chart.js';



// ---- internal imports ---- //


// Show Beers
$("#accordionExample").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});

// Dash Brassin : Timeline

$("#accordionDash").on("hide.bs.collapse show.bs.collapse", e => {
  $(e.target)
    .prev()
    .find("i:last-child")
    .toggleClass("fa-minus fa-plus");
});

// Div cliquable
$(".myDash").click(function() {
  window.location = $(this).find("a").attr("href");
  return false;
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
if (document.getElementById('clickme') != null){
  // document.getElementById('clickme').addEventListener('click', (event) => {
  //   sendOnSubmitSearch();
  // });
  document.addEventListener('DOMContentLoaded', (event) => {
    sendOnSubmitSearch();
  });
};

import { sendOnSearchData } from '../component/_searchData.js';
if (document.getElementById('clickdata') != null){
  document.getElementById('clickdata').addEventListener('click', (event) => {
    sendOnSearchData();
  });
};

import { sendOnSubmitToDB } from '../component/_sendToDB.js';
if (document.getElementById('clicktoDB') != null){
document.getElementById('clicktoDB').addEventListener('click', (event) => {
    sendOnSubmitToDB();
  });
};

// BrewSteps
import { brewStepsGestion } from '../component/_brews.js';
let val = brewStepsGestion();

// Timer
import { getmyelementid } from '../component/_timer.js';
let countdown = getmyelementid();
