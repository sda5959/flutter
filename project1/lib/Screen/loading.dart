import 'package:flutter/material.dart';
import 'package:project1/Screen/weather_screen.dart';
import 'package:project1/data/my_location.dart';
import 'package:project1/data/network.dart';
const apikey = 'a4f3fd9dc6a006f8e668b300302a856a';


class Loading extends StatefulWidget {
  
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
   double? latitude3;
   double? longitude3;
  
  @override
  void initState(){
    super.initState();
    getLocation();
  }


  void getLocation() async {

    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

 if (latitude3 != null && longitude3 != null) {
       Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather'
            '?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=$latitude3&lon=$longitude3&appid=$apikey');
      var weatherData = await network.getJsonData();
      print(weatherData);
      
      var airData = await network.getAirData();
      print(airData);
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherScreen(parseWeatherData: weatherData, parseAirPollution: airData);
      }));
    } else {
      // 위치 정보를 가져오지 못한 경우에 대한 처리
      print('Failed to get location data.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text(
            'Get My Location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}