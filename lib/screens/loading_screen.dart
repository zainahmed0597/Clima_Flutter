import 'package:flutter/material.dart';
import 'package:myapp/services/location.dart';
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
    print("initState called");
  }

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(
        'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=1724d5976c954bbed975b5b05033a1c7');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold();
  }
}
