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
        useMaterial3: true,
      ),
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
    print('Page1');
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
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const Page2()),
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
    print('Page2');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('3페이지 추가',
                                style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const Page3()),
                  );
                },
              ),
               ElevatedButton(
                child: const Text('2페이지 제거',
                                style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                onPressed:() {
                  print('Page2-pop');
                  Navigator.pop(context);
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
    print('Page3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              ElevatedButton(
                child: const Text('3페이지 제거',
                                style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                onPressed:() {
                  print('Page3-pop');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
  }
}
