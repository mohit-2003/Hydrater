/*
 * Copyright Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrater/utils/geolocator.dart';
import 'package:weather/weather.dart';

class MyWeather {
  String key = '4943b2cb45dc92fa7c3b5602274d24aa';
  late WeatherFactory ws;
  List<Weather> _data = [];
  double? lat, lon;

  Future<Temperature?> getTemperature() async {
    //initializing WeatherFactory
    ws = WeatherFactory(key);

    // Getting latitude and longitude
    final Position position = await determinePosition();
    lat = position.latitude;
    lon = position.longitude;
    debugPrint("Latitude: $lat Longitude: $lon");

    // Getting current weather
    Weather weather =
        await ws.currentWeatherByLocation(lat!, lon!).catchError((error) {
      debugPrint("Can't get current Weather : $error");
    });

    _data = [weather];

    debugPrint("${_data.first.temperature}");

    return _data.first.temperature;
  }
}
