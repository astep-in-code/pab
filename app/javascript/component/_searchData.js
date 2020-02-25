// Ispindle Datas
const sendOnSearchData = (e) => {
  const form = document.querySelector('form');
  const ul = document.querySelector('.list-unstyled');
  const uld = document.querySelector('.list-unstyled-d');
  const inputSearchTemperature = 'temperature';
  const inputSearchDensity = 'gravity';
  const inputNameApp = document.getElementById('nameIspindle').value;
  const tokenSearch = document.getElementById('token').value;

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

export { sendOnSearchData };
