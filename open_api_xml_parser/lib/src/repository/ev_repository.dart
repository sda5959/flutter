import 'package:open_api_xml_parser/src/model/ev.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class EvRepository{
  var apiKey =
      "xaUoWtcHs6AywaewvJPT2Sill3Oytl80Js3NGxE%2B%2F2%2FaOLPucD1HQv14QQqXAKvkPyy5lpDD6uMnH74HwM8vyw%3D%3D";

  Future<List<Ev>?> loadEvs() async {

    var addr = "인천광역시 서구";
    String baseUrl =
      "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?addr=$addr&pageNo=1&numOfRows=10&ServiceKey=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) {
      final body = convert.utf8.decode(response.bodyBytes);

      final xml = Xml2Json()..parse(body);
      final json = xml.toParker();

      Map<String, dynamic> jsonResult = convert.json.decode(json);
      final jsonEv = jsonResult['response']['body']['items'];

      if(jsonEv['item'] != null) {
        List<dynamic> list = jsonEv['item'];

        return list.map<Ev>((item) => Ev.fromJson(item)).toList();
      }
    }
    return null;
  }
}