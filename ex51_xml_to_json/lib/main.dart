import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
              ElevatedButton(
                child: const Text('JSON Parsing',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  getJsonData();
                },
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: const Text('XML Parsing',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  getXMLData();
                },
              ),
              ElevatedButton(
                child: const Text('Covid19 공공데이터 파싱',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  covid19XMLData();
                },
              ),
            ],
          ),
      ),
    );
  }
void covid19XMLData(){  
    String xmlData = '''
<response>
  <header>
    <resultCode>00</resultCode>
    <resultMsg>NORMAL SERVICE.</resultMsg>
  </header>
  <body>
    <items>
      <item>
        <createDt>2022-04-08 09:06:47.712</createDt>
        <deathCnt>18754</deathCnt>
        <decideCnt>14983694</decideCnt>
        <seq>843</seq>
        <stateDt>20220408</stateDt>
        <stateTime>00:00</stateTime>
        <updateDt>null</updateDt>
      </item>
      <item>
<createDt>2022-04-07 09:05:52.46</createDt>
<deathCnt>18381</deathCnt>
<decideCnt>14778361</decideCnt>
<seq>842</seq>
<stateDt>20220407</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:07:09.65</updateDt>
</item>
<item>
<createDt>2022-04-06 09:07:21.018</createDt>
<deathCnt>18033</deathCnt>
<decideCnt>14553541</decideCnt>
<seq>841</seq>
<stateDt>20220406</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:07:22.821</updateDt>
</item>
<item>
<createDt>2022-04-05 09:05:37.473</createDt>
<deathCnt>17662</deathCnt>
<decideCnt>14267254</decideCnt>
<seq>840</seq>
<stateDt>20220405</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:07:48.8</updateDt>
</item>
<item>
<createDt>2022-04-04 09:03:19.219</createDt>
<deathCnt>17453</deathCnt>
<decideCnt>14001148</decideCnt>
<seq>839</seq>
<stateDt>20220404</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:08:13.24</updateDt>
</item>
<item>
<createDt>2022-04-03 09:11:21.229</createDt>
<deathCnt>17235</deathCnt>
<decideCnt>13873981</decideCnt>
<seq>837</seq>
<stateDt>20220403</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:08:29.365</updateDt>
</item>
<item>
<createDt>2022-04-02 09:27:09.919</createDt>
<deathCnt>16929</deathCnt>
<decideCnt>13639715</decideCnt>
<seq>836</seq>
<stateDt>20220402</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:08:47.784</updateDt>
</item>
<item>
<createDt>2022-04-01 09:04:54.638</createDt>
<deathCnt>16590</deathCnt>
<decideCnt>13375568</decideCnt>
<seq>835</seq>
<stateDt>20220401</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2022-04-08 09:09:14.895</updateDt>
</item>
</items>
<numOfRows>10</numOfRows>
<pageNo>1</pageNo>
<totalCount>8</totalCount>
</body>
</response>
''';
Xml2Json xml2json = Xml2Json();
xml2json.parse(xmlData);
var json = xml2json.toParker();
print(json);

var data1 = jsonDecode(json);
print(data1);

List data2 = data1['response']['body']['items']['item'];
print("날짜 - 누적확진자 - 누적사망자");

for(var item in data2){
  String createDt = item['createDt'];
  int decideCnt = int.tryParse(item['decideCnt']) ?? 0;
  int deathCnt = int.tryParse(item['deathCnt']) ?? 0;
  print('$createDt - $decideCnt - $deathCnt');
  }
}
  void getJsonData(){
    String json = '''
{"items": {"item":
            [{"id": "1", "name": "홍길동"},
            {"id": "2", "name": "전우치"},
            {"id": "3", "name": "손오공"}]
            }
}
''';
var data1 = jsonDecode(json);
print(data1);

List data2 = data1['items']['item'];
print(data2);

print('=======================================');
for(int i=0; i<data2.length; i++){
  print(data2[i]['id']);
}
print('=======================================');
for(var item in data2){
  print(item['name']);
}
}
void getXMLData(){
  String xmlData = '''
<items>
  <item>
    <id>1</id>
    <name>홍길동</name>
  </item>
  <item>
    <id>2</id>
    <name>전우치</name>
  </item>
  <item>
    <id>3</id>
    <name>손오공</name>
  </item>
</items>
''';
// XML을 JSON으로 변경한 후 파싱을 진행한다
Xml2Json xml2json = Xml2Json(); // 객체 생성
xml2json.parse(xmlData);
var json = xml2json.toParker();
print(json); // <-- string데이터로 변경됨

// JSon 최초 파싱
var data1 = jsonDecode(json);
print(data1);

// 파싱을 원한 key값은 배열기호를 통해 접근
List data2 = data1['items']['item'];
print(data2);


print('===================================');
// 배열의 크기만큼 반복해서 id와 name파싱후 출력
for(int i =0; i<data2.length; i++){
  print(data2[i]['id']);
}
print('===================================');
// 개선된 for문 활용
for(var item in data2){
  print(item['name']);
}
}
}