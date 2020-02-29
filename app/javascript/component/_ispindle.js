const sendOnSubmitSearch = () => {

  const inputSearchTemperature = 'temperature';
  const inputSearchDensity = 'gravity';
  // let inputNameApp = document.getElementById('nameIspindle').value;
  let inputNameApp = "ispindel_";
  // let tokenSearch = document.getElementById('token').value;
  let tokenSearch = "BBFF-GvDLGepz14b4F7ivNDNnWh3Z4Btn6EEaWqd2rhvzq9jbbaSVMwtksYF";
  let temp_target_input = document.getElementById('temp_target').value;
  let dens_target_input = document.getElementById('dens_target').value;
  let collect_time_t = [];
  let collect_time_d = [];
  let collect_temp = [];
  let collect_dens = [];
  // building request (Temperature)
  let url = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchTemperature}/values/?token=${tokenSearch}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      const resultPage = data.next;
      console.log(resultPage);
      const resultsIspindle = data.results;
        // console.log(resultsIspindle)
        for (let i = 0; i < resultsIspindle.length; i++ ) {
          collect_time_t.push(resultsIspindle[i].timestamp);
          collect_temp.push(resultsIspindle[i].value);
        };
    console.log('First Page of Temp');
    console.log(collect_time_t);
    console.log(collect_temp);

    var array_h_temp = [];
    var array_h_temp_target = [];
    var temp_target = temp_target_input;
    var temp = collect_temp;
    var date = collect_time_t;

    for (let i=0; i < temp.length; i++){
      array_h_temp.push({x: date[i], y: parseFloat(temp[i])});
      array_h_temp_target.push({x: date[i], y: temp_target });
    };
    console.log(array_h_temp);
    console.log(array_h_temp_target);

    console.log('oki');

    const colors = {
      green: {
        fill: '#e0eadf',
        stroke: '#5eb84d',
      },
      lightBlue: {
        stroke: '#6fccdd',
        fill: '#6fccdd',
      },
      darkBlue: {
        fill: '#92bed2',
        stroke: '#3282bf',
      },
      purple: {
        fill: '#8fa8c8',
        stroke: '#75539e',
      },
    };

    var ctx = document.getElementById("myChartTemp");
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        datasets: [
          {
            label: 'Temperature constatée',
            data: array_h_temp,
            showLine: true,
            fill: false,
            borderColor: colors.darkBlue.stroke,
            backgroundColor: colors.lightBlue.fill
          },
          {
            label: 'Temperature cible',
            data: array_h_temp_target,
            showLine: true,
            fill: false,
            borderColor: 'red'
          }
        ]
      },
      options: {
        tooltips: {
          mode: 'index',
          intersect: false,
        },
        hover: {
          mode: 'nearest',
          intersect: true
        },
        scales: {
          xAxes: [{
          type: 'time',
          time: {
              parser: 'D MMM HH:mm',
              unit: 'minute',
              displayFormats: {
                  'minute': 'D MMM HH:mm',
                  'hour': 'D MMM HH:mm'
              }
          },
        }],
          yAxes: [{
              ticks: {
                  suggestedMin: 19
              }
          }]
        },
      }
    });
  });


  // building request (Density)
  let url2 = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchDensity}/values/?token=${tokenSearch}`;
  fetch(url2)
    .then(response => response.json())
    .then((dataD) => {
      // console.log(data)
      const resultPageDens = dataD.next;
      console.log(resultPageDens);
      const resultsIspindle3 = dataD.results;
        // console.log(resultsIspindle)
        for (let i = 0; i < resultsIspindle3.length; i++ ) {
          collect_dens.push(resultsIspindle3[i].value);
          collect_time_d.push(resultsIspindle3[i].timestamp);
        };
      console.log('First Page.. Density');
      console.log(collect_dens);
      console.log(collect_time_d);

      var array_dens = [];
      var array_h_dens = [];
      var array_h_dens_target = [];
      var dens_cible = dens_target_input;
      var dens = collect_dens;
      var date = collect_time_d;

      for (let i=0; i < date.length; i++){
        array_h_dens.push({x: date[i], y: dens[i]});
        array_h_dens_target.push({x: date[i], y: dens_cible });
      };
      console.log(array_h_dens);
      console.log(array_h_dens_target);

      var ctx = document.getElementById("myChartDens");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          datasets: [
            {
              label: 'Density constatée',
              data: array_h_dens,
              showLine: true,
              fill: false,
              borderColor: '#3FBF7F'
            },
            {
              label: 'Density cible',
              data: array_h_dens_target,
              showLine: true,
              fill: false,
              borderColor: '#3F3FBF'
            }
          ]
        },
        options: {
          tooltips: {
            mode: 'index',
            intersect: false,
          },
          hover: {
            mode: 'nearest',
            intersect: true
          },
          scales: {
            xAxes: [{
              type: 'time',
              time: {
                  parser: 'D MMM HH:mm',
                  unit: 'minute',
                  displayFormats: {
                      'minute': 'D MMM HH:mm',
                      'hour': 'D MMM HH:mm'
                  }
              },
            }],
            yAxes: [{
                ticks: {
                    suggestedMin: 1008
                }
            }]
          },
        }
      });
  });
// End of Function
};


export { sendOnSubmitSearch };
