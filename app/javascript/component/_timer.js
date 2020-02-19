var getmyelementid = () => {
  var startbuttons = document.querySelectorAll(".start");
  for (const startbutton of startbuttons){
    startbutton.addEventListener('click', event => {
      timer(event.currentTarget.dataset.value, 0);
    })
  }
};

var timer = (substepId, running) => {
  console.log(running);
  var elementId = "timer" + substepId;
  console.log(elementId);
  var value = document.getElementById(elementId).dataset.value * 1000;
  var countDownDate = new Date().getTime() + value;
  if (running == 0) {
    var x = setInterval(function() {
      var running = 1;
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      document.getElementById(elementId).innerHTML =  minutes + "m " + seconds + "s ";
      var stopbutton = document.getElementById("stop" + substepId);
      stopbutton.addEventListener("click", event => {
        clearInterval(x);
      });
      if (distance < 0) {
        clearInterval(x);
        document.getElementById(elementId).innerHTML = "Passez à l'étape suivante";
      }
    }, 1000);
  }
};

export { getmyelementid };
