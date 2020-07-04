function(){

karate.log("=============================================================")
    karate.log("Scenario Name: " + karate.info.scenarioName)
    karate.log("Feature File Name: " + karate.info.featureFileName)
    var config = {
        baseUrl: 'http://ergast.com/'
      };
karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}