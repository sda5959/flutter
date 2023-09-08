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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.red,
        highlightColor: Colors.black.withOpacity(.5),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ListView Widget 1'),
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

  var _checkboxValue = false;
  var _radioValue = 0;
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: getMyList(),
      ),
    );
  }
  List<Widget> getMyList(){
    List<Widget> myList = [
      Container(
        // width: double.infinity, // 부모크기에 맞추기
        height: 100,
        alignment: Alignment.center,
        color: Colors.amber[600],
        child: const Text('onTab이 없어 클릭 안됨', style: TextStyle(fontSize: 30)),
      ),
      ListTile(
        title: const Text('Basic #1'),
        subtitle: const Text('타이틀과 서브 타이틀로만 구성'),
        trailing : const Icon(Icons.more_vert),
        onTap: () {
          print('Basic #1');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
        // indent: 10, // 들여쓰기
        // endIndent: 10, 
      ),
      ListTile(
        leading: const FlutterLogo( // 좌측
          size: 50.0,
        ),
        title: const Text('Basic #2'),
        trailing: const Icon(Icons.autorenew), // 우측
        onTap: () {
          print('Basic #2');          
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Basic #3'),
        subtitle: const Text('기본형의 모든 요소 사용'),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3');          
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Basic #3 - isThreeLine: false'),
        subtitle: const Text('내용이 길면 다음 줄로 내용이 넘어간다.그러나 공간이'),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine: false');          
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box,
          size: 50.0,
        ),
        title: const Text('Basic #3 - isThreeLine: true'),
        subtitle: const Text('내용이 길면 다음 줄로 내용이 넘어간다.'
        '공간도 같이 한 줄 늘어 난다.'),
        isThreeLine: true, // 텍스트를 3줄로 표현
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          print('Basic #3 - isThreeLine: true');          
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      CheckboxListTile(
        value: _checkboxValue,
        title: const Text('CheckBox ListTile'),
        secondary: _checkboxValue ? const Icon(Icons.thumb_up) : const Icon(Icons.thumb_down),
        onChanged: (bool? value) {
          setState(() {
            _checkboxValue = value!;
          });
          print('CheckBox ListTile');
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      RadioListTile(
        title: const Text('Good'),
        groupValue: _radioValue,
        value: 1,
        selected: true,
        onChanged: (int? value) {
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      RadioListTile(
        title: const Text('not Good'),
        groupValue: _radioValue,
        value: 2,
        onChanged: (int? value) {
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      const Divider(
        color: Colors.black,
        height: 5,
      ),
      SwitchListTile(
        title:const Text('Switch ListTile'),
        subtitle: Text(_switchValue?'on':'off'), // 삼항 연산자
        value: _switchValue,
        onChanged: (bool value) {
          setState(() {
            _switchValue = value;
          });
          print('Switch ListTile');
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          leading: const Icon(
            Icons.account_box,
            size: 50.0,
          ),
          title: const Text(
            'Card -> ListTile',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          subtitle: const Text('클릭시 리플 효과 표시 됨'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('fff');
          },
        ),
      ),
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: Colors.blue, // 스플래쉬색을 지정
          onTap: () {
            print('ggg');
          },
          child: const Row(
            children: [
              SizedBox(
                width: 100,
                height: 150,
                child: Icon(
                  Icons.account_tree,
                  size: 50.0,
                ),
              ),
              /*
              차지해야하는 공간보다 더 공간을 차지하게 하고 싶다면
              Flexible로 감싸주면 된다.
              */
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "location",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Population: 22 / 06 / 2020',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.data_usage),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    return myList;
  }
}