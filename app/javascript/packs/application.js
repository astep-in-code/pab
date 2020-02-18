require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import $ from "jquery";
// import Chart from 'chart.js';



// ---- internal imports ---- //
import { subSteps } from '../component/_brews.js';
let val = subSteps();

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


// Ispindle Datas

const form = document.querySelector('form');
const ul = document.querySelector('.list-unstyled');
const uld = document.querySelector('.list-unstyled-d');
const tokenDemo = 'BBFF-pHN344E9nnRodJqLHbjeAVrfundHeX3Pd9N0F0yGjMM8s8A2vznK0IU'

const sendOnSubmitSearch = (e) => {
  // getting user search (density or gravity allowed) => we get both data
  const inputSearchTemperature = 'temperature';
  const inputSearchDensity = 'gravity';

  // getting user name of Ispindle app
  const inputNameApp = document.getElementById('nameIspindle').value;

  // getting token from user
  const tokenSearch = document.getElementById('token').value;

  // building request (Temperature)
  const url = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchTemperature}/values/?token=${tokenSearch}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      const resultsIspindle = data.results;
      // console.log(resultsIspindle)
      resultsIspindle.forEach((e) => {
        ul.insertAdjacentHTML('beforeend',
          `<li class='resultsIspindle' data-time='${e.timestamp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchTemperature} : ${e.value}</li>`
          );
      });
    });

  // building request (Density)
  const url2 = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchDensity}/values/?token=${tokenSearch}`;
  fetch(url2)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      const resultsIspindle2 = data.results;
      // console.log(resultsIspindle)
      resultsIspindle2.forEach((e) => {
        ul.insertAdjacentHTML('beforeend',
          `<li class='resultsIspindleDensity' data-name='${inputNameApp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchDensity} : ${e.value}</li>`
          );
      });
    });
};


if (form) {
  form.addEventListener('submit', sendOnSubmitSearch);
};

