//import 'package:weather_forecast/weather_forecast/ui_homepage/midview.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/util/convert.dart';

import '../model/wether_model.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data?.city!.name;
  var country = snapshot.data?.city!.country;
  var formatteDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

  var forecast = forecastList[0];

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$city,$country",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text(
            "${Util.getFormatDate(formatteDate)}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 12,
          ),
          getweatherIcon(
              weatherDescription: forecastList[0].weather![0].main!,
              color: Colors.lightBlueAccent,
              size: 140),
          // Icon(FontAwesomeIcons.cloudSun, color: Colors.blueAccent, size: 140,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ("${forecast.temp!.day!.toStringAsFixed(0)}°F"),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("${forecast.weather![0].description!.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.speed!.toStringAsFixed(1)}mi/h"),
                      // Icon(Icons.arrow_forward,  size: 16,  color: Colors.blueGrey),
                      Icon(FontAwesomeIcons.wind)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.humidity!.toStringAsFixed(0)}%"),
                      Icon(FontAwesomeIcons.droplet)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.temp!.max!.toStringAsFixed(0)}°F"),
                      Icon(FontAwesomeIcons.temperatureHigh)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
