const sendOnSubmitToDB = (e) => {
  const getNum = document.getElementById('search_control').dataset.value
  console.log(getNum);
  const collectResultsTemp = document.getElementsByClassName('resultsIspindle');
  const collectResultsDensity = document.getElementsByClassName('resultsIspindleDensity');
  let collect_time = [];
  let collect_temp = [];
  let collect_dens = [];

  for (let i = 0; i < collectResultsTemp.length; i++ ) {
      collect_time.push(collectResultsTemp[i].dataset.time);
      collect_temp.push(collectResultsTemp[i].dataset.value);
  };

  for (let i = 0; i < collectResultsDensity.length; i++ ) {
      collect_dens.push(collectResultsDensity[i].dataset.value);
  };

  console.log(collectResultsDensity);
  let count = 0;
  for (let i = 0; i < collect_time.length; i++) {
    var mdate = collect_time[i];
    var mtemp = collect_temp[i];
    var mdens = collect_dens[i];
    var mname = collectResultsDensity[0].dataset.name;
    var mbrew = getNum;
    breakme: if (mdate && mtemp && mdens && mname && mbrew) {
      window.open("http://localhost:3000//brews/:id/ispindles/parametrage/create_ispindle?mdate="+mdate+"&mtemp="+mtemp+"&mdens="+mdens+"&mname="+mname+"&mbrew="+mbrew,"_self")
      console.log("Sending")
    }
    else
    {
        alert("Cancelled");
        break breakme;
        // return 'cancelled';
    };
  };
};

export { sendOnSubmitToDB };
