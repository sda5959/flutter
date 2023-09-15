import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  // 2단계
  late final WebViewController controller;

  @override
  void initState(){
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "JsFlutter", 
        onMessageReceived: (JavaScriptMessage message) {
          // 자바스크립트에서 플러터쪽으로 명령 보내기 처리
          // 메세지에 따라 일을 분기하여 처리
          print(message.message);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)),
          );
        }
    )
    ..loadFlutterAsset("assets/html/my.html");
  }
  // WebViewController 생성 - 1단계
  // WebViewController controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..setBackgroundColor(const Color(0x00000000))
  // ..setNavigationDelegate(
  //   NavigationDelegate(
  //     // 진행사항을 보고하기 위해 페이지가 로드될 때 호출합니다.
  //     onProgress: (int progress) { /* Update loading bar. */},
  //     // 페이지 로드가 시작되면 호출한다.
  //     onPageStarted: (String url) {},
  //     // 페이지 로드가 완료되면 호출됩니다.
  //     onPageFinished: (String url) { print("onPageFinished");},
  //     // 리소스 로딩 오류가 발생했을 때 호출된다.
  //     onWebResourceError: (WebResourceError error) {},
  //     // 탐색요청에 대한 결정이 보류중일때 호출됩니다.
  //     onNavigationRequest: (NavigationRequest request) {
  //       if(request.url.startsWith('https://www.youtube.com/')){
  //         return NavigationDecision.prevent;
  //       }
  //       return NavigationDecision.navigate;
  //     },
  //   ),
  // )
  // ..loadRequest(Uri.parse('https://flutter.dev')); // 웹뷰에 연결할 url

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 플러터 버튼에서 자바스크립트 함수를 호출하기: 카카오 맵사용시 필수
            ElevatedButton(
              onPressed: () => callJavaScript(), 
              child: const Text('Flutter에서 자바스크립트실행'),
            ),
            SizedBox(
              height: 500,
              child: WebViewWidget(
                controller: controller, 
              ),
            ),
          ],
        ),
          // child: Expanded(
          //   child: WebViewWidget(
          //     controller: controller,
          //   ),
          // ),
      ),
    );
  }
  void callJavaScript() {
    controller.runJavaScript('appToJs("안녕하세요!")');
  }
}