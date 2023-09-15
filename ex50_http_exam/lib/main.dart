import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              // 레코드 조회
              ElevatedButton(
                child: const Text('Http (Get)',
                            style: TextStyle(fontSize: 24)),
                onPressed: () {
                  _getRequest();
                },
              ),
              // 레코드 입력
             ElevatedButton(
                child: const Text('Http (Post)',
                            style: TextStyle(fontSize: 24)),
                onPressed: () {
                  _PostRequest();
                },
              ), 
            ],
          ),
      ),
    );
  }
  void _getRequest() async {
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/1694662808294");
    http.Response response = await http.get( // json으로 가져와라
      url,
      headers: {"Accept": "application/json"}
    );
    // 접속상태
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes);

    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
    print("responseHeaders: $responseHeaders");
  }
  void _PostRequest() async {
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/");
    // 데이터를 입력해달라고 요청
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type' : 'application/x-www-form-urlencoded',
      },
      body: {
        "name": "이름",
        "tel":"010-4444-4444",
        "address":"인천광역시 서구"
      },
    );
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    var responseHeaders = response.headers;

    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
    print("responseHeaders: $responseHeaders");
  }
}