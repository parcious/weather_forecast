import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/weather_forecast/model/wether_model.dart';

import '../util/forecast_util.dart';

class Network {
  Future<WeatherModel> getweatherforecast({required String cityName}) async {
    var finalurl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +cityName +"&appid=" + Util.appId + "&units=imperial";

    final response = await get(Uri.parse(finalurl));
    print("Url: ${Uri.encodeFull(finalurl)}");

    if (response.statusCode == 200) {
      print("Weather Data :${response.body}");
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error Getting Weather Forecast");
    }
  }
}
