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
      home: const MyHomePage(title: 'Ex23 DatePicker'),
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
  String _selectedDate = DateTime.now().toString();

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
              // 현재날짜 혹은 선택한 날짜
              Text(_selectedDate, style: const TextStyle(fontSize: 30)),
            ElevatedButton(
              child: const Text('Show DatePicker',
                            style: TextStyle(fontSize: 24)),
              onPressed: () => selectDate(),
            ),
            ],
          ),
      ),
    );
  }
  // 현재 시간을 구해 주말이면 다음주 월요일을 선택한다.
  DateTime selectNowDate(){
    DateTime now = DateTime.now();
    if(now.weekday == 6){
      now = now.add(const Duration(days: 2));
    } else if(now.weekday == 7){
        now = now.add(const Duration(days: 1));
    }
    return now;
  }
  // 특정 날짜를 비활성화(오늘 날짜가 포함되면 에러발생)
  bool _predicate(DateTime day){
    
    // 1/1 ~1/30 까지 활성화
    if((day.isAfter(DateTime(2023,1,1)) && 
        day.isBefore(DateTime(2023,1,30)))) {
      return false;
    }

    // 아래와 겹치므로 하나만 주석을 해제할 것.
    // if(day.weekday != 6 && day.weekday != 7){
    //   if(day != DateTime(day.year, day.month, 25)){
    //     return true;
    //   }
    //    return true;
    // }

    // 매달 1~10일까지 비활성화 시킴
    List days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    if(!days.contains(day.day.toInt())) {
      return true;
    }
      return false;
  }

  // 데이터 피커를 오픈한다.
  Future selectDate() async{
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      // 시작화면이 연도별 선택화면이 나온다
      // initialDatePickerMode: DatePickerMode.year, 
      initialDate: selectNowDate(), // 초기날짜
      firstDate: DateTime(now.year - 2), // 선택가능 한 년도 시작(시작일)
      lastDate: DateTime(now.year + 2), // 선택가능한 년도 종료(마지막일)
      selectableDayPredicate: _predicate, // 날짜 비활성화 설정
      builder: (BuildContext context, Widget? child) {
        return Theme(
          // ThemeData.light(), // dark 테마
          // ThemeData.dark(),  // 기본 테마
          data: ThemeData(primarySwatch: Colors.pink), 
          child: child!,
        );
      },
    );
    // 여기서 사용자가 날짜를 선택할 때까지 코드가 블록됨.
    if(picked != null){
      setState(() {
        _selectedDate = picked.toString().substring(0,10);
      });
    }
  }
}
// 폰의 시간이 달라 보이는 것은 폰의 지역설정이 미국이기 때문이다.
// 폰에서 설정바꾸면됨. 코드 문제 아님.