import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/util/convert.dart';

import '../model/wether_model.dart';
import '../util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherModel> snapshot, int index) {
  var forecastlist = snapshot.data!.list;
  var dayoftheweek = "";
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastlist![index].dt! * 1000);
  var Fulldate = Util.getFormatDate(date);
  dayoftheweek = Fulldate.split(",")[0];

  return Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayoftheweek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: getweatherIcon(
                weatherDescription: forecastlist[index].weather![0].main!,
                color: Colors.pinkAccent,
                size: 35),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastlist[index].temp!.min!.toStringAsFixed(0)} °F"),
                  ),
                  Icon(
                    FontAwesomeIcons.arrowDownWideShort,
                    color: Color.fromARGB(255, 173, 35, 198),
                    size: 15,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastlist[index].temp!.max!.toStringAsFixed(0)} °F"),
                  ),
                  Icon(
                    FontAwesomeIcons.arrowUpWideShort,
                    color: Color.fromARGB(255, 173, 35, 198),
                    size: 15,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "hum:${forecastlist[index].humidity!.toStringAsFixed(0)} °%"),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "wind:${forecastlist[index].speed!.toStringAsFixed(0)}mi/h"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ],
  );
}
