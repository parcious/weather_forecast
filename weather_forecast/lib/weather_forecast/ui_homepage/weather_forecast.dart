import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/model/wether_model.dart';
import 'package:weather_forecast/weather_forecast/network/network.dart';
import 'package:weather_forecast/weather_forecast/ui_homepage/bottomview.dart';

import 'midview.dart';

class WeatherForcast extends StatefulWidget {
  const WeatherForcast({super.key});

  @override
  State<WeatherForcast> createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {
  late Future<WeatherModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    //TODO implement initState
    super.initState();
    forecastObject = getweather(_cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 171, 75, 107),
        child: ListView(
          children: [
            textFieldView(),
            Container(
              child: FutureBuilder<WeatherModel>(
                  future: forecastObject,
                  builder: (BuildContext context,
                      AsyncSnapshot<WeatherModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          midView(snapshot),
                          bottomview(snapshot, context),
                        ],
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(8)),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getweather(_cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherModel> getweather(String cityName) =>
      new Network().getweatherforecast(cityName: _cityName);
}
