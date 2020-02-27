const brewStepsGestion = () => {
  if (document.getElementById('card')) {
    substep_navigation();
  };
};
const substep_navigation = () => {
  var sub_steps = document.getElementsByClassName("substep");
  // var current_substep = document.getElementById("card").dataset.value;
  var current_substep = 0;
  var mySubStep = parseInt(current_substep, 10);
  var button_next = document.getElementById("next-substep");
  var button_next_step = document.getElementById("next-step");
  var button_previous = document.getElementById("previous-substep");

  document.addEventListener("DOMContentLoaded", event => {
    sub_steps[mySubStep].style.display = "block";
  });


  button_next.addEventListener("click", event => {
    event.preventDefault();
    next(current_substep);
  });

  button_previous.addEventListener("click", event => {
    event.preventDefault();
    previous(current_substep);
  });

  const displayNone = () => {
    for (var i = 0; i < sub_steps.length; i++) {
      sub_steps[i].style.display = "none";
    }
  }

  var next = (current_substep) => {
    if (mySubStep < sub_steps.length - 1) {
      button_previous.classList.remove('disabled');
      mySubStep += 1;
      console.log(mySubStep);
      displayNone();
      sub_steps[mySubStep].style.display = "block";
    }
    if (mySubStep == sub_steps.length - 1){
      button_next.style.display = "none";
      button_next_step.style.display = "block";
    }
  }

  var previous = (current_substep) => {

    if (mySubStep > 0) {
      button_next.classList.remove('disabled');
      mySubStep -= 1;
      console.log(mySubStep);
      displayNone();
      sub_steps[mySubStep].style.display = "block";
      button_next.style.display = "block";
      button_next_step.style.display = "none";
    }
    if (mySubStep == 0) {
      button_previous.classList.add('disabled');
    }
  }
  // subSteps();
}

export { brewStepsGestion };
