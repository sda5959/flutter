import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    ColorFilter colorFilter = ColorFilter.mode(
      Colors.white, // 원하는 색상
      BlendMode.srcIn, // 블렌딩 모드 (색상을 덮어쓰도록 설정)
    );

    if (condition < 300) {
      return ColorFiltered(
        colorFilter: colorFilter,
        child: SvgPicture.asset(
          'lib/svg/climacon-cloud_lightning.svg',
        ),
      );
    } else if (condition < 600) {
      return ColorFiltered(
        colorFilter: colorFilter,
        child: SvgPicture.asset(
          'lib/svg/climacon-cloud_snow_alt.svg',
        ),
      );
    } else if (condition == 800) {
      return ColorFiltered(
        colorFilter: colorFilter,
        child: SvgPicture.asset(
          'lib/svg/climacon-sun.svg',
        ),
      );
    } else if (condition <= 804) {
      return ColorFiltered(
        colorFilter: colorFilter,
        child: SvgPicture.asset(
          'lib/svg/climacon-cloud_sun.svg',
        ),
      );
    }

    // 위의 모든 조건을 만족하지 않으면 기본적으로 빈 컨테이너를 반환
    return Container();
  }
  Widget getAirIcon(int index){
    if(index == 1){
      return Image.asset(
        'lib/image/good.png', 
        width: 37.0, 
        height: 35.0,
      );
    } else if(index == 2){
      return Image.asset(
        'lib/image/fair.png', 
        width: 37.0, 
        height: 35.0,
      );
    } else if(index == 3){
      return Image.asset(
        'lib/image/moderate.png', 
        width: 37.0, 
        height: 35.0,
      );
    } else if(index == 4){
      return Image.asset(
        'lib/image/poor.png', 
        width: 37.0, 
        height: 35.0,
      );
    } else if(index == 5){
      return Image.asset(
        'lib/image/bad.png', 
        width: 37.0, 
        height: 35.0,
      );
    }
    return Container();
  }
    Widget getAirCondition(int index){
    if(index == 1){
      return const Text(
        '"매우좋음"', 
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 2){
      return const Text(
        '"좋음"', 
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 3){
      return const Text(
        '"보통"', 
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 4){
      return const Text(
        '"나쁨"', 
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if(index == 5){
      return const Text(
        '"매우나쁨"', 
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Container();
  }
}