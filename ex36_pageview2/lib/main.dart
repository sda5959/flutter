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
      home: const MyHomePage(title: 'Ex36 Pageview'),
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

  final _pageController = PageController(
    initialPage: 0,
  );
  List<String> pages = ['page 1','page 2','page 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // 세개의 페이지 바로가기 버튼
                children: [
                  ElevatedButton(
                    child: const Text('page 1',
                                style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(0),
                  ),
                const SizedBox(width: 10),
                ElevatedButton(
                    child: const Text('page 2',
                                style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(1),
                  ),
                ElevatedButton(
                    child: const Text('page 3',
                                style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(2),
                  ),
                ],
              ),
              const Text(
                '터치한 후 좌우로 Swipe 하세요',
                style: TextStyle(fontSize: 24.0),
              ),
              Expanded(
                flex: 1,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return getPage(index);
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
  void onClick(int index){
    if(_pageController.hasClients){
      // 애니메이션 효과없이 화면 전환
      // _pageController.jumpToPage(index);


      //적용되 시간만큼 애니메이션 적용되어 전환
      _pageController.animateToPage(
        index,
        // duration: const Duration(microseconds: 1),
        duration: const Duration(microseconds: 400),
        curve: Curves.easeInOut, // 애니메이션 진행속도 조절
      );
    }
  }
  // 페이지 위젯을 반환
  Widget getPage(int index){
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(index),
            Text(
              pages[index],
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  Widget getIcon(int index){
    if(index == 0){
      return const Icon(Icons.camera_alt, color: Colors.red, size: 35.0);
    } else if(index == 1){
      return const Icon(Icons.add_circle, color: Colors.orange, size: 35.0);
    } else{
      return const Icon(Icons.star, color: Colors.indigo, size: 35.0);
    }
  }
}