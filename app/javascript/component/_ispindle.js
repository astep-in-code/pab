// Ispindle Datas

// const form = document.querySelector('form');
const ul = document.querySelector('.list-unstyled');
const uld = document.querySelector('.list-unstyled-d');
const tokenDemo = 'BBFF-pHN344E9nnRodJqLHbjeAVrfundHeX3Pd9N0F0yGjMM8s8A2vznK0IU'

const sendOnSubmitSearch = () => {
  // getting user search (density or gravity allowed) => we get both data
  const inputSearchTemperature = 'temperature';
  const inputSearchDensity = 'gravity';

  // getting user name of Ispindle app
  const inputNameApp = document.getElementById('nameIspindle').value;

  // getting token from user
  const tokenSearch = document.getElementById('token').value;

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
        resultsIspindle.forEach((e) => {
          ul.insertAdjacentHTML('beforeend',
            `<li class='resultsIspindle' data-time='${e.timestamp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchTemperature} : ${e.value}</li>`
          );
        });
    console.log('First Page');
    // if (resultPage != null) {
    //   let count = 2;
    //   do {
    //     let url = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchTemperature}/values/?token=${tokenSearch}&page=${count}`;
    //     fetch(url)
    //       .then(response => response.json())
    //       .then((data2) => {

    //         let resultsIspindle2 = data2.results;
    //         // if (data2.results[0].value != undefined) {
    //         //   return test_result = true;
    //         // } else {
    //         //   return test_result = false;
    //         // };
    //         if (resultsIspindle2 != []) {
    //           resultsIspindle2.forEach((e) => {
    //             ul.insertAdjacentHTML('beforeend',
    //               `<li class='resultsIspindle' data-time='${e.timestamp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchTemperature} : ${e.value}</li>`
    //             );
    //           });
    //         };
    //         var result = data2.next;
    //     });
    //     count += 1;
    //     console.log(`Page ${count - 1} ... Loading`);
    //   }  while (count < 3);
    // };
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
        resultsIspindle3.forEach((e) => {
          uld.insertAdjacentHTML('beforeend',
            `<li class='resultsIspindleDensity' data-name='${inputNameApp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchDensity} : ${e.value}</li>`
          );
        });

      console.log('First Page');
      // if (resultPageDens != null) {
      //   let count2 = 2;
      //   do {
      //     let url2 = `https://things.ubidots.com/api/v1.6/devices/${inputNameApp}/${inputSearchDensity}/values/?token=${tokenSearch}&page=${count2}`;
      //     fetch(url2)
      //       .then(response => response.json())
      //       .then((data3) => {

      //       let resultsIspindle4 = data3.results;
      //       // if (data3.results[0].value != undefined) {
      //       //   return test_result2 = true;
      //       // } else {
      //       //   return test_result2 = false;
      //       // };
      //       if (resultsIspindle4 != []) {
      //         resultsIspindle4.forEach((e) => {
      //           uld.insertAdjacentHTML('beforeend',
      //             `<li class='resultsIspindleDensity' data-name='${inputNameApp}' data-value='${e.value}'>timestamp : ${e.timestamp} and ${inputSearchDensity} : ${e.value}</li>`
      //           );
      //         });
      //       };
      //       var result2 = data3.next;
      //     });
      //     count2 += 1;
      //     console.log(`Page ${count2 - 1} ... Loading`);
      //   } while (count2 < 3);
      // };
  });
// End of function
};
document.getElementById('search_data').addEventListener('click', (event) => {
  sendOnSubmitSearch();
});

export { sendOnSubmitSearch };
