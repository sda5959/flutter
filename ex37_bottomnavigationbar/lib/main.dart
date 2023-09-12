import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex37 Bottomnavigationbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 네비게이션바에서 사용할 인덱스
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: getPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange, // 배경색
        iconSize: 30, // 아이콘 크기
        selectedItemColor: Colors.black, // 선택했을때 색깔
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedItemColor: Colors.white, // 선택되지 않았을 때 색깔
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            // 콜백된 인덱스를 통해 전역변수의 값 변경
            _curIndex = index;
          });
        },
        // 각 메뉴 구성
        items: const [
          BottomNavigationBarItem( // 각 아이콘과 텍스트 적용
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
  Widget getPage(){
    Widget? page;
    switch(_curIndex) {
      case 0:
        page = page1();
        break;
      case 1:
        page = page2();
        break;
      case 2:
        page = page3();
        break;
    }
    return page!; // null check 
  }
  Widget page1(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 50.0
            ),
            Text(
              'Page index : 0',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  Widget page2(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add_circle,
              color: Colors.orange,
              size: 50.0
            ),
            Text(
              'Page index : 1',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  Widget page3(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.notifications,
              color: Colors.blue,
              size: 50.0
            ),
            Text(
              'Page index : 2',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}