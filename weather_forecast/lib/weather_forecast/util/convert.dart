import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getweatherIcon(
    {required String weatherDescription,
    required Color color,
    required double size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: Colors.yellow,
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: Color.fromARGB(255, 57, 46, 181),
          size: size,
        );
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudShowersHeavy,
          color: Color.fromARGB(255, 4, 156, 179),
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: Color.fromARGB(255, 191, 188, 180),
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
  }
}
