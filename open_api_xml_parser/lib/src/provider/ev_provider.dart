import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/model/ev.dart';
import 'package:open_api_xml_parser/src/repository/ev_repository.dart';

class EvProvider extends ChangeNotifier {

  final EvRepository _evRepository = EvRepository();

  List<Ev> _evs = [];
  List<Ev> get evs => _evs;

  loadEvs() async {
    List<Ev>? listEvs = await _evRepository.loadEvs();
    _evs = listEvs!;
    notifyListeners();
  }
}