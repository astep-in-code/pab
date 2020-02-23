const inputSearchTemperature = 'temperature';
const inputSearchDensity = 'gravity';


const getMyChartTemp = () => {
        var array_h_temp = [];
        var array_h_temp_target = [];
        var temp_target = <%= @beer_fermentation_temp_target %>;
        // var temp = collect_temp;
        var date = collect_time;

        for (let i=0; i < temp.length; i++){
          array_h_temp.push({x: date[i], y: parseFloat(temp[i])});
          array_h_temp_target.push({x: date[i], y: temp_target });
        };
        console.log(array_h_temp);
        console.log(array_h_temp_target);

        // array_h_temp.sort(function(a, b) {
        //   parseInt(a, 10).x - parseInt(b, 10).x;
        // });

        // console.log(array_h_temp);
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
                  parser: 'YYYY-MM-DD HH:mm:ss',
                  unit: 'minute',
                  displayFormats: {
                      'minute': 'YYYY-MM-DD HH:mm:ss',
                      'hour': 'YYYY-MM-DD HH:mm:ss'
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
};

const myChartDensFunc = () => {
  var array_dens = [];
  var array_h_dens = [];
  var array_h_dens_target = [];
  var dens_cible = <%= @beer_initial_dens %>;
  // var dens = collect_dens;
  var date = collect_time;
  // date.replace(/&quot;/g, '"');

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
              parser: 'YYYY-MM-DD HH:mm:ss',
              unit: 'minute',
              displayFormats: {
                  'minute': 'YYYY-MM-DD HH:mm:ss',
                  'hour': 'YYYY-MM-DD HH:mm:ss'
              }
          },
        }],
        yAxes: [{
            ticks: {
                suggestedMin: 1013
            }
        }]
      },
    }
  });
};

const sendOnSubmitSearch = () => {

  let inputNameApp = document.getElementById('nameIspindle').value;
  let tokenSearch = document.getElementById('token').value;
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

    // array_h_temp.sort(function(a, b) {
    //   parseInt(a, 10).x - parseInt(b, 10).x;
    // });

    // console.log(array_h_temp);
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
              parser: 'YYYY-MM-DD HH:mm:ss',
              unit: 'minute',
              displayFormats: {
                  'minute': 'YYYY-MM-DD HH:mm:ss',
                  'hour': 'YYYY-MM-DD HH:mm:ss'
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
      // date.replace(/&quot;/g, '"');

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
                  parser: 'YYYY-MM-DD HH:mm:ss',
                  unit: 'minute',
                  displayFormats: {
                      'minute': 'YYYY-MM-DD HH:mm:ss',
                      'hour': 'YYYY-MM-DD HH:mm:ss'
                  }
              },
            }],
            yAxes: [{
                ticks: {
                    suggestedMin: 1013
                }
            }]
          },
        }
      });
  });
// End of Function
};

if (document.getElementById('clickme') != null){
document.getElementById('clickme').addEventListener('click', (event) => {
sendOnSubmitSearch();
});
};
