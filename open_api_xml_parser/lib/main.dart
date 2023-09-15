import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/home.dart';
import 'package:open_api_xml_parser/src/provider/ev_provider.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers:[
          ChangeNotifierProvider(
            create: (BuildContext context) => EvProvider())
        ],
        child:
          const Home()
      )
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
      body: const Center(
          child: Column(
            children:<Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ]
          ),
      )
    );
  }
}