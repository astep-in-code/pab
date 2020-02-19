var sub_steps = document.getElementsByClassName("substep");
var current_substep = document.getElementsByClassName("card")[0].dataset.value;
var mySubStep = parseInt(current_substep, 10);
var button_next = document.getElementById("next-substep");
var button_previous = document.getElementById("previous-substep");

document.addEventListener("DOMContentLoaded", event => {
  sub_steps[mySubStep].style.display = "block";
});

const subSteps = () => {
  button_next.addEventListener("click", event => {
    event.preventDefault();
    next(current_substep);
  });

  button_previous.addEventListener("click", event => {
    event.preventDefault();
    previous(current_substep);
  });
};

const displayNone = () => {
  for (var i = 0; i < sub_steps.length; i++) {
    sub_steps[i].style.display = "none";
  }
}

var next = (current_substep) => {
  if (mySubStep < sub_steps.length) {
    button_previous.classList.remove('disabled');
    mySubStep += 1;
    displayNone();
    sub_steps[mySubStep].style.display = "block";
  } else if (mySubStep == sub_steps.length){

  }
}

var previous = (current_substep) => {
  if (mySubStep > 0) {
    mySubStep -= 1;
    displayNone();
    sub_steps[mySubStep].style.display = "block";
  } else if (mySubStep == 0) {
    button_previous.classList.add('disabled');
  }
}

export { subSteps };
