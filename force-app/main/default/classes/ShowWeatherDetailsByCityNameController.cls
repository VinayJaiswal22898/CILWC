public class ShowWeatherDetailsByCityNameController {
    public string cityName{set;get;}
    public string WeatherResponseJSON{set;get;}
    // define the variable to show the value on vf page
    public string humudityValue{get;set;}
    public string pressureValue{get;set;}
    public string feelslikeTemp{get;set;}
    public string minTemperatureValue{get;set;}
    public string maxTemperatureValue{get;set;}
    public string averageTemperatureValue{get;set;}
    public string seaLevelValue{get;set;}
    public string grandLevelValue{get;set;}
    
      Public void GetWeatherDetails(){
          // prepare the required input
          String endPointURL = System.Label.WeatherMapApiEndPoint + cityName + '&appid=' + System.Label.WeatherMapApplicationKey;
          Http weatherHttp = new Http();
          HttpRequest weatherHttpRequest = new HttpRequest();
          weatherHttpRequest.setEndPoint(endPointURL);
          weatherHttpRequest.setMethod('GET');
          weatherHttpRequest.setTimeOut(10000);
                 
          HttpResponse weatherResponse  = weatherHttp.send(weatherHttpRequest);
          WeatherResponseJSON = weatherResponse.getBody();
          // write the code to parse the json and represent it to vf page 
          System.JSONParser wParser = System.JSON.createParser(weatherResponse.getBody());
          while(wParser.nextToken() !=null){
              if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText()== 'main'){
                  wParser.nextToken();
                  if(wParser.getCurrentToken() == JSONToken.START_OBJECT){
                    wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'temp'){
                      wParser.nextToken();
                      averageTemperatureValue = (wParser.getDecimalValue() -273.15) + 'c'; // 273.15 it will convert kelvin to celsius
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'feels_like'){
                      wParser.nextToken();
                      feelslikeTemp = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'temp_min'){
                      wParser.nextToken();
                      minTemperatureValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'temp_max'){
                      wParser.nextToken();
                      maxTemperatureValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'pressure'){
                      wParser.nextToken();
                      pressureValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'humidity'){
                      wParser.nextToken();
                      humudityValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'humidity'){
                      wParser.nextToken();
                      humudityValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'sea_level'){
                      wParser.nextToken();
                      seaLevelValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
                  wParser.nextToken();
                  if(wParser.getCurrentToken() ==JSONToken.FIELD_Name && wParser.getText() == 'grnd_level'){
                      wParser.nextToken();
                      grandLevelValue = (wParser.getDecimalValue() -273.15) + 'c';
                  }
               }  
              }
          }
          
      }
}