import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageRetrive extends StatefulWidget {
  const ImageRetrive({Key? key}) :super(key: key);

  @override
  State<ImageRetrive> createState() => _ImageRetriveState();
}

class _ImageRetriveState extends State<ImageRetrive> {

  late SharedPreferences prefs;
  String imgUrl = "";

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }
   getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      imgUrl = (prefs.getString("imageUrl") ?? "");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imgUrl,
              height: 400,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}