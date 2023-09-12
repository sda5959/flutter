import 'package:flutter/material.dart';

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

      ),
      // 개발자가 직접 정의한 Page1클래스를 사용함
      home: const Page1(),
    );
  }
}
// stful
class Page1 extends StatefulWidget {
  
  const Page1({Key? key}) : super(key: key);


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('2페이지로 교체 ',
                                style: TextStyle(fontSize: 24)),
                // 2페이지로 전환됨 (1페이지는 사라진다)
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page2(),
                      // 초단위로 시간설정
                      transitionDuration: const Duration(seconds: 2),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        /*
                          Offset(0.0, 1.0) : 하단에서 올라옴
                          offset(1.0, 0.0) : 오른쪽에서 나옴
                          offset(0.0,-1.0) : 상단에서 내려옴
                          offset(-1.0,0.0) : 좌측에서 나옴
                         */
                        
                        var begin = const Offset(0.0, -1.0);
                        var end = Offset.zero;
                        // 일반적인 애니메이션 곡선 줄때 자세한것은 교안참조
                        var curve = Curves.elasticInOut;
                        // Tween을 사용하여 animation을 Animation으로 변환합니다.
                        var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        // slideTransition은 animation<offset>을 가져와서
                        // 애니메이션 값이 변경될 때마다 자식을 변환합니다.
                        return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                        );
                      }
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                child: const Text('3페이지로 교체',
                                style: TextStyle(fontSize: 24)),
                onPressed:() {
                  Navigator.pushReplacement(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page3(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
            ],
          ),
      ),
    );
  }
}
class Page2 extends StatefulWidget {
  
  const Page2({Key? key}) : super(key: key);


  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('3페이지로 교체 ',
                                style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page3(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                child: const Text('1페이지로 교체',
                                style: TextStyle(fontSize: 24)),
                onPressed:() {
                  Navigator.pushReplacement(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page1(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
            ],
          ),
      ),
    );
  }
}
class Page3 extends StatefulWidget {
  
  const Page3({Key? key}) : super(key: key);


  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('1페이지로 교체 ',
                                style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page1(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                child: const Text('2페이지로 교체',
                                style: TextStyle(fontSize: 24)),
                onPressed:() {
                  Navigator.pushReplacement(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (context, anim1, anim2) => const Page2(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              ),
            ],
          ),
      ),
    );
  }
}