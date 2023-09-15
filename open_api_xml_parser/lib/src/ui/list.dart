import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/model/ev.dart';
import 'package:open_api_xml_parser/src/provider/ev_provider.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class ListWidget extends StatelessWidget {
  ListWidget ({Key? key}) :super(key: key);

  late EvProvider _evProvider;

Widget _makeEvOne(Ev ev) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ev.addr.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ev.chargeTp.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "충전기 명칭: ${ev.cpNm}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ev.cpStat.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ev.cpTp.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "충전소 명칭: ${ev.csNm}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "위도: ${ev.lat}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                "경도: ${ev.longi}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
Widget _makeListView(List<Ev> evs) {
  return ListView.separated(
    itemCount: evs.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 310, color: Colors.white, child: _makeEvOne(evs[index]));
    }, 
    separatorBuilder: (BuildContext context, int index) {
      return const Divider();
    }, 
  );
}
@override
Widget build(BuildContext context) {
  _evProvider = Provider.of<EvProvider>(context, listen: false);
  _evProvider.loadEvs();
  return Scaffold(
    appBar: AppBar(
      title: const Text("Ev Provider"),
    ),
    body: Consumer<EvProvider>(builder: (context, provider, wideget){
      if(provider.evs.isNotEmpty){
        return _makeListView(provider.evs);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }));
}
}