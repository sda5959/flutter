import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  // main.dart에서 전달한 파라미터를 받기위해 변수 선언한 후 생성자에
  // 추가한다. 또한 required가 있으므로 필수적으로 받아야하는 값이 된다.
  String data = '';
  Page1({Key? key, required this.data }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('2페이지 추가',
                              style: TextStyle(fontSize: 24)),
                onPressed: () async {
                  // Route에서는 push()대신 pushNamed()(경로를지정)를쓴다
                  // 새로운 페이지에서 콜백데이터가 올때까지 대기(await)한다.
                  // 결과 데이터를 받을 변수는 var로 선언한다. String으로 받으면
                  // 에러발생됨.이미 있는 페이지를 부름
                  var result = await Navigator.pushNamed(context, '/page2');
                  print('result(from 2) : $result');
                  // 콜백 데이터를 화면에 적용하기 위해 재랜더링한다.
                  setState(() {
                    // 결과 데이터를 명시적으로 String으로 형변환후 data에 설정
                    widget.data = result as String;
                  });
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('3페이지 추가',
                              style: TextStyle(fontSize: 24)),
                // 동작방식은 동일. 콜백이 성공하면 await
                onPressed: () async {
                  await Navigator.pushNamed(context, '/page3')
                  .then((result){
                    print('result(from 3) : $result');
                    setState(() {
                      widget.data = result as String;
                    });
                  });
                },
              ),
              // 앱실행 초기에는 main.dart
              Text(widget.data, style: const TextStyle(fontSize: 30)),
            ],
          ),
      ),
    );
  }
}