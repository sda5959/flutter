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
      home: const MyHomePage(title: 'Ex16 ToggleButton_deco'),
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
  // 토글버튼에서 사용할 리스트
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
              // 여러개 선택 가능한 토글
              const Text('multi-select', textScaleFactor: 2),
              ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    // !가 변수 앞에 있으므로 Not연산자임(주의)
                    isSelected1[index] = !isSelected1[index];
                    print('isSelectde1 : $isSelected1');
                  });
                },
                // 각버튼의 값으로 사용할 List설정
                isSelected: isSelected1,
                children: const [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                // 각 버튼의 아이콘을 설정
              ),
              const SizedBox(height: 20),
              // single select 한개만 선택 가능한 토글
              const Text('single select', textScaleFactor: 2),
              ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    // 항목중 하나만 선택할 수 있도록 for문으로 처리
                    for(var i = 0; i < isSelected2.length; i++){
                      if(i == index){
                        //  선택한 항목만 활성화
                        isSelected2[i] = true;
                      }else {
                        // 반복에 의해 나머지는 비활성화 
                        isSelected2[i] = false; 
                      }
                    }
                    print('isSelected2 : $isSelected2'); // 로그용
                  });
                },
                isSelected: isSelected2,
                children: const[
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
              ),
              const SizedBox(height: 20),

              const Text('fancy', textScaleFactor: 2),
              ToggleButtons(
                borderColor: Colors.blueGrey,
                borderWidth: 10,
                selectedBorderColor: Colors.blue,
                splashColor: Colors.yellow, // 선택될 때 잠시 보인다.
                color: Colors.red, // 노멀 상태 그림의 색
                selectedColor: Colors.green, // 선택된 그림의 색
                fillColor: Colors.yellow, // 선택된 버튼의 배경색
                // disabledColor: ,
                borderRadius: BorderRadius.circular(10),
                onPressed: (int index) {
                  setState(() {
                    // 항목중 하나만 선택할 수 있도록 for문으로 처리
                    for(var i = 0; i < isSelected3.length; i++){
                      if(i == index){
                        //  선택한 항목만 활성화
                        isSelected3[i] = true;
                      }else {
                        // 반복에 의해 나머지는 비활성화 
                        isSelected3[i] = false; 
                      }
                    }
                    print('isSelected3 : $isSelected3'); // 로그용
                  });
                },
                isSelected: isSelected3,
                children: const [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Text('cake'),
                ],
              ),
            ],
          ),
      ),
    );
  }
}