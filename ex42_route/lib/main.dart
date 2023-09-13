import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      /*
        home과 initialRoute를 동시에 사용하면 home은 무시된다.
        즉 우선순위가 느리므로 동시에 사용하지 않는다.
      */
      // home: const MyHomePage(title: 'Ex42 Route'), // 앱첫실행시 첫페이지를 지정
      // 각각의 페이지를 생성자 호출을 통해 지정한다
      // 이름을 미리 만들어 놓은것을 route라고함,.
      initialRoute: '/page1', //첫번째 페이지 보여주기
      routes: { // 순서, 방향, 각페이지를 생성자 호출을 통해 지정
      // data라는 파라미터에 '시작'값을 전달한다.
      // 쓰는사람이 있음.
        '/page1':(context) => Page1(data: '시작'), 
        '/page2':(context) => Page2(data: '1페이지에서 보냄(1->2)'),
        '/page3':(context) => Page3(data: '1페이지에서 보냄(1->3)'),
      },
    );
  }
}
