import "dart:io";
import 'dart:math';
import 'dart:convert';

import '../models/guest.dart';

class Json {
  // Generate name
  String _getRandomString() {
    String chars = "AliceBoneyRobenCostaRiko";
    String rs = String.fromCharCodes(Iterable.generate(
        7, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
    return rs;
  }

  //Create GuestList
  Map<String, Object> _guestMap() {
    List guestList = [];
    for (var i = 0; i < Random().nextInt(21); i++) {
      var guestJson = {
        "name": _getRandomString(),
        "hasFriend": Random().nextBool()
      };
      guestList.add(guestJson);
    }
    Map<String, Object> guestsToMap = {"guests": guestList};
    return guestsToMap;
  }

  // Create json and write to file .json
  _getJson() async {
    File file = new File("json/guests.json");
    var toJson = json.encode(_guestMap());
    await file.writeAsString("$toJson");
  }

  //Decode Json & get Guest List
  Future<List<Guest>> fromJson() async {
    _getJson();
    List<Guest> fromJson = [];
    File file = new File("json/guests.json");
    var getJson = await file.readAsString();
    var decodeJson = json.decode(getJson);
    List guestList = decodeJson['guests'] as List;
    for (var item in guestList) {
      fromJson.add(Guest(name: item['name'], hasFriend: item['hasFriend']));
    }
    return fromJson;
  }
}