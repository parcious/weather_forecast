import 'package:flutter/material.dart';

import '../model/wether_model.dart';
import 'forecastcard.dart';

Widget bottomview(AsyncSnapshot<WeatherModel> snapshot, BuildContext context) {
  var forecastlist = snapshot.data!.list;
  return Column(
    children: [
      Text(
        "7 Day Weather forecast".toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      Container(
        height: 160,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 150,
                    child: forecastCard(snapshot, index),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff9661C3), Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
            itemCount: forecastlist!.length),
      )
    ],
  );
}
