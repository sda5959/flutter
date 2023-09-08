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
        unselectedWidgetColor: Colors.green,
        scaffoldBackgroundColor: Colors.yellow[50],
        fontFamily: 'D2Coding',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            // button
            fontSize: 30,
            height: 1.5,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Ex18 Theme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _myGroup = Fruit.banana;
  bool _chk1 = false;
  bool _chk2 = true;

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
             const Text(
                '디폴트 테마가 적용된 글자',
              ),
              TextButton(
                onPressed: () => print('aaa'),
                child: const Text('TextButton 0', style: TextStyle(
                    fontSize: 24, color: Colors.red)),
              ),
              ElevatedButton(
                child: const Text('디폴트 테마 - 버튼 0', 
                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  print('bbb');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                  shadowColor: Colors.blueAccent,
                  elevation: 5,
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: const BeveledRectangleBorder(
                    borderRadius: // 네모끝
                      BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () {
                  print('ccc');
                },
                child: const Text('글자색 변경 - 버튼 0', 
                  style: TextStyle(fontSize: 24, color: Colors.white))),
              RadioListTile<Fruit>(
                title: const Text('사과'),
                groupValue: _myGroup,
                value: Fruit.apple,
                onChanged: (Fruit? value) {
                  setState(() {
                    _myGroup = value!;
                    print(_myGroup);
                  });
                },
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.indigo,
                ), 
                child: RadioListTile<Fruit>(
                title: const Text('바나나'),
                groupValue: _myGroup,
                value: Fruit.banana,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    _myGroup = value!;
                    print(_myGroup);
                  });
                },
              ),
              ),
              Checkbox(
                value: _chk1,
                checkColor: Colors.pink,
                activeColor: Colors.green, 
                onChanged: (value) {
                  setState(() {
                    _chk1 = value!;
                  });
                }),
               Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.red,
                ), 
                child: Checkbox(
                value: _chk2,
                checkColor: Colors.pinkAccent,
                activeColor: Colors.greenAccent, 
                onChanged: (value) {
                  setState(() {
                    _chk2 = value!;
                  });
                },
              ),
              ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.thumb_up),
        label: const Text('Approve'),
        tooltip: 'Increment',
        backgroundColor: Colors.purple,
        onPressed: () {
          print('ddd');
        },
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme: ColorScheme.fromSwatch()
      //                 .copyWith(secondary: Colors.purple),
      //   ),
      //  child: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   tooltip: 'Increment',
      //   onPressed: () => (print('ddd')),
      //  ),
      // ),
    );
  }
}