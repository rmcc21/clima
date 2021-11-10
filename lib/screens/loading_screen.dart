import 'dart:convert';
import 'dart:html';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getWeatherData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    String apikey = "5a4bc37d8205725931050d2b57b97d16";
    Uri uri = Uri(
        host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        queryParameters: {
          "lat": location.latitude.toString(),
          "lon": location.longitude.toString(),
          "appid": apikey,
          "unit": "metric"
        });
    var data = await NetworkHelper(uri).getData();
    var weatherDescription = data['weather'][0]['description'];
    var weatherId = data['weather'][0]['id'];
    var cityName = data['name'];
    var temperature = data['main']['temp'];
    print(
        'The weather in $cityName is $weatherDescription, current temperature is ${temperature - 273}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
