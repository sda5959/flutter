import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      기본형인 MatrialApp을 Provider로 감싸면, 앱전체에서 사용할 수 있는
      공유 데이터가 된다.
    */
    return Provider<String>.value(
      value: '홍길동',
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page1(),
      ),
      );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) :super(key: key);


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String data = '';

  @override
  Widget build(BuildContext context) {

    data = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 1'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('2페이지 추가',
                            style: TextStyle(fontSize: 24)),
                onPressed: () {
                  // 버튼을 누르면 스택에 Page2를 추가한다.
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
              ),
              // 공유 데이터 출력
              Text('$data', style: const TextStyle(fontSize: 30)),
              // 문자열표현식만 있는 경우 문자열 보관을 사용하지 마십시오.
            ],
          ),
      ),
    );
  }
}
class Page2 extends StatefulWidget {
  const Page2({Key? key}) :super(key: key);


  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 2'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('2페이지 제거',
                            style: TextStyle(fontSize: 24)),
              ),
              /*
                공유 데이터 사용 : 데이터의 변경이 일어나면
                builder에 지정된 익명함수가 호출되고 지정된 위젯만 재빌드된다.
              */
              Consumer<String>(
                builder: (context, value, child) {
                  print("111111");
                  return Text('$value', style: const TextStyle(fontSize: 30));
                }
                ),
            ],
          ),
      ),
    );
  }
}